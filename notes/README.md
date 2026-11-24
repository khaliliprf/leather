# Leathercraft booklets

## Build requirements

- PowerShell 7 on Windows, with MiKTeX's `xelatex` on `PATH`.
- In MiKTeX Console, install `xepersian`, `fontspec`, `graphics` (provides `graphicx`), `booktabs`, `geometry`, `xcolor`, `fancyhdr`, `hyperref`, and their dependencies. The build script disables on-the-fly package installation.
- The shared preamble loads B Nazanin directly from `assets/B-NAZANIN.TTF`. No system font installation is required.

## Create and build a booklet

Use [the template](template/main.tex) as the starting point for the UTF-8 entry point in `notes/<booklet-name>/main.tex`. Store figures in that booklet's `assets/` directory. Use the shared preamble and keep longer sections in separate `.tex` files loaded with `\input`. Follow [the booklet rules](AGENTS.md) for Persian writing, citations, and layout.

From the repository root, replace `booklet-name` with the booklet's directory name and run:

```powershell
.\notes\build.ps1 -Note booklet-name
```

Pass `-Note template` to build the example. The script writes the PDF and log to `notes/build/`. On a failed build, follow the path in the error message for the intermediate files and log.
