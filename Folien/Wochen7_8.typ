#import "header.typ": *


#show: htwslides

#title-slide(
  title: "Programmierung 1",
  subtitle: "Wochen 7-8: Binärdateien und MIDI",
  institution-name: "HTW Berlin"
)

== Binärdateien

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

== Weiteres Beispiel: MIDI

- Musical Instrument Digital Interface
- Standard, um Informationen von digitalen Instrumenten zu übertragen
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
  [00 7 Byte], [Zeitsignatur],
  [00 6 Byte], [Tempo],
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

```text
4D 54 68 64 00 00 00 06 00 00 00 01 00 60 4D 54 72 6B 00 00 00 22 00 FF 58 04 04 02 18 08 00 FF 51 03 07 A1 20 00 C0 (0b11000000) 05 00 90 (0b10010000) 30 (dec 48) 60 60 80 (0b10000000) 30 (dec 48) 60 00 90 (0b10010000) 32 (dec 50) 60 60 80 (0b10000000) 32 (dec 50) 60 FF 2F 00
```

== Beispieldatei

Schöner formatiert:

```text
4D 54 68 64 
00 00 00 06 
00 00 00 01 00 60
4D 54 72 6B
00 00 00 22
00 FF 58 04 04 02 18 08
00 FF 51 03 07 A1 20
00 C0 (0b11000000) 05 60
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

== Quality of Life: break

- Schleifen-Unterbrechung unabhängig von Schleifen-Bedingung
- Häufige Strategie: `while(true)`, `break`.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    ```java
public static void showUneven(
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
    public static void showUneven(
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

== Quality of Life: continue

- Wie `break`, aber weitermachen statt unterbrechen
- Häufig: "Brauche ich mir nicht anschauen, weitermachen"

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    ```java
    public static void showSpecial(
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
    public static void showSpecial(
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

== Quality of Life: switch

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

== Quality of Life: switch

#only(3)[
`case` ohne `break`: Sinnvoll bei hierarchisch angeordneten Operationen, z.B.:
- Berechtigungen (Viewer: Lesen, Editor: +Schreiben, Admin: +Löschen)
- Memeber (Basic: Zutritt, Premium: +Lounge, VIP: +Autogramm)
]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    #only("1-2")[
    ```java
    public static String getPredIf(char grade) {
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
      public void setPermissions(
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
      public static String getPred(
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
      public static String getPred(
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
      public void setPermissions(
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


== Programmcode im Speicher

#grid(
  columns: (1.9fr, 4fr),
  gutter: 1em,
    [Der Computer kann aber keinen Code, nur Zahlen...?\ #sym.arrow Betriebssysteme],
  text(size: 18pt, table(
    columns: 4,
    table.header(
      [Befehl], [Wert], [Argumente], [Kommentar]
    ),
    [print], [1], [1], [Auszugebende Adresse],
    [jeq], [2], [3], [2 Adressen verlgeichen, 3: Sprungziel],
    [add], [3], [2], [1: Adresse, 2: Zu addierender Wert],
    [jmp], [4], [1], [Sprung-Adresse],
    [put], [5], [2], [1: Adresse, 2: Wert],
  ))
)

#only(1)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    [
      ```java
      int j=10;
      for(int i=0; i<j; i++) {
        System.out.print(i);
      }
      ```
    ],
    [ #codly(lang-format: (_, _, _) => [], number-format: none)
      ```asm
      90: put 69 0 # i
      93: put 68 10 # j=10
      96: jeq 69 68 107 # i==j -> 107 (Ende)
      100: print i
      102: add i 1 # i++
      105: jmp 96 # Schleife wiederholen
      107: Programmende (0)
      ```
    ]
  )

  - Programm: `90: 5 69 0 5 68 10 2 69 68 107 1 69 3 69 1 4 96 0`
]

  #grid(
    columns: (0.7fr, 1.1fr, 2fr),
    gutter: 1em,
    [ 
#only("2-4")[
      Und das?\ `90: 5 60 0 5 59 2 5 58 100 2 60 58 120 1 60 5 57 0 2 57 59 99 3 60 1 3 57 1 4 108 0`]],
    [#only("3-4")[```
    90:  5 60 0
    93:  5 59 2  
    96:  5 58 100 
    99:  2 60 58 122 
    103: 1 60
    105: 5 57 0 
    108: 2 57 59 99
    112: 3 60 1
    115: 3 57 1 
    118: 4 108
    120: 0
  ```]],
    [#only("4")[```asm
    90: put 60 0 # i=0
    93: put 59 2 # j=2
    96: put 58 100 # k=100
    99: jeq 60 58 122 # i==k->120 (Ende)
    103: print i
    105: put 57 0 # l=0
    108: jeq 57 59 99 # l==j->99 (continue)
    112: add 60 1 # i++
    115: add l 1 # l++
    118: jmp 108 # Schleife wiederholen
    120: 0 # Ende

  ```]]
  )





