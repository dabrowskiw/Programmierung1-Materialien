#import "header.typ": *

#show: htwslides

#title-slide(
  title: "Programmierung 1",
  subtitle: "Wochen 7-8: Binärdateien und MIDI",
  institution-name: "HTW Berlin"
)

= Binärdateien

== Allgemeines

- Alles im Speicher sind Zahlen
- Recap: ASCII-Code #sym.arrow Textdateien enthalten Zahlen!

#pause

#grid(
  columns: (1fr, 1fr),
  [
    Beispiel-Textdatei:

    ```text
    Hello, world!
    ```

    Wie sieht das im Hex-Editor (z.B. Linux: ghex, Windows: HxD) aus?
  ],
  [
    #image("Bilder/hex1.png", width: 100%)
  ]
)

== BMP-Datei

#grid(
  columns: (1fr, 1fr),
  [
    Andere Textdatei?

    ```text
    BM6(L

     Hallo! Ich bin zwar eine Bilddatei, aber ich sehe aus wie Text. Warum nur?
    ```
    
    #only(2)[
      ...und als Bild?

      #grid(
        columns: (1.5fr, 3fr),
        gutter: 1em,
        image("Bilder/hello.png", width: 100%),
        [
          Binärformat:
          - Magic number
          - Header, u.A. 5x5
          - 25 Pixel: (b, g, r)
        
        ]
      )
      Kriegen wir die untere Zeile blau?
    ]
  ],
  [
    #image("Bilder/hex2.png", width: 100%)
  ]
)

= MIDI-Dateien

== Allgemeines 

- Musical Instrument Digital Interface
- Standard für Informationen von digitalen Instrumenten
- Auch Dateiformat-Spezifikation
- Enthält Informationen wie:
    - Tonhöhe
    - Betätigungsintensität
    - Tondauer
- #sym.arrow Musik-Codierung auf kleinem Raum, Rekonstruktion möglich
- Unterschiedliche Tools, z.B. fluidsynth (inkl. Soundfonts)
- Melodie = Tonabfolge #sym.arrow Arrays!


== Formatspezifikation

Vollständige Beschreibung #link("https://midimusic.github.io/tech/midispec.html")[online] verfügbar.

```text
  MThd <length of header data>
  <header data>
  MTrk <length of track data>
  <track data>
```

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
  [00 + 7 Byte], [Zeitsignatur],
  [00 + 6 Byte], [Tempo],
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

#codly(
  display-icon: false,
  display-name: false,
  number-format: none
)
```text
4D 54 68 64 00 00 00 06 00 00 00 01 00 60 4D 54 72 6B 00 00 00 22 00 FF 58 04 04 02 18 08 00 FF 51 03 07 A1 20 00 C0 (0b11000000) 05 00 90 (0b10010000) 30 (dec 48) 60 60 80 (0b10000000) 30 (dec 48) 60 00 90 (0b10010000) 32 (dec 50) 60 60 80 (0b10000000) 32 (dec 50) 60 FF 2F 00
```

== Beispieldatei

#grid(
  columns: 2,
  gutter: 1em,
  [
    #codly(
      display-icon: false,
      display-name: false,
      number-format: none
    )
```text
4D 54 68 64 00 00 00 06 00 00 00 01 00 60 4D 54 72 6B 00 00 00 22 00 FF 58 04 04 02 18 08 00 FF 51 03 07 A1 20 00 C0 (0b11000000) 05 00 90 (0b10010000) 30 (dec 48) 60 60 80 (0b10000000) 30 (dec 48) 60 00 90 (0b10010000) 32 (dec 50) 60 60 80 (0b10000000) 32 (dec 50) 60 FF 2F 00
```
    #text(size: 22pt)[
      Note events (n: channel, k: #link("https://midimusic.github.io/tech/midispec.html#BMA1_3")[note number], v: velocity, p: #link("https://midimusic.github.io/tech/midispec.html#BMA1_4")[program]):
      - Vor jedem Event: 1 Byte time delay
      - 1001nnnn 0kkkkkkk 0vvvvvvv: On
      - 1000nnnn 0kkkkkkk 0vvvvvvv: Off
      - 1100nnnn 0ppppppp: Program change
    ]
  ],
  [
    #table(
      columns: 2,
      table.header(
        [Bytes], [Bedeutung]
      ),
      [4D 54 68 64], [MThd],
      [xx xx xx xx], [Headerlänge],
      [00 00], [Format: 0],
      [00 01], [Anzahl der Tracks],
      [xx xx], [Geschwindigkeit],
      [4D 54 72 6B], [MTrk - Trackbeginn],
      [xx xx xx xx], [Länge des Tracks],
      [00 + 7 Byte], [Zeitsignatur],
      [00 + 6 Byte], [Tempo],
      [L - 3 Byte], [Trackdaten],
      [FF 2F 00], [Ende der Datei]
    )
  ]
)

