#import "@preview/touying:0.6.1": *
#import "@preview/colorful-boxes:1.3.1": *
#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond, ellipse
#import "@preview/numbly:0.1.0": numbly
#import themes.university: *
#import "@preview/codelst:2.0.2": sourcecode

#set text(
  hyphenate: true,
  lang: "de"
)

#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Programmierung 1 (IKG)],
    date: "WiSe 25/26",
    institution: "HTW Berlin",
    author: "Prof. Dr.-Ing. P. W. Dabrowski"
  ),
  config-colors(
    primary: rgb("#76b900"),
    secondary: rgb("#0082D1"),
    tertiary: rgb("#FF5F00"),
    neutral-lightest: rgb("#ffffff"),
    neutral-darkest: rgb("#000000"),
  )
)

#show link: underline

#title-slide()


#set text(
  hyphenate: true,
  lang: "de"
)

#show: university-theme.with(
  color-a: rgb("#76B900"),
  color-b: rgb("#0082D1"),
  color-c: rgb("#EDf5DF"),
  short-title: "Programmierung 1 IKG",
  short-date: "WiSe 24/25"
)

#show link: underline

#title-slide(
  title: "Programmierung 1",
  subtitle: "Wochen 3-4: Der Schritt zu Java",
  date: "24.10.2024",
  institution-name: "HTW Berlin"
)

== Datentypen

- Bisher angenommen: Ein Wert = eine Speicheradresse
- Aber: Eigentlich kann der Computer nur 1 und 0 (bit)
- Binärsystem: 
    * Wie 10er-System, aber mit nur 2 Ziffern.
    * Umrechnung mit 2er statt 10er Potenzen, Beispiel: Addition
- Definierte Breite einer Zahl: 8 bit = 1 byte -> 0 - 255
- Datentypen: Sagen dem Computer, was der Speicherinhalt bedeutet
    - `int`, `long`: Ganze Zahl
    - `float`, `double`: Gleitkommazahl
    - `char`: Buchstabe (mit Hochkomma: `char x = 'a';`)
    - `boolean`: Ja/nein (`true` oder `false`)

== Herausforderungen

- Was tut man, um: 
  * Zahlen größer 255 zu speichern?
  * Zahlen kleiner 0 zu speichern?
  * Gelitkommazahlen zu speichern?
  * Buchstaben zu speichern?
- Murmelgruppen, 5 Minuten

== Zahlen größer als 0

- Mehrere bytes zu einer Zahl zusammengefasst
- Architekturabhängig, wie "breit" Zahlen sind
- Java macht es einheitlich:
  - `byte`: 1 byte -> [-128, 127]
  - `short`: 2 byte -> [-32768, 32767]
  - `int`: 4 byte -> [-2147483648, 2147483647]
  - `long`: 8 byte -> [-9223372036854775808, 9223372036854775807]
  - Optional `unsigned` -> kein Zweierkomplement, höherer Maximalwert


== Zweierkomplement

- Einfache Lösung: Erstes bit ist Vorzeichen (z.B. 3 = `0011`, -3=`1011`)
- Probleme: 
  * 0 "doppelt" (`0000`, `1000`)
  * Addition schwierig (z.B. `0011+1011=1110`=-6?)
- Zweierkomplement: Erstes bit ist -1*Max. (z.B. -8=`1000`, -5=`1011`)
- Vorteile:
  * 0 nur ein Mal (`0000`, `1000`=-8)
  * Einfache Addition (z.B. `0101+1011=0000`)

== Gleitkommazahlen

- Aufteilung der Zahl: Exponent, Mantisse
- Wert=Mantisse^Exponent
- Gleitkommazahlen sind nur Näherungswerte!
  - Für kleine Werte: Extrem gute Näherung
  - Je größer der Wert, um so geringer die Genauigkeit
  - Spezielle Bibliotheken für genaue Berechnungen mit großen Zahlen

== Text

- Interpretation von Zahlen als Buchstaben
- #link("https://de.wikipedia.org/wiki/American_Standard_Code_for_Information_Interchange")[ASCII-Tabelle]: Zuordnung der Werte eines byte zu Zeichen
- Problem: Unterschiedliche Alphabete
- Lösungen:
  - Codepages - aber nicht automatisch erkennbar
  - UTF-8: Ein Buchstabe kann bis zu 4 Byte breit sein, Erkennung über erstes bit.


Speicherinterpretation: Datentypen

Was bedeutet `01001000 01101001`?
- Zwei `byte`: 72, 105?
- Ein `short`: 18537?
- Zwei `char`: "H", "i"?

-> Datentypen müssen in Java deklariert werden und *ändern die Bedeutung* von Variablen - z. B. `00110111` kann die Zahl 55 oder das Zeichen "7" sein (aber niemals die Zahl 7)! 

