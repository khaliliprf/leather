param(
    [Parameter(Mandatory)]
    [ValidatePattern('^[a-z0-9]+(?:-[a-z0-9]+)*$')]
    [string]$Note
)

$ErrorActionPreference = 'Stop'
$sourceDirectory = Join-Path $PSScriptRoot $Note
if (-not (Test-Path -LiteralPath (Join-Path $sourceDirectory 'main.tex') -PathType Leaf)) {
    throw "Cannot find notes/$Note/main.tex. Pass the name of a booklet directory."
}

$engine = Get-Command xelatex -CommandType Application
$buildDirectory = Join-Path $PSScriptRoot 'build'
$workDirectory = Join-Path $buildDirectory ("$Note-" + [guid]::NewGuid().ToString('N'))
[void][IO.Directory]::CreateDirectory($workDirectory)
$logPath = Join-Path $workDirectory "$Note.log"
$pdfPath = Join-Path $buildDirectory "$Note.pdf"
$rerunPattern = 'Rerun to get (cross-references|outlines) right|Please rerun LaTeX|Please \(re\)run LaTeX'

Push-Location -LiteralPath $sourceDirectory
try {
    $maxPasses = 5
    for ($pass = 1; $pass -le $maxPasses; $pass++) {
        & $engine.Source -disable-installer -disable-write18 -interaction=nonstopmode `
            -halt-on-error -file-line-error "-output-directory=$workDirectory" "-job-name=$Note" main.tex
        if ($LASTEXITCODE -ne 0) {
            throw "XeLaTeX failed on pass $pass (exit code $LASTEXITCODE). Build files: $workDirectory"
        }

        $log = Get-Content -LiteralPath $logPath -Raw
        if ($pass -ge 2 -and $log -notmatch $rerunPattern) {
            break
        }
    }

    if ($log -match $rerunPattern -or $log -match 'undefined (references|citations)|multiply-defined labels') {
        throw "LaTeX references did not resolve. See $logPath"
    }

    $builtPdf = Join-Path $workDirectory "$Note.pdf"
    Copy-Item -LiteralPath $logPath -Destination (Join-Path $buildDirectory "$Note.log") -Force
    if ([IO.File]::Exists($pdfPath)) {
        [IO.File]::Replace($builtPdf, $pdfPath, [NullString]::Value)
    } else {
        [IO.File]::Move($builtPdf, $pdfPath)
    }
}
finally {
    Pop-Location
}

$resolvedBuildDirectory = (Resolve-Path -LiteralPath $buildDirectory).ProviderPath
$resolvedWorkDirectory = (Resolve-Path -LiteralPath $workDirectory).ProviderPath
if ((Split-Path -LiteralPath $resolvedWorkDirectory) -eq $resolvedBuildDirectory) {
    Remove-Item -LiteralPath $resolvedWorkDirectory -Recurse -Force
}
Write-Output "Built $pdfPath"
