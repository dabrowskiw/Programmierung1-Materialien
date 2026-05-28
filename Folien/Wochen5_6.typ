#import "header.typ": *

#show: htwslides

#title-slide(
  title: "Programmierung 1",
  subtitle: "Wochen 5-6: Komplexere Datenstrukturen",
  institution-name: "HTW Berlin"
)

== Stack

- Eigener Speicherbereich für jede Funktion, pro Aufruf neu
- Variablen der Funktion werden dort angelegt/übergeben
#only(1)[
  #sourcecode[```java
    public class StackBeispiel {
      // Definition einer eigenen Funktion mit 2 Argumenten
      public static void pn(int from, int to, int by) {
        for(int i=from; i<to; i+=by) {
          System.out.println(i);
        }
      }
      public static void main(String[] args) {
        // Aufruf der Funktion (Ausführung des Codes darin)
        pn(1, 12, 2);
      }
    }
  ```]
]

#only(2)[
  - pn(0, 100, 2)`` könnte ergeben:

  #table(
    columns: 3,
    table.header(
      [Adresse], [Wert], [Kommentar]
    ),
    [ 12 ], [ ... ], [ Nächster Befehl ],  
    [ ... ], [ ... ], [ Anderer Code etc.], 
    [ 67 ], [ 12 ], [ Rücksprung-Adresse ], 
    [ 68 ], [ 2 ], [ by (Arg. 3) ],
    [ 69 ], [ 100 ], [ to (Arg. 2) ], 
    [ 70 ], [ 0 ], [ from (Arg. 1) ],
    [ 71 ], [... ], [Rücksprung-Adresse vorherige Funktion ],
    [ ... ], [ ... ], [ Restlicher Stack ]
  )
] 

== Scope

Scope ergibt sich aus Stack:
- Funktionen verändern nur ihre eigenen Werte!
- Funktionen kriegen nur Kopien der Argument-Werte!

#sourcecode[```java
  public class StackBeispiel {
    public static void pn(int from, int to, int by) {
      for(; from<to; from += by) {
        System.out.println(from);
      }
    }
    public static void main(String[] args) {
      from = 0;
      pn(from, 100, 2);
      System.out.println("From: " + from); // 0 oder 100?
    }
  }
```]

== Weiteres Stack-Beispiel

#sourcecode[```java
  public static void doSomething(int value) {
    value = 2;
  }
  public static void main(String[] args) {
    int value = 3;
    doSomething(value);
    System.out.println(value); // Was steht hier?
  }
```]


== Arrays

- Speichern mehrerer zusammehängender Werte oft nötig
    - Verlauf von einem Wert über die Zeit (Aktie, Infektionen, Ton...)
    - Liste von Werten (HP aller Gegner, Koordinaten von Städten...)
    - Mehrdimensionale Werte (Pixel eines Bildes, )
- Es kann Arrays von jedem Datentyp geben (auch von Arrays)
- Die Länge eines Arrays ist *fest* (was würde sonst im RAM passieren?)

#sourcecode[```java
  int[] intArray = new int[5];
  char[][] charMatrix = new char[7][3];
  charMatrix[5][2] = (char)intArray[0]; //Zugriff auf Werte im Array über Index
```]



== Speicherorganisation

#sourcecode[```java
  int[] vals = {1, 6, 5, 3};
```]

#table(
  columns: 6,
  table.header(
   [  Adresse  ], [  Wert  ], [  Kommentar  ], [  Adresse  ], [  Wert  ], [  Kommentar  ], 
  ),
  [  ...  ], [  ...  ], [  Andere Variablen ], [   76  ], [  5  ], [  3. Wert  ],
  [  73  ], [  4  ], [  Länge (header)  ], [  77  ], [  3  ], [  Letzter Wert ],
  [  74  ], [  1  ], [  1. Wert  ], [  ...  ], [  ...  ], [  Andere Variablen ],
  [  75  ], [  6  ], [  2. Wert  ], [  ...  ], [  ...  ], [  Andere Variablen ],
)


== Heap und Stack

...Aber passt das alles auf den Stack?

#sourcecode[```java
  public static void doSomething(int[] values) {
    for(int i=0; i<values.length; i++) {
      System.out.println(values[i]);
    }
  }
  public static void main(String[] args) {   
    int[] lotsaValues = new int[10000];
    doSomething(lotsaValues);
  }
