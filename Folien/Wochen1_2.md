---
marp: true
theme: HTW
paginate: true
footer: Prof. Dr.-Ing. P. W. Dabrowski - Programmierung 1 - HTW Berlin
---

# Programmierung 1 - Was tun wir hier?

* Ziele: 
  * Grundlagen des Programmierens (in Java) beherrschen
  * Einfache Algorithmen selber ausdenken und implementieren
  * Grundbegiffe der (objektorientierten) Programmierung beherrschen
* Desillusionierung:
  * Programmieren lernen ist zeitaufwendig!
  * Ich kann es Ihnen nicht beibringen!
* Wichtig: Ab anfang konsequent mitmachen

---

# Organisatorisches

* Selber programmieren wichtig -> 1 SWS VL, 3 SWS PCÜ
* Präsenzzeit reicht **nicht**!
  * Zusatzaufgaben zum selber üben
  * Wöchentliche Hausaufgaben - Prüfungszulassung ab 75% der Punkte
  * Skript bitte **lesen**, Fragen stellen (Forum, SL)! 
* Prüfungsleistung: Wie Hausaufgabe, aber größer (2 Wochen)
* Bonuspunkte für Verbesserungsvorschläge:
  * 2.5% für Vorschlag, 5% für Code (mail, pull request)
  * Max. 2 Boni pro Semester


---

# Fahrplan

* Was ist allgemein Programmierung?
* Visuelle Übungen mit "Snap!" (2 Wochen)
* "Fingerübungen" mit Java (4 Wochen)
* Anwendungsaufgaben (6 Wochen):
  * Arrays
  * Grundlagen der Objektorientierung
  * Externe Bibliotheken am Beispiel von Plots
* Puffer (1 Woche)

---

# Was ist Programmierung?

* Wie mit jemandem reden, der gar nicht mitdenkt
* Anweisungen müssen extrem exakt formuliert sein
* Einfachste Herangehensweise:
  * Problem selber lösen
  * Sich selber dabei beobachten ("warum tue ich das gerade?")
  * Beobachtungen idiotensicher zum Nachkochen aufschreiben

---

# Beispiel Programmierung

* Schreiben Sie ein Programm, das mich zur Tür bringt
* Erlaubte Befehle:
  * "Schritt": Ich mache einen Schritt
  * "Drehen": Ich drehe mich um 90 Grad nach links
* Freiwillige/r an der Tafel
* Bitte mich nicht umbringen!

---

# Snap! - erste Beispiele

* [Beispiel 1](https://snap.berkeley.edu/project?user=piotrdabrowski&project=Prog1-Beispiel1): Die Übung eben in Snap!
* Aber: Das funktioniert nur in diesem einen Fall!
* [Beispiel 2](https://snap.berkeley.edu/project?user=piotrdabrowski&project=Prog1-Beispiel2): Generischer, wir brauchen zusätzliche Konzepte:
  * `if Bedingung`: Dinge nur tun, falls `Bedingung` erfüllt ist
  * `stop all`: Programm beenden
* Eleganter mit
  * `repeat until Bedingung`: Dinge tun, bis `Bedingung` erfüllt ist

---

# Snap! - komplexeres Beispiel

* [Beispiel 3](https://snap.berkeley.edu/project?user=piotrdabrowski&project=Prog1-Beispiel3): Tür finden
    * `forever`: "Endlosschleife", tut Dinge bis sie explizit unterbrochen wird
* Das dauernde Wiederholen von "umdrehen, gucken, umdrehen" ist nicht elegant
* Schöner: `Build a block`: Eigene Funktion `check for door left` definieren, die wiederverwendet werden kann
* Ausprobieren mit background "map3.1"

---

# Snap! - weitere Konzepte

* Aufhübschung von [Beispiel 3](https://snap.berkeley.edu/project?user=piotrdabrowski&project=Prog1-Beispiel3): 
    * Argument in Funktion nehmen - `check for door Richtung` überprüft Tür in `Richtung` anstatt nur links (siehe `turn`)
    * Funktion `is Richtung of door` mit Rückgabewert (`true` oder `false`): Kann in `if` verwendet werden (siehe `in front of Farbe`)