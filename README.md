# THA Thesis Template

An attempt to port the official THA LaTeX template to Typst, a more modern alternative that's much easier to author than a 40-year-old markup language.

## Quick Start

1. Install [Typst](https://github.com/typst/typst)
2. Edit `metadata.toml` with your thesis information
3. Write your content in `content/`
4. Compile: `typst compile thesis.typ`

## Configuration

All settings are in `metadata.toml`:

```toml
[author]
name = "Your Name"
email = "your.email@tha.de"

[thesis]
title = "Your Thesis Title"
type = "Bachelorarbeit"
faculty = "Fakultät für\nInformatik"

[settings]
language = "de"  # "de" or "en"
```

## License

CC0 1.0 Universal - Public Domain

---

Based on the official THA LaTeX template.