```]

Das wäre viel zu kopieren! #sym.arrow Daten in Heap, Adresse auf Stack

== Folgen für Scoping

Was ist jetzt mit Scoping?

#sourcecode[```java
  public static void doSomethingElse(int[] values) {
    values[0] = 5;
  }
  public static void main(String[] args) {
    int[] vals = new int[] {0, 1, 2, 3};
    System.out.println(vals[0]); // Was steht hier?
    doSomethingElse(vals);
    System.out.println(vals[0]); // Was steht hier?
  }
```]

== Folgen für Scoping
#sourcecode[```java
  public static void doSomethingElse(int[] values) {
    values = new int[2];
    values[0] = 5;
  }
  public static void main(String[] args) {
    int[] vals = new int[] {0, 1, 2, 3};
    System.out.println(vals[0]); // Was steht hier?
    doSomethingElse(vals);
    System.out.println(vals[0]); // Was steht hier?
  }
```]

Der Scope gilt immer noch - aber nur für die Adresse! #sym.arrow Immer beachten, was übergeben wird!

== Beispiel für Array-Daten: MIDI

- Musical Instrument Digital Interface
- Standard, um Informationen von digitalen Instrumenten zu übertragen
- Auch Dateiformat-Spezifikation
- Enthält Informationen wie:
    - Tonhöhe
    - Betätigungsintensität
    - Tondauer
- #sym.arrow Musik-Codierung auf kleinem Raum, Rekonstruktion möglich
- Unterschiedliche Tools, z.B. fluidsynth (inkl. Soundfonts)

== Formatspezifikation

Vollständige Beschreibung #link("http://www.music.mcgill.ca/~ich/classes/mumt306/StandardMIDIfileformat.html#BMA2_")[online] verfügbar.

#sourcecode[```text
  MThd <length of header data>
  <header data>
  MTrk <length of track data>
  <track data>
```]

- Unterschiedliche Format-Typen (0, 1, und 2), einfachstes ist Typ 0. Minimal-Header:
    - Format-Typ (2 Byte: 00 00)
    - Anzahl Tracks (2 Byte, für Format 0 immer 00 01)
    - Länge einer Viertel-Note (2 Byte, z.B. 00 60 -> 96 beats)

== Format 0

#table(
  columns: 2,
  table.header(
    [Bytes], [Bedeutung]
  ),
  [4D 54 68 64], [MThd - magic number für MIDI],
  [xx xx xx xx], [4 Byte Länge des Headers],
  [00 00], [Format: 0],
  [00 01], [Anzahl der Tracks, hier 1],
  [xx xx], [Geschwindigkeit der Datei],
  [4D 54 72 6B], [MTrk - Trackbeginn],
  [xx xx xx xx], [L - Länge des Tracks (in Byte)],
  [7 Byte], [Zeitsignatur],
  [6 Byte], [Tempo],
  [L - 3 Byte], [Trackdaten],
  [FF 2F 00], [Ende der Datei]
)

== Formatspezifikation: Track

Track enthält die eigentlichen Tondaten unterteilt in Channel als Ereignisse, insbesondere:

- Geschwindigkeitsinformation
- Jeweils mit 1 Byte Zeitdifferenz davor Instrumentereignisse (insb. "Note an", "Note aus"):
    - 1001nnnn 0kkkkkkk 0vvvvvvv: Note on, n: channel, k: key, v: velocity
    - 1000nnnn 0kkkkkkk 0vvvvvvv: Note off, n: channel, k: key, v: velocity
    - 1100nnnn 0ppppppp: Program change, n: channel, p: program (Instrument)

== Beispieldatei

Was steht in dieser Datei drin? Welcher Bereich bedeutet was?

Die Zahlen sind alle hexadezimal, es sei denn, es steht etwas anderes davor.

#sourcecode[```text
  4D 54 68 64 00 00 00 06 00 00 00 01 00 60 4D 54 72 6B 00 00 00 22 00 FF 58 04 04 02 18 08 00 FF 51 03 07 A1 20 00 C0 (0b11000000) 05 00 90 (0b10010000) 30 (dec 48) 60 60 80 (0b10000000) 30 (dec 48) 60 00 90 (0b10010000) 32 (dec 50) 60 60 80 (0b10000000) 32 (dec 50) 60 FF 2F 00
