= Ziel der Arbeit

// ENTWURF (Claude, 23.11.2026) – Quellen fehlen noch, siehe Kommentare "QUELLE:".
// Vorläufige Annahmen bis zur Klärung mit dem Betreuer (fragen_betreuer.md):
// betreuter Betrieb, keine Online-Zahlung in der Webanwendung.

== Hauptziel
Ziel der Arbeit ist die Entwicklung eines solarbetriebenen Kühlanhängers für Fahrräder als Prototyp sowie einer Webanwendung, über die solche Anhänger an festen Standorten angeboten, gebucht und verwaltet werden können. Der Anhänger soll gekühlte Ware während eines Verkaufstages ohne Netzanschluss bereithalten und von einem handelsüblichen Fahrrad gezogen werden können. Die Webanwendung soll nicht nur für den Prototyp, sondern für eine Flotte mehrerer Anhänger ausgelegt sein.

Am Ende der Arbeit liegen ein fahrbereiter Prototyp, eine lauffähige Webanwendung sowie eine Dokumentation von Konzept, Umsetzung und Erprobung vor.

== Teilziele

=== Anhänger
+ *Anforderungen ermitteln.* Die rechtlichen und technischen Anforderungen an den Anhänger werden zusammengestellt, insbesondere aus §§ 63a und 67a StVZO @stvzo // QUELLE: StVZO
  und aus DIN EN 17860-7, die für Lastenanhänger bis 600 kg den Stand der Technik beschreibt @din_en_17860_7. // QUELLE: DIN EN 17860-7
  Ergebnis ist ein Anforderungskatalog, gegen den der Prototyp später geprüft wird.

+ *Energiesystem auslegen.* Aus dem Verbrauch des Kühlgeräts und dem Solarertrag am Standort Augsburg // QUELLE: PVGIS
  werden die Leistung des Solardachs und die Kapazität des Speichers bestimmt. Kriterium: Die Kühlung muss an einem Sommertag einen Verkaufstag von acht Stunden ohne Netzanschluss überbrücken. Dazu wird ein geeignetes Kühlgerät ausgewählt.

+ *Anhänger konstruieren.* Der Aufbau wird auf Basis von Aluminium-Systemprofilen entworfen, mit einer Breite von höchstens 1000 mm, damit vorne keine Leuchte vorgeschrieben ist @stvzo[§ 67a] und Radwege nutzbar bleiben. Teil der Konstruktion sind Kupplung und Deichsel, Beleuchtung, Feststellfunktion, eine Sicherung gegen Diebstahl beim Abstellen sowie Werbeflächen. Eine Gewichtsbilanz entscheidet, ob der Anhänger unter der Grenze von 100 kg Gesamtmasse bleibt, ab der DIN EN 17860-7 eine Auflaufbremse verlangt @din_en_17860_7[Abschn. 5.8.1], oder ob eine solche Bremse vorgesehen wird.

+ *Prototyp bauen und erproben.* Der Prototyp wird aufgebaut und in einem Feldtest erprobt. Gemessen werden Innentemperatur, Solarertrag und Ladezustand des Speichers über einen Verkaufstag. Zusätzlich werden die Anforderungen der Norm geprüft, die sich ohne Prüfstand nachweisen lassen, etwa die Feststellfunktion an 16 % Gefälle und die statische Kippstabilität @din_en_17860_7[Abschn. 5.9, 5.10].

=== Webanwendung
+ *Anforderungen analysieren.* Use Cases und Rollen werden festgelegt, mindestens für Mieter und Betreiber. Mieter sind z. B. Vereine oder Verkäufer, die den Anhänger gegen eine Gebühr mieten und daraus selbst verkaufen.

+ *Webanwendung umsetzen.* Umgesetzt werden die Verwaltung von Anhängern und Standorten, eine Kartenansicht der Standorte auf Basis von OpenStreetMap mit Links zur Navigation, die Buchung eines Anhängers für einen Zeitraum mit Anzeige der Mietgebühr sowie die Bestätigung durch den Betreiber. Buchungsanfragen und Bestätigungen werden als Dokument erzeugt; Buchungsdaten lassen sich exportieren.

+ *Bereitstellen und testen.* Die Webanwendung wird auf einem Server betrieben, entweder auf einer virtuellen Maschine im Rechenzentrum der Hochschule oder bei einem Webhoster. Die zentralen Abläufe (Registrierung, Buchung, Bestätigung) werden mit automatisierten Tests abgedeckt.

== Abgrenzung
Nicht Bestandteil der Arbeit sind:
- eine vollständige Prüfung nach DIN EN 17860-7; Dauerprüfungen am Prüfstand und eine Zertifizierung entfallen, da nur ein Prototyp entsteht;
- eine Serienfertigung sowie ein elektrischer Hilfsantrieb des Anhängers;
- eine native App; die Anwendung wird als Webanwendung umgesetzt, die auch auf Smartphones nutzbar ist;
- die Abwicklung der Mietzahlung in der Webanwendung; Preise werden angezeigt, abgerechnet wird außerhalb der Anwendung;
- ein unbetreuter Selbstbedienungsbetrieb; der Mieter verkauft selbst, deshalb sind weder Bezahlterminal noch Erkennung entnommener Ware vorgesehen;
- lebensmittel- und gewerberechtliche Fragen des Verkaufs sowie die Gründung einer Betreiberfirma.
