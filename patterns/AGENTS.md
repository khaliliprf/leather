# Leather Pattern Drawings

These instructions apply to every pattern under `patterns/`.

## Pattern folders and exports

- Keep one folder per pattern. Store the original reference files, editable drawings, and exports for that pattern together. Preserve supplied references and their filenames.
- When a pattern has a source PDF, use its filename stem for the matching drawings and exports. For an original design, choose one descriptive stem and use it consistently.
- Export SVG as editable vector artwork, DXF as the fabrication drawing, and PNG at 300 DPI as a visual preview. Generate all three from the same geometry. Use millimeters and 1:1 scale in the vector exports. Use SVG or DXF as the source of manufacturing dimensions.

## Redrawing a reference

- Verify the reference scale using its calibration mark or a trusted dimension. Measure printed outlines between stroke centers where applicable. If the scale is uncertain or reference dimensions conflict, identify the unresolved dimensions before finalizing.
- Reuse reliable vector geometry when available. For raster references or artwork that cannot be extracted reliably, trace the centers of the printed outlines and locate stitch marks by their centers. Use straight lines and smooth curves that follow the intended shape.
- Include only the pattern geometry in the fabrication drawing. Omit page furniture such as titles, watermarks, and calibration marks. Preserve intentional asymmetry, internal cutouts, and piece counts.

## Designing an original pattern

- Establish the intended use, finished dimensions, contents and fit, material thickness, layer stack, and assembly method. Set piece quantities, seam allowances, stitch spacing and edge offset, and any fold or alignment guides relevant to the design.
- Document assumptions that affect fit or fabrication before finalizing. Check mating edges, stitch alignment, mirrored pieces, and clearance for folds or stacked material as applicable.

## Fabrication geometry and checks

- Put through-cuts on a dedicated layer and use one closed, continuous path per boundary or cutout. Keep stitch centers, fold guides, and engraving on separate layers according to operation. Confirm whether stitch locations should be marked or cut through. Use an agreed diameter for through-holes.
- Check cut geometry for gaps, overlaps, duplicate paths, and unintended self-intersections. Verify overall dimensions, critical measurements, and the count and placement of stitch marks.
- Reopen both vector exports and verify their units, geometry, and operation layers. For a redraw, overlay the exports on the calibrated reference and inspect the fit. Check that the PNG shows the same geometry and is free of clipping.
- Report the checks performed and any remaining uncertainty. Distinguish digital verification from print, workshop import, and physical fabrication checks.