```]

== Beispieldatei erklärt

4D 54 68 64 00 00 00 06 00 00 00 01 00 60 *(4 Byte: MThd, 4 Byte: Headerlänge, 2 Byte: Format 0, 2 Byte: 1 Track, 2 Byte: Geschwindigkeit)*

4D 54 72 6B 00 00 00 22 00 FF 58 04 04 02 18 08 00 FF 51 03 07 A1 20 *(MTrk, 4 Byte Länge, 7 Byte Zeitsignatur, 6 Byte Tempo)*

- 0x00 0xC0 (0b11000000) 0x05 *Instrument auf Track 0: 5 *
- 0x00 0x90 (0b10010000) 0x30 (48) 0x60 *on, Channel 0: C3, v: 0x60*
- 0x60 0x80 (0b10000000) 0x30 (48) 0x60 *off, Channel 0: C3, v: 0x60*
- 0x00 0x90 (0b10010000) 0x32 (50) 0x60 *on, Channel 0: E3, v: 0x60*
- 0x60 0x80 (0b10010000) 0x32 (50) 0x60: off, Channel 0 *E3, v: 0x60*
- 0xFF 0x2F 0x00 *End of file*

== Ton aus MIDI-Dateien

- Beispielsweise über #link("https://www.fluidsynth.org/")[fluidsynth]
    - -d: Alle events ausgeben
    - -i: Keine interaktive Event-Eingabe (aus MIDI-Datei lesen)
    - Beispiel-Soundfont hier: #link("https://moodle.htw-berlin.de/mod/resource/view.php?id=1714332")[Game Boy Advance]
    - Beispiel-Midi-Datei vom #link("https://github.com/dabrowskiw/Programmierung1-Materialien/tree/IKGneu/Beispieldaten")[github-repo]
#sourcecode[```
  fluidsynth -di ~/GBA.sf beispiel_folien.midi
```]

== Binärdateien

MIDI-Dateien sind ein klassisches Beispiel für Binärdateien. Bearbeitbar mit z.B.:

- #link("https://github.com/WerWolv/ImHex")[ImHex] (Linux) 
- #link("https://sourceforge.net/projects/frhed/")[frhed] (Windows)

/*
#slide(title: "Programmcode im Speicher")[
Der Computer kann aber keinen Code, nur Zahlen...?

  #table(
    columns: 2,
    table.header(
      [Bytes], [Bedeutung]
    ),
    [4D 54 68 64], [MThd - magic number für MIDI],
    [xx xx xx xx], [4 Byte Länge des Headers],
    [00 00], [Format: 0],
    [00 01], [Anzahl der Tracks, hier 1],
    [xx xx], [Geschwindigkeit der Datei],
    [4D 54 72 6B], [MTrk - Trackbeginn],
    [xx xx xx xx], [L - Länge des Tracks (in Byte)],
    [7 Byte], [Zeitsignatur],
    [6 Byte], [Tempo],
    [L - 3 Byte], [Trackdaten],
    [FF 2F 00], [Ende der Datei]
  )
| Befehl | Wert | Argumente | Kommentar |
|---|---|---|---|
| print | 1 | 1 | Auszugebende Adresse |
| jeq | 2 | 3 | 2 Adressen verlgeichen, 3: Sprungziel |
| add | 3 | 2 | 1: Adresse, 2: Zu addierender Wert |
| jmp | 4 | 1 | Sprung-Adresse |
| put | 5 | 2 | 1: Adresse, 2: Wert |


]

#slide(title: "Programmcode -> Bytecode")[  #sourcecode[```java
for(int i=0; i<10; i++) {
  System.out.print(i);
}
  ```]

  #sourcecode[```asm
90: put 69 0          
93: put 68 10
96: jeq 69 68 107
100: print i
102: add i 1
105: jmp 96
107: Programmende (0)
  ```]

- Programm: `90: 5 69 0 5 68 10 2 69 68 107 1 69 3 69 1 4 96 0`

]

#slide(title: "Verständnisübung ")[
| Befehl | Wert | Argumente | Kommentar |
|---|---|---|---|
| print | 1 | 1 | Auszugebende Adresse |
| jeq | 2 | 3 | 2 Adressen verlgeichen, 3: Sprungziel |
| add | 3 | 2 | 1: Adresse, 2: Zu addierender Wert |
| jmp | 4 | 1 | Sprung-Adresse |
| put | 5 | 2 | 1: Adresse, 2: Wert |

`90: 5 60 0 5 59 2 5 58 100 2 60 58 120 1 60 5 57 0 2 57 59 99 3 60 1 3 57 1 4 108 0`


]

#slide(title: "Quality of Life: break")[
  #sourcecode[```java
