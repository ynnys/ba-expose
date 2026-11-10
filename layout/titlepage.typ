#import "./utils/helpers.typ": format_date, toml_to_datetime
#import "@preview/linguify:0.4.2": linguify

// Title page as in the official THA exposé template (main.tex, titlepage):
// university and faculty top left, logo top right, red title, gray subtitle,
// and a booktabs table with the document data at the bottom.
#let titlepage(
  metadata,
  tha-red: rgb("#E60046"),
  tha-gray: rgb("#4A4A4A"),
  scale: 0.95,
) = {
  let logo_path = "./figures/Logo.svg"
  // The metadata uses "\n" for the multi-line layout of the thesis template.
  let one-line(s) = s.replace("\n", " ")

  // titlepage environment: its own page without a page number
  page(numbering: none, header: none, footer: none)[
  #set par(justify: false, first-line-indent: 0em)
  #{

  // \noindent minipage{0.58\textwidth} \hfill minipage{0.35\textwidth}
  grid(
    columns: (58%, 1fr, 35%),
    align: (left + top, auto, right + top),
    [
      #text(fill: tha-red, weight: "bold")[#one-line(metadata.university.name)] \
      #v(2mm, weak: true)
      #text(size: 14.4pt * scale)[#one-line(metadata.thesis.faculty)]
    ],
    [],
    image(logo_path, width: 90%),
  )

  v(35mm)

  // {\Huge\bfseries\color{THARed}\Titel\par}
  block(text(size: 24.88pt * scale, weight: "bold", fill: tha-red, metadata.thesis.title))
  // \vspace{6mm} {\Large\color{THAGray}\Untertitel\par}
  let subtitle = metadata.thesis.at("subtitle", default: "")
  if subtitle != "" {
    v(6mm)
    block(text(size: 17.28pt * scale, fill: tha-gray, subtitle))
  }

  v(1fr)

  // tabularx{\textwidth}{@{}lX@{}} with \toprule / \bottomrule, \arraystretch 1.25
  let rule = 0.08em
  table(
    columns: (auto, 1fr),
    stroke: none,
    // \arraystretch 1.25 with \onehalfspacing: rows of 1.25 × 18pt;
    // cell height = cap height (0.718em) + 2 × inset
    inset: (x: 0pt, y: (1.25 * 18pt - 0.718 * 12pt * scale) / 2),
    column-gutter: 12pt,
    table.hline(stroke: rule),
    [#linguify("documentType")], [#metadata.thesis.type],
    [#linguify("author")], [#metadata.author.name],
    [#linguify("enrolmentNumber")], [#metadata.author.enrolment_no],
    [#linguify("studyProgram")], [#metadata.thesis.study_program],
    [#linguify("advisor")], [#metadata.thesis.supervisor],
    [#linguify("submissionDate")],
    [#format_date(toml_to_datetime(metadata.dates.submission), metadata.settings.language)],
    table.hline(stroke: rule),
  )
  }
  ]
}
