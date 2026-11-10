# Überlegung 2: Betrieb vor Ort und Diebstahlschutz

Stand: 10.11.2026 · Status: **offen, mit dem Betreuer zu klären** (siehe `fragen_betreuer.md`) · noch keine Quellen recherchiert

## Ausgangsfrage

Wie verhindert man, dass jemand den Kühlschrank öffnet und Ware mitnimmt? Und selbst wenn man die Tür abschließen kann: Wie stellt man fest, ob eine Person nur eine Flasche genommen hat?

## Kernpunkt: Wer steht am Anhänger?

Die Antwort hängt davon ab, ob der Anhänger **betreut** oder **unbetreut** betrieben wird.

### (a) Betreut: der Mieter verkauft selbst

Entspricht dem bisher gewählten Geschäftsmodell (Vermietung + Nutzer verdient): Der Mieter steht wie an einem Marktstand am Anhänger und verkauft.

- Diebstahlschutz während des Verkaufs ist Sache des Mieters, wie bei jedem Stand.
- Der Anhänger braucht nur Schutz **beim Transport und beim Abstellen**: abschließbare Tür bzw. Deckel, Anhänger an einem festen Gegenstand sichern.
- Geschäftsmodell, Webanwendung und Hardware bleiben wie geplant.

### (b) Unbetreut: Selbstbedienung durch die Kunden

Der Anhänger steht allein, Kunden bedienen sich selbst. Das wäre ein **anderes Geschäftsmodell** (eher mobiler Selbstbedienungskiosk) und vergrößert den Umfang deutlich.

Übliche Lösungen:

| Ansatz | Funktionsweise | Aufwand | Schutz |
|---|---|---|---|
| Vertrauenskasse | Kühlschrank offen, bezahlt wird auf Vertrauen (wie an Hofläden) | sehr gering | keiner |
| Ausgabeautomat | Spiral- oder Schachtmechanik gibt genau ein Produkt aus | hoch (Mechanik, Platz, Gewicht) | sehr gut |
| Smart Fridge mit Gewichtssensoren | Kunde entriegelt die Tür per Smartphone (QR-Code → Webanwendung), nimmt Ware, schließt die Tür; Wägezellen unter den Fächern erkennen die Entnahme; Abrechnung danach | mittel (Wägezellen, Mikrocontroller, elektronisches Schloss) | gut |
| Smart Fridge mit Kamera oder RFID | gleiches Prinzip, Erkennung per Bilderkennung oder RFID-Etikett an jedem Produkt | hoch | sehr gut |

Einschätzung (eigene Bewertung):
- Für eine Bachelorarbeit wäre die **Gewichtssensor-Lösung** am realistischsten: günstig (Wägezellen + z. B. ESP32), direkt mit der Webanwendung verbunden (Entriegeln, Abrechnung), echter technischer Beitrag.
- Sie setzt aber **Online-Zahlung in der Webanwendung** voraus. Das ist ohnehin eine offene Frage an den Betreuer.
- Zusätzliche rechtliche Fragen beim **unbetreuten Verkauf von Lebensmitteln** (Lebensmittelrecht; Jugendschutz, falls Alkohol verkauft wird).
- Ein echter Getränkeautomat scheidet aus: ca. 7,5 kWh/Tag, viel zu groß und schwer (siehe `01_recht_und_energie.md`, Abschnitt 2.1c).

## Wenn (b) gewählt wird: nächste Recherche

- Wie funktionieren unbetreute „Micro Markets“ und Smart Fridges (Anbieter, Technik, Erkennungsgenauigkeit)?
- Wägezellen-Lösungen: Genauigkeit bei Flaschen/Dosen, Temperaturdrift im Kühlschrank
- Elektronische Schlösser für 12 V, Stromverbrauch im Ruhezustand
- Rechtliches: unbetreuter Lebensmittelverkauf, Jugendschutz, Preisangaben