== Beispieldatei

Schöner formatiert:

#only(1)[
  #codly(
    display-icon: false,
    display-name: false,
    number-format: none
  )
]
#only(2)[
  #codly(
    display-icon: false,
    display-name: false,
    number-format: none,
    annotation-format: none,
    annotations: (
      (start: 1, end: 1, content: [MTHD]),
      (start: 2, end: 2, content: [Headerlänge: 6]),
      (start: 3, end: 3, content: [Format: 0]),
      (start: 4, end: 4, content: [Tracks: 0]),
      (start: 5, end: 5, content: [Geschwindigkeit: 0x60]),
      (start: 6, end: 6, content: [MTrk]),
      (start: 7, end: 7, content: [Tracklänge: 0x22 (34)]),
      (start: 8, end: 8, content: [Zeitsignatur]),
      (start: 9, end: 9, content: [Tempo]),
      (start: 10, end: 10, content: [0 delay, Program change: Electric Piano]),
      (start: 11, end: 11, content: [0 delay, Note on: C4]),
      (start: 12, end: 12, content: [0x60 delay, note off: C4]),
      (start: 13, end: 13, content: [0 delay, note on: D4]),
      (start: 14, end: 14, content: [0x60 delay, note off: D4]),
      (start: 15, end: 15, content: [EOF]),
    ),

  )
]
```text
4D 54 68 64 
00 00 00 06 
00 00 
00 01 
00 60
4D 54 72 6B
00 00 00 22
00 FF 58 04 04 02 18 08
00 FF 51 03 07 A1 20
00 C0 (0b11000000) 05
00 90 (0b10010000) 30 (dec 48) 60
60 80 (0b10000000) 30 (dec 48) 60
00 90 (0b10010000) 32 (dec 50) 60
60 80 (0b10000000) 32 (dec 50) 60
FF 2F 00
```

== Ton aus MIDI-Dateien

- Beispielsweise über #link("https://www.fluidsynth.org/")[fluidsynth]
    - -d: Alle events ausgeben
    - -i: Keine interaktive Event-Eingabe (aus MIDI-Datei lesen)
    - Beispiel-Soundfont hier: #link("https://moodle.htw-berlin.de/mod/resource/view.php?id=1714332")[Game Boy Advance]
    - Beispiel-Midi-Datei vom #link("https://github.com/dabrowskiw/Programmierung1-Materialien/tree/IKGneu/Beispieldaten")[github-repo]
```
  fluidsynth -di ~/GBA.sf beispiel_folien.midi
```

Alternativ über #link("https://cifkao.github.io/html-midi-player/")[online-MIDI-Player], auch zum anschauen.

Gemeinsam: Von Hand bearbeiten, mehr/andere Töne?

#codly(
  display-icon: true,
  display-name: true,
  number-format: numbering.with("1")
)

= Nützliche Sprachfeatures 

== Konstanten

Was tut diese Methode?

```java
static double calculateFinalPrice(double price) {
  return price * 1.21;
}
``` #pause

1.21 ist eine "magic number":
- Unklar, wo der Wert herkommt
- Falls an mehreren Stellen im Code: Problem bei Änderung
- Code schwer zu verstehen und zu warten #sym.arrow "code smell"