public static void showFirstUneven(int from, int to, int howMany) {
    int shown = 0;
    for(int i=from; i<to; i++) {
        if(shown < howMany) {
            if(i % 2 == 1) {
                System.out.println(i);
                shown += 1;
            }
        }
    }
}
  ```]
... ein wenig umständlich

]

#slide(title: "Quality of Life: break")[
Häufige Strategie: `while(true)`, `break`.
  #sourcecode[```java
public static void showFirstUneven(int from, int to, int howMany) {
    int shown = 0;
    while(true) {
        if(i % 2 == 1) {
            System.out.println(i);
            shown += 1;
        }
        if(shown >= howMany) {
            break;
        }
    }
}
  ```]

]

#slide(title: "Quality of Life: continue")[
  #sourcecode[```java
public static void showSpecialCodes(char from, char to) {
    for(char toShow = from; toShow <= to; toShow++) {
        if(!(toShow >= 'a' && toShow <= 'z')) {
            if(!(toShow >= 'A' && toShow <= 'Z')) {
                System.out.println((int)toShow);
            }
        }
    }
}
  ```]

Wird um so umständlicher, je mehr Bedingungen dazukommen.

]

#slide(title: "Quality of Life: continue")[
  #sourcecode[```java
public static void showSpecialCodes(char from, char to) {
    for(char toShow = from; toShow <= to; toShow++) {
        if(toShow >= 'a' && toShow <= 'z') {
            continue;
        }
        if(toShow >= 'A' && toShow <= 'Z') {
            continue;
        }
        System.out.println((int)toShow);
    }
}
  ```]

]

#slide(title: "Quality of Life: if - else if - else")[
  #sourcecode[```java
public static void showSmallestDivisor(int from, int to, int d1, int d2, int d3) {
    for(int i=from; i<=to; i++) {
        if(i % d1 == 0) {
            System.out.println(i + ": " + d1);
        }
        if((i % d1 != 0) && (i % d2 == 0)) {
            System.out.println(i + ": " + d2);
        }
        if((i % d1 != 0) && (i % d2 != 0) && (i % d3 == 0)) {
            System.out.println(i + ": " + d3);
        }
        if((i % d1 != 0) && (i % d2 != 0) && (i % d3 != 0)) {
            System.out.println("No divisor found.");
        }
    }
}
  ```]

]

#slide(title: "Quality of Life: if - else if - else")[
  #sourcecode[```java
public static void showSmallestDivisor(int from, int to, int d1, int d2, int d3) {
    for(int i=from; i<=to; i++) {
        if(i % d1 == 0) {
            System.out.println(i + ": " + d1);
        }
        else if(i % d2 == 0) {
            System.out.println(i + ": " + d2);
        }
        else if(i % d3 == 0) {
            System.out.println(i + ": " + d3);
        }
        else {
            System.out.println("No divisor found.");
        }
    }
}
  ```]

]

#slide(title: "Herangehensweise zum Programmieren")[
`public static void showPrimes(int from, int to)`: Alle Primzahlen zwischen `from` und `to` ausgeben
- Scheinbar große Aufgabe -> erst unterteilen
    - Was ist der kleinste mögliche Schritt?
    - Implementieren, ausprobieren
    - Wiederholen, bis fertig
- Gemeinsam ausprobieren!

]

#slide(title: "Üben der Herangehensweise")[
`public static int getStepsUntil1(int start, int maxSteps, int adder)`
- Rekursiv definierte Reihe
- Nächstes Glied `X(n+1)` ist:
    - Wenn `X(n)` durch 3 Teilbar, dann `X(n)/3`
    - Sonst: `X(n)+adder`
- Funktion gibt zurück:
    - Anzahl der Schritte, bis ein Glied 1 ist
    - Falls diese Anzahl größer `maxsteps` ist, `-1`
  
]
*/
