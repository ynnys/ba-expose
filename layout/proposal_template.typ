#import "@preview/numbly:0.1.0": numbly
#import "@preview/linguify:0.4.2": *
#import "./titlepage.typ": *

// Layout matches the official THA exposé template (LaTeX, KOMA scrreprt):
//   12pt, a4paper, oneside · helvet (scaled = 0.95) as default font
//   geometry margin = 25mm · \onehalfspacing · chapter red, section gray
//   hyperref colorlinks in THA red

#let tha-red = rgb("#E60046")
#let tha-gray = rgb("#4A4A4A")

// Helvetica clone; [scaled]{helvet} sets 12pt text at 95 % = 11.4pt
#let main-font = "Nimbus Sans L"
#let font-scale = 0.95
#let base-size = 12pt * font-scale

// \onehalfspacing at 12pt: baselineskip 14.5pt × 1.241 ≈ 18pt.
// Typst measures leading from baseline to the cap height of the next line,
// so leading = 18pt − cap height (0.718em for Helvetica).
#let baseline-skip = 18pt
#let line-leading = baseline-skip - 0.718 * base-size

#let proposal(
  metadata,
  bib_path: "",
  is_print: false,
  body,
) = {
  // Load linguify translations
  let lang-data = (
    conf: (
      default-lang: "de",
    ),
    lang: (
      de: toml("./i18n/de.toml"),
      en: toml("./i18n/en.toml"),
    ),
  )
  set-database(lang-data)

  set text(
    lang: metadata.settings.language,
    font: main-font,
    size: base-size,
  )

  // --- Paragraphs: KOMA default (indented, no extra space between paragraphs) ---
  set par(leading: line-leading, spacing: line-leading, justify: true, first-line-indent: 1em)

  // --- Page: geometry margin = 25mm, pagestyle plain (number centered in footer) ---
  // \pagenumbering{Roman} before the first chapter (table of contents),
  // arabic from the first chapter on. The footer picks the format itself,
  // because explicit page() calls for the TOC would add an empty page.
  set page(
    paper: "a4",
    margin: 25mm,
    numbering: "1",
    footer: context {
      let chapters = query(heading.where(level: 1)).filter(h => h.numbering != none)
      let roman = chapters.len() > 0 and here().page() < chapters.first().location().page()
      align(center, counter(page).display(if roman { "I" } else { "1" }))
    },
  )

  titlepage(metadata, tha-red: tha-red, tha-gray: tha-gray, scale: font-scale)

  // --- Links (hyperref colorlinks: linkcolor, urlcolor, citecolor = THARed) ---
  show link: set text(fill: tha-red)
  show ref: set text(fill: tha-red)
  show cite: set text(fill: tha-red)

  show math.equation: set text(weight: 400)
  show math.equation: math.upright

  // --- Equations ---
  set math.equation(numbering: (..num) => numbering("(1.1)", counter(heading).get().first(), num.pos().first()))

  // --- Headings: KOMA sans bold; chapter \huge red, section \Large gray, subsection \large ---
  set heading(numbering: "1.1")

  show heading: it => {
    // scrreprt numbers chapter, section, subsection
    let should-number = it.level <= 3 and it.numbering != none

    let (size, fill, above, below) = if it.level == 1 {
      (24.88pt * font-scale, tha-red, 0pt, 1.725 * baseline-skip)
    } else if it.level == 2 {
      (17.28pt * font-scale, tha-gray, 3.5 * 0.523 * base-size + baseline-skip / 2, 2.3 * 0.523 * base-size)
    } else if it.level == 3 {
      (14.4pt * font-scale, black, 3.25 * 0.523 * base-size + baseline-skip / 2, 1.5 * 0.523 * base-size)
    } else {
      (base-size, black, 3.25 * 0.523 * base-size + baseline-skip / 2, 1.5 * 0.523 * base-size)
    }

    set text(size: size, fill: fill, weight: "bold")
    set par(justify: false, first-line-indent: 0em, leading: 0.4em)

    if it.level == 1 {
      // \chapter starts a new page (\clearpage in oneside mode). The break has
      // to come first: counter updates before it would count as content and
      // leave an empty page.
      pagebreak(weak: true)
      counter(math.equation).update(0)
      counter(figure.where(kind: image)).update(0)
      counter(figure.where(kind: table)).update(0)
      counter(figure.where(kind: raw)).update(0)
      v(3.3 * baseline-skip)
    }

    let content = if should-number {
      grid(
        columns: (auto, 1fr),
        column-gutter: if it.level == 1 { 0.6em } else { 0.8em },
        counter(heading).display(it.numbering), it.body,
      )
    } else {
      it.body
    }

    block(above: above, below: below, sticky: true, content)
  }

  // --- Citation Style ---
  set cite(style: "ieee")

  // --- Figures: numbered per chapter, table captions above (as in the template) ---
  set figure(numbering: (..num) => numbering("1.1", counter(heading).get().first(), num.pos().first()))
  show figure.where(kind: table): set figure.caption(position: top)
  // \intextsep (14pt) around figures, \abovecaptionskip (10pt) to the caption
  show figure: set block(above: 14pt + line-leading, below: 14pt + line-leading)
  set figure(gap: 10pt)

  // --- Lists: LaTeX defaults (size12.clo: \itemsep + \parsep = 10pt between
  //     items, \topsep = 10pt above and below the list) ---
  set list(marker: ([•], [–], [∗], [·]), spacing: line-leading + 10pt)
  set enum(spacing: line-leading + 10pt)
  show list: set block(above: line-leading + 10pt, below: line-leading + 10pt)
  show enum: set block(above: line-leading + 10pt, below: line-leading + 10pt)

  // --- Tables: with \onehalfspacing a tabular row is one baselineskip (18pt)
  //     high; cell height = cap height + 2 × inset ---
  set table(inset: (x: 6pt, y: (baseline-skip - 0.718 * base-size) / 2))
  set enum(full: true, numbering: numbly(
    "{1:1}.",
    "{2:(a)}",
    "{3:i}.",
    "{4:A}.",
  ))

  body

  // thebibliography: unnumbered chapter, not listed in the table of contents
  show bibliography: set heading(outlined: false)
  pagebreak(weak: true)
  bibliography(title: linguify("bibliography"), bib_path, style: "ieee")
}