#codly(
  annotations: (
    (start: 1, end: 1, content: [final: Kann sich nicht ändern.]),
  )
)
```java
static final int VAT_RATE = 1.21;

static double calculateFinalPrice(double price) {
  return price * VAT_RATE;
}
``` #pause

== Konstanten

Beispiel für Veränderung:

#only(1)[
```java
class Circle {
  static double getArea(double radius) {
    return 3.14*radius*radius;
  }

  static double getRadius(double area) {
    return Math.sqrt(area/3.14);
  }

  static void main() {
    double area = getArea(5);
    System.out.println(5-getRadius(area));
  }
}
```
- Was ist die magic number?
- Was erwarten wir in Zeile 11?
]

#only(2)[
  #codly(
    highlights: (
      (line: 7, start: 27, end: 33, color: blue.lighten(65%)),
    )
  )
```java
class Circle {
  static double getArea(double radius) {
    return 3.14*radius*radius;
  }

  static double getRadius(double area) {
    return Math.sqrt(area/3.14159);
  }

  static void main() {
    double area = getArea(5);
    System.out.println(5-getRadius(area));
  }
}
```
- Was passiert jetzt in Zeile 11?
]

== Konstanten

#codly(
  annotations: (
    (start: 12, end: 12, content: [#text(red)[Fehler, illegale Zuweisung!]]),
  )
)

```java
class Circle {
  static final double PI = 3.14159;
  static double getArea(double radius) {
    return PI*radius*radius;
  }

  static double getRadius(double area) {
    return Math.sqrt(area/PI);
  }
  static void main() {
    double area = getArea(5);
    PI = 3.14;
    System.out.println(5-getRadius(area));
  }
}

```

- Können lokal in Methode (ohne `static`) sein, oder global in Klasse
- `final` garantiert, dass Wert so bleibt
- Konvention: Großbuchstaben/Unterstriche

== Überladen von Methoden

Recap Typisierung: Java ist *explizit* und *statisch* typisiert.

Aber: Oft ähnliche Operationen sinnvoll, z.B. $x = a^b$ für `int` a oder `double` a #sym.arrow `powerInt()`, `powerDouble()` etc.?
#pause

Lösung: Überladen von Methoden
- Identischer Name #sym.arrow bessere Lesbarkeit von Code
- Unterschiede in Argumenten:
  - Unterschiedliche Datentypen und/oder
  - Unterschiedliche Anzahl
- Rückgabedatentyp ist irrelevant!

#sym.arrow Compiler kann bei Aufruf anhand der Argumente entscheiden, welche der Methoden gemeint ist. Formal: *Statischer Polymorphismus*

== Überladen von Methoden

#codly(
  annotations: (
    (start: 2, end: 8, content: [Variante 1: `int`, `int`]),
    (start: 10, end: 16, content: [Variante 2: `double`, `int`]),
    (start: 19, end: 19, content: [`int`, `int` #sym.arrow Verwendung Variante 1]),
    (start: 20, end: 20, content: [`double`, `int` #sym.arrow Verwendung Variante 2]),
  )
)
```java
class Power {
  static int power(int base, int exp) {
    int res = 1;
    for(; exp > 0; exp--) {
      res *= base;
    }
    return res;
  }

  static double power(double base, int exp) {
    double res = 1;
    for(; exp > 0; exp--) {
      res *= base;
    }
    return res;
  }

  static void main() {
    System.out.println(power(2, 4));
    System.out.println(power(2.5, 4));
  }
}

```

== break

- Schleifen-Unterbrechung unabhängig von Schleifen-Bedingung
- Häufige Strategie: `while(true)`, `break`.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    ```java
static void showUneven(
      int from, int to, int howMany) {
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
    ```
  ],
  [
    ```java
    static void showUneven(
        int from, int to, int howMany) {
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
    ```
  ]
)

== continue

- Wie `break`, aber weitermachen statt unterbrechen
- Häufig: "Brauche ich mir nicht anschauen, weitermachen"

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    ```java
    static void showSpecial(
      char from, char to) {
      for(char c = from; c <= to; c++) {
        if(!(c >= 'a' && c <= 'z')) {
          if(!(c >= 'A' && c <= 'Z')) {
            System.out.println((int)c);
          }
        }
      }
    }
    ```
  ],
  [
    ```java
    static void showSpecial(
      char from, char to) {
        for(char c = from; c <= to; c++) {
            if(c >= 'a' && c <= 'z') {
                continue;
            }
            if(c >= 'A' && c <= 'Z') {
                continue;
            }
            System.out.println((int)c);
        }
    }
    ```
  ]
)

