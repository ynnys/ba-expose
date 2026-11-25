= Ziel der Arbeit

// ENTWURF (Claude, 23.11.2026) – Quellen fehlen noch, siehe Kommentare "QUELLE:".
// Vorläufige Annahmen bis zur Klärung mit dem Betreuer (fragen_betreuer.md):
// betreuter Betrieb, keine Online-Zahlung in der Webanwendung.

== Hauptziel
Ziel der Arbeit ist die Entwicklung eines solarbetriebenen Kühlanhängers für Fahrräder als Prototyp sowie einer Webanwendung, über die solche Anhänger an festen Standorten angeboten, gebucht und verwaltet werden können. Der Anhänger soll gekühlte Ware während eines Verkaufstages ohne Netzanschluss bereithalten und von einem handelsüblichen Fahrrad gezogen werden können. Die Webanwendung soll nicht nur für den Prototyp, sondern für eine Flotte mehrerer Anhänger ausgelegt sein.

Am Ende der Arbeit liegen ein fahrbereiter Prototyp, eine lauffähige Webanwendung sowie eine Dokumentation von Konzept, Umsetzung und Erprobung vor.

== Teilziele

=== Anhänger
Am Anfang steht die Ermittlung der rechtlichen und technischen Anforderungen an den Anhänger. Grundlage dafür sind insbesondere §§ 63a und 67a StVZO @stvzo // QUELLE: StVZO
sowie DIN EN 17860-7, die für Lastenanhänger bis 600 kg den Stand der Technik beschreibt @din_en_17860_7. // QUELLE: DIN EN 17860-7
Daraus entsteht ein Anforderungskatalog, gegen den der Prototyp später geprüft wird.

Darauf aufbauend wird das Energiesystem ausgelegt. Aus dem Verbrauch des Kühlgeräts und dem Solarertrag am Standort Augsburg // QUELLE: PVGIS
werden die Leistung des Solardachs und die Kapazität des Speichers bestimmt, und es wird ein geeignetes Kühlgerät ausgewählt. Als Kriterium gilt, dass die Kühlung an einem Sommertag einen Verkaufstag von acht Stunden ohne Netzanschluss überbrücken muss.

Anschließend wird der Anhänger konstruiert. Der Aufbau basiert auf Aluminium-Systemprofilen und ist höchstens 1000 mm breit, damit vorne keine Leuchte vorgeschrieben ist @stvzo[§ 67a] und Radwege nutzbar bleiben. Zur Konstruktion gehören außerdem Kupplung und Deichsel, Beleuchtung, eine Feststellfunktion, eine Sicherung gegen Diebstahl beim Abstellen sowie Werbeflächen. Eine Gewichtsbilanz entscheidet, ob der Anhänger unter der Grenze von 100 kg Gesamtmasse bleibt, ab der DIN EN 17860-7 eine Auflaufbremse verlangt @din_en_17860_7[Abschn. 5.8.1], oder ob eine solche Bremse vorgesehen wird.

Schließlich wird der Prototyp aufgebaut und in einem Feldtest erprobt. Dabei werden Innentemperatur, Solarertrag und Ladezustand des Speichers über einen Verkaufstag gemessen. Zusätzlich werden die Anforderungen der Norm geprüft, die sich ohne Prüfstand nachweisen lassen, etwa die Feststellfunktion an 16 % Gefälle und die statische Kippstabilität @din_en_17860_7[Abschn. 5.9, 5.10].

=== Webanwendung
Für die Webanwendung werden zunächst die Anforderungen analysiert und die Use Cases und Rollen festgelegt, mindestens für Mieter und Betreiber. Mieter sind beispielsweise Vereine oder Verkäufer, die den Anhänger gegen eine Gebühr mieten und daraus selbst verkaufen.

Auf dieser Grundlage wird die Webanwendung umgesetzt. Sie umfasst die Verwaltung von Anhängern und Standorten, eine Kartenansicht der Standorte auf Basis von OpenStreetMap mit Links zur Navigation sowie die Buchung eines Anhängers für einen Zeitraum mit Anzeige der Mietgebühr und anschließender Bestätigung durch den Betreiber. Buchungsanfragen und Bestätigungen werden als Dokument erzeugt, und die Buchungsdaten lassen sich exportieren.

Zuletzt wird die Webanwendung auf einem Server bereitgestellt, entweder auf einer virtuellen Maschine im Rechenzentrum der Hochschule oder bei einem Webhoster. Die zentralen Abläufe, also Registrierung, Buchung und Bestätigung, werden mit automatisierten Tests abgedeckt.

== Abgrenzung
Da in der Arbeit nur ein Prototyp entsteht, entfallen eine vollständige Prüfung nach DIN EN 17860-7 mit Dauerprüfungen am Prüfstand sowie eine Zertifizierung des Anhängers. Ebenso sind weder eine Serienfertigung noch ein elektrischer Hilfsantrieb vorgesehen.

Auf Seiten der Software wird keine native App entwickelt; stattdessen entsteht eine Webanwendung, die auch auf Smartphones nutzbar ist. Die Mietzahlung wickelt die Anwendung nicht selbst ab: Sie zeigt die Preise an, abgerechnet wird außerhalb der Anwendung.

Auch der Betrieb ist bewusst eingegrenzt. Der Mieter verkauft selbst aus dem Anhänger, sodass ein unbetreuter Selbstbedienungsbetrieb mit Bezahlterminal oder einer Erkennung entnommener Ware nicht Teil der Arbeit ist. Lebensmittel- und gewerberechtliche Fragen des Verkaufs sowie die Gründung einer Betreiberfirma werden ebenfalls nicht behandelt.
