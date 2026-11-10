= Meilensteinplanung

Die folgende Planung dient als grobe Orientierung und sollte an den tatsächlichen Bearbeitungszeitraum angepasst werden.

// tabularx{\textwidth}{@{}lXl@{}} with booktabs rules, as in the template
#figure(
  table(
    columns: (auto, 1fr, auto),
    stroke: none,
    align: left,
    table.hline(stroke: 0.08em),
    table.header([Meilenstein], [Ergebnis], [Zeitraum]),
    table.hline(stroke: 0.05em),
    [M1], [Thema finalisieren, Forschungsfragen präzisieren], [Woche 1],
    [M2], [Literaturrecherche und Analyse verwandter Arbeiten], [Woche 2–3],
    [M3], [Problemstellung und Zielbild finalisieren], [Woche 4],
    [M4], [Konzept, Methodik oder Lösungsansatz ausarbeiten], [Woche 5–6],
    [M5], [Umsetzung, Evaluation oder Ausarbeitung durchführen], [Woche 7–10],
    [M6], [Ergebnisse bewerten und Dokumentation abschließen], [Woche 11–12],
    table.hline(stroke: 0.08em),
  ),
  caption: [Meilensteinplanung],
) <tab:meilensteine>