== switch

- Kürzere Schreibweise für lange `if`-`elseif`-`else`-Kette
- Vorsicht: `case` bedeutet "ab hier ausführen", nicht "nur ausführen wenn"! 

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    ```java
    switch (Variable) {
      case Wert 1:
        Operation 1
      case Wert 2:
        Operation 1
      //...
      default:
        Operation n
    ```
    #sym.arrow Ab dem ersten zutreffenden Wert alle Operationen
  ],
  [
    #codly(highlighted-lines: (6,))
    ```java
    switch (Variable) {
      case Wert 1:
        Operation 1
      case Wert 2:
        Operation 1
        break;
      //...
      default:
        Operation n
    ```
    `break` unterbricht `switch` #sym.arrow Operationen nur bis zum ersten break. 
  ]
)

== switch

#only(3)[
`case` ohne `break`: Z.B. bei hierarchisch angeordneten Operationen wie:
- Berechtigungen (Viewer: Lesen, Editor: +Schreiben, Admin: +Löschen)
- Memeber (Basic: Zutritt, Premium: +Lounge, VIP: +Autogramm)
]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    #only("1-2")[
    ```java
    static String getPredIf(
                     char grade) {
        String res = "Prädikat: ";
        if(grade == 'A') {
            res += "Sehr gut";
        } else if(grade == 'B') {
            res += "Gut";
        } else if(grade == 'B') {
            res += "Befriedigend";
        } else if(grade == 'B') {
            res += "Ausreichend";
        } else {
            res += "Unbekannt";
        }
        return res;
    }
    ```
  ]
    #only(2)[
      ...Aber ist das nicht sinnlos?\ 
      Warum die ganzen `break`?
    ]
    #only(3)[
      ```java
      void setPermissions(
                          String role) {
        if(role.equals("admin")) {
          grantAdmin();
          grantEditor();
          grantViewer();
        } else if(role.equals("editor")) {
          grantEditor();
          grantViewer();
        } else if(role.equals("viewer")) {
          grantViewer();
        } else {
          removePermissions();
        }
      }
      ```
    ]
  ],
  [
    #only(1)[
      ```java
      static String getPred(
                          char grade) {
          String res = "Prädikat: ";
          switch (grade) {
              case 'A':
                  res += "Sehr gut";
              case 'B':
                  res += "Gut";
              case 'C':
                  res += "Befriedigend";
              case 'D':
                  res += "Ausreichend";
              default:
                  res += "Unbekannt";
          }
          return res;
      }
      ```
      Was ist `res` bei `grade='C'`?\ 
      Warum? Debugger!

    ]
    #only(2)[
      #codly(highlighted-lines: (7, 10, 13, 16))
      ```java
      static String getPred(
                          char grade) {
          String res = "Prädikat: ";
          switch (grade) {
              case 'A':
                  res += "Sehr gut";
                  break;
              case 'B':
                  res += "Gut";
                  break;
              case 'C':
                  res += "Befriedigend";
                  break;
              case 'D':
                  res += "Ausreichend";
                  break;
              default:
                  res += "Unbekannt";
          }
          return res;
      }
      ```
    ]
    #only(3)[
      ```java
      void setPermissions(
                          String role) {
        switch (role) {
          case "admin":
            grantAdmin();
          case "editor":
            grantEdit();
          case "viewer":
            grantView();
            break;
          default:
            removePermissions();
        }
      }
      ```
    ]
  ]
)


