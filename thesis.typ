#import "/layout/proposal_template.typ": *
#import "/layout/author_declaration.typ": *

#let metadata = toml("metadata.toml")
#set document(title: metadata.thesis.title, author: metadata.author.name)
#show: proposal.with(metadata, bib_path: "/thesis.bib")

// =============================================================================
// =============================== Front matter ================================
// =============================================================================

#table-of-contents()

// =============================================================================
// =============================== Main content ================================
// =============================================================================

#include "content/01_einleitung.typ"
#include "content/02_verwandte_arbeiten.typ"
#include "content/03_problemstellung.typ"
#include "content/04_ziel_der_arbeit.typ"
#include "content/05_meilensteinplanung.typ"

// =============================================================================
// ============================= Appendix section ==============================
// =============================================================================

#pagebreak(weak: true)

// #author_declaration(
  // metadata.author.name,
  // metadata.author.signature_place,
  // metadata.dates.submission,
  // metadata.settings.language,
// )
// #list-of-figures()
// #list-of-tables()