#let toc-pages() = {
  set heading(numbering: none)
  // only the entry text is colored, not the dot leaders and page numbers
  show link: set text(fill: black)

  // KOMA TOC: chapter entries bold without dot leaders; hyperref colors the entry text
  show outline.entry: it => {
    let entry-text = text(fill: tha-red)[#if it.prefix() != none [#it.prefix() ]#it.body()]
    if it.level == 1 {
      v(baseline-skip / 2, weak: true)
      link(it.element.location(), it.indented(none, text(weight: "bold")[#entry-text #h(1fr) #it.page()]))
    } else {
      link(it.element.location(), it.indented(none, [#entry-text #box(width: 1fr, it.fill) #it.page()]))
    }
  }

  // Title as a separate heading so the page counter can be reset after its
  // page break (an update before the break would leave an empty page).
  heading(outlined: false, linguify("tableOfContents"))
  counter(page).update(1)
  outline(
    title: none,
    depth: 3,
    indent: n => {
      if n == 0 { 0em } else if n == 1 { 1.5em } else { 3.8em }
    },
  )
}

// Roman page numbers here, arabic from chapter 1 on (format chosen by the
// footer in proposal()). The counter is reset after an explicit page break,
// so the TOC shows the right page for chapter 1 and the chapter heading's
// weak page break collapses instead of adding an empty page.
#let table-of-contents() = {
  toc-pages()
  pagebreak()
  counter(page).update(1)
}

#let list-of-figures() = {
  set heading(numbering: none)
  heading(linguify("listOfFigures"))
  outline(
    title: none,
    target: figure.where(kind: image),
  )
  pagebreak(weak: true)
}

#let list-of-tables() = {
  set heading(numbering: none)
  heading(linguify("listOfTables"))
  outline(
    title: none,
    target: figure.where(kind: table),
  )
}
