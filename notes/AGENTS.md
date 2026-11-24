# Technical Booklets

## Structure and typography

- Give each booklet a kebab-case directory under `notes/`, a UTF-8 `main.tex` entry point, and an `assets/` directory for its figures. Use the shared preamble and follow the layout in `template/main.tex`. Keep build instructions in `README.md`.
- Use right-to-left A4 layout and load B Nazanin from `notes/assets/B-NAZANIN.TTF`. Use the shared cover, heading hierarchy, running header, page numbering, and caption spacing. Use restrained color and keep distinctions legible in grayscale.
- Number tables and figures, give each a descriptive caption, and refer to it in the text. Put table captions above tables and figure captions below figures. Put units in table headings where they apply to a whole column.

## Scientific Persian

- Follow the Academy of Persian Language and Literature's [Dastur-e Khatt-e Farsi (1401 Solar Hijri edition)](https://parsianjoman.org/wp-content/uploads/2023/08/Dastour-e-Khat.pdf). Review spelling, compounds, affixes, and ezafe. Use Persian ی and ک, the zero-width non-joiner where required, Persian punctuation and quotation marks, and consistent spacing around punctuation.
- Type ezafe after silent heh as ۀ (for example, نمونۀ). The supplied B Nazanin file lacks the combining hamza above used by the alternate encoding.
- Write formal, direct prose. Give a precise definition before relying on a technical term, use one term consistently, and give the English form at first mention when it helps readers identify the concept. Use `\lr{...}` for left-to-right phrases and check their punctuation in context.
- Use Persian digits in Persian prose and keep the original notation in identifiers, codes, and citations where needed. Use millimeters for thickness and workshop dimensions. Separate a quantity from its unit with a nonbreaking space and apply one decimal and range convention consistently.
- Distinguish published findings, measurements of a specific sample, and practical starting points. State the conditions and limits of a measurement or recommendation where they affect its use. Compare values measured on the same basis and avoid precision beyond the evidence.

## Evidence and delivery

- Cite technical definitions, measurements, and processing claims near the text they support. Prefer standards and identifiable primary sources. Record the verified title, author or organization, year, version, and relevant section or page when available. Use a consistent citation style and identify sources independently of repository paths.
- Use identifiable photographs of the relevant material when presenting leather types. Record the source URL, creator, redistribution license, and any edits in the booklet. Label illustrations as such and keep all required assets in the repository.
- Build with `notes/build.ps1` and keep generated files in `notes/build/`. Read the final log and render every page. Check font embedding, Persian and English direction, page breaks, margins, tables, figures, grayscale readability, and resolved links and references.
