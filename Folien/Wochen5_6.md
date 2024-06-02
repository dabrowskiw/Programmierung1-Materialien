---
marp: true
theme: default
paginate: true
#footer: Prof. Dr.-Ing. P. W. Dabrowski - Programmierung 1 - HTW Berlin

---
# Arrays

* Speichern mehrerer zusammehängender Werte oft nötig
    * Verlauf von einem Wert über die Zeit (Aktie, Infektionen, Ton...)
    * Liste von Werten (HP aller Gegner, Koordinaten von Städten...)
    * Mehrdimensionale Werte (Pixel eines Bildes, )
* Es kann Arrays von jedem Datentyp geben (auch von Arrays)
* Die Länge eines Arrays ist *fest* (was würde sonst im RAM passieren?)

```java
int[] intArray = new int[5];
char[][] charMatrix = new char[7][3];
charMatrix[5][2] = (char)intArray[0]; //Zugriff auf Werte im Array über Index
```

---
# Arrays im Speicher

```java
int[] vals = {1, 6, 5, 3};
```

| Adresse | Wert | Kommentar | Adresse | Wert | Kommentar |
|---|---|---|---|---|---| 
| ... | ... | Andere Variablen|  76 | 5 | 3. Wert |
| 73 | 4 | Länge (header) | 77 | 3 | Letzter Wert| 
| 74 | 1 | 1. Wert | ... | ... | Andere Variablen| 
| 75 | 6 | 2. Wert | ... | ... | Andere Variablen|

---

# Recap: Stack

```java
public static void doSomething(int value) {
    value = 2;
}
public static void main(String[] args) {
    int value = 3;
    doSomething(value);
    System.out.println(value); // Was steht hier?
}
```

---

# Speicher: Heap und Stack

...Aber passt das alles auf den Stack?

```java
public static void doSomething(int[] values) {
    for(int i=0; i<values.length; i++) {
        System.out.println(values[i]);
    }
}
public static void main(String[] args) {   
    int[] lotsaValues = new int[10000];
    doSomething(lotsaValues);
}
```

Das wäre viel zu kopieren! -> Heap

---

# Speicher: Folgen von Heap und Stack

Was ist jetzt mit Scoping?

```java
public static void doSomethingElse(int[] values) {
    values[0] = 5;
}
public static void main(String[] args) {
    int[] vals = new int[] {0, 1, 2, 3};
    System.out.println(vals[0]); // Was steht hier?
    doSomethingElse(vals);
    System.out.println(vals[0]); // Was steht hier?
}
```

---

# Speicher: Folgen von Heap und Stack

```java
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
```

Der Scope gilt aber immer noch - aber nur für die Adresse! -> Immer beachten, was übergeben wird!

---

# Beispiel für "Array-Daten": MIDI

* Musical Instrument Digital Interface
* Standard, um Informationen von digitalen Instrumenten zu übertragen
* Auch Dateiformat-Spezifikation
* Enthält Informationen wie:
    * Tonhöhe
    * Betätigungsintensität
    * Tondauer
* -> Musik-Codierung auf kleinem Raum, Rekonstruktion möglich
* Unterschiedliche Tools, z.B. fluidsynth (inkl. Soundfonts)

---

# Formatspezifikation

<!-- http://www.music.mcgill.ca/~ich/classes/mumt306/StandardMIDIfileformat.html#BMA2_ -->


```text
MThd <length of header data>
<header data>
MTrk <length of track data>
<track data>
```

* Unterschiedliche Format-Typen (0, 1, und 2), einfachstes ist Typ 0. Minimal-Header:
    * Format-Typ (2 Byte: 00 00)
    * Anzahl Tracks (2 Byte, für Format 0 immer 00 01)
    * Länge einer Viertel-Note (2 Byte, z.B. 00 60 -> 96 beats)

---

# Formatspezifikation: Track

Track enthält die eigentlichen Tondaten unterteilt in Channel als Ereignisse, insbesondere:

* Geschwindigkeitsinformation
* Jeweils mit 1 Byte Zeitdifferenz davor Instrumentereignisse (insb. "Note an", "Note aus"):
    * 1001nnnn 0kkkkkkk 0vvvvvvv: Note on, n: channel, k: key, v: velocity
    * 1000nnnn 0kkkkkkk 0vvvvvvv: Note off, n: channel, k: key, v: velocity
    * 1100nnnn 0ppppppp: Program change, n: channel, p: program (Instrument)

Vollständiger Überblick siehe z.B. [hier](http://www.music.mcgill.ca/~ich/classes/mumt306/StandardMIDIfileformat.html#BMA1_).

---

# Beispieldatei

Dateiheader: 4D 54 68 64 00 00 00 06 00 00 00 01 00 60 (4 Byte: MThd, 4 Byte: Headerlänge, 2 Byte: Format 0, 2 Byte: 1 Track, 2 Byte: Geschwindigkeit) 
Track-Header: 4D 54 72 6B 00 00 00 22 00 FF 58 04 04 02 18 08 00 FF 51 03 07 A1 20 (MTrk, 4 Byte Länge, 7 Byte Zeitsignatur, 6 Byte Tempo)
Track:

* 0x00 0xC0 (0b11000000) 0x05: Instrument auf Track 0: 5 
* 0x00 0x90 (0b10010000) 0x30 (48) 0x60: Note on, Channel 0: C3, v: 0x60
* 0x60 0x80 (0b10000000) 0x30 (48) 0x60: Note off, Channel 0: C3, v: 0x60
* 0x00 0x90 (0b10010000) 0x32 (50) 0x60: Note on, Channel 0: E3, v: 0x60
* 0x60 0x80 (0b10010000) 0x32 (50) 0x60: Note off, Channel 0: E3, v: 0x60
* 0xFF 0x2F 0x00: End of file

---

# Ton aus MIDI-Dateien

* Beispielsweise über [fluidsynth](https://www.fluidsynth.org/)
    * -d: Alle events ausgeben
    * -i: Keine interaktive Event-Eingabe (aus MIDI-Datei lesen)
    * Beispiel-Soundfont hier: [Game Boy Advance](https://moodle.htw-berlin.de/mod/resource/view.php?id=1714332)
    * Beispiel-Midi-Datei vom [github-repo](https://github.com/dabrowskiw/Programmierung1-Materialien/tree/IKGneu/Beispieldaten)
```
fluidsynth -di ~/GBA.sf beispiel_folien.midi
```

* Was passiert, wenn wir die Datei bearbeiten, z.B. mit [bless](https://github.com/afrantzis/bless) (Linux) oder [frhed](https://sourceforge.net/projects/frhed/) (Windows)?

---

# Programmcode im Speicher

Der Computer kann aber keinen Code, nur Zahlen...?

| Befehl | Wert | Argumente | Kommentar |
|---|---|---|---|
| print | 1 | 1 | Auszugebende Adresse |
| jeq | 2 | 3 | 2 Adressen verlgeichen, 3: Sprungziel |
| add | 3 | 2 | 1: Adresse, 2: Zu addierender Wert |
| jmp | 4 | 1 | Sprung-Adresse |
| put | 5 | 2 | 1: Adresse, 2: Wert |


---

# Programmcode -> Bytecode
```java
for(int i=0; i<10; i++) {
  System.out.print(i);
}
```

```asm
90: put 69 0          
93: put 68 10
96: jeq 69 68 107
100: print i
102: add i 1
105: jmp 96
107: Programmende (0)
```

* Programm: `90: 5 69 0 5 68 10 2 69 68 107 1 69 3 69 1 4 96 0`

---

# Verständnisübung 

| Befehl | Wert | Argumente | Kommentar |
|---|---|---|---|
| print | 1 | 1 | Auszugebende Adresse |
| jeq | 2 | 3 | 2 Adressen verlgeichen, 3: Sprungziel |
| add | 3 | 2 | 1: Adresse, 2: Zu addierender Wert |
| jmp | 4 | 1 | Sprung-Adresse |
| put | 5 | 2 | 1: Adresse, 2: Wert |

`90: 5 60 0 5 59 2 5 58 100 2 60 58 120 1 60 5 57 0 2 57 59 99 3 60 1 3 57 1 4 108 0`


<!--
90: put 60 0 # i
93: put 59 2 # diff
96: put 58 100 # max
99: jeq 60 58 120
103: print 60
105: put 57 0
108: jeq 57 59 99
112: add 60 1
115: add 57 1
118: jmp 108
120: Programmende
-->

---

<!--
---

# Quality of Life: break

```java
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
```
... ein wenig umständlich

---

# Quality of Life: break

Häufige Strategie: `while(true)`, `break`.
```java
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
```

---

# Quality of Life: continue

```java
public static void showSpecialCodes(char from, char to) {
    for(char toShow = from; toShow <= to; toShow++) {
        if(!(toShow >= 'a' && toShow <= 'z')) {
            if(!(toShow >= 'A' && toShow <= 'Z')) {
                System.out.println((int)toShow);
            }
        }
    }
}
```

Wird um so umständlicher, je mehr Bedingungen dazukommen.

---

# Quality of Life: continue

```java
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
```

---

# Quality of Life: if - else if - else

```java
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
```

---

# Quality of Life: if - else if - else

```java
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
```

---

# Herangehensweise zum Programmieren

`public static void showPrimes(int from, int to)`: Alle Primzahlen zwischen `from` und `to` ausgeben
* Scheinbar große Aufgabe -> erst unterteilen
    * Was ist der kleinste mögliche Schritt?
    * Implementieren, ausprobieren
    * Wiederholen, bis fertig
* Gemeinsam ausprobieren!

---

# Üben der Herangehensweise

`public static int getStepsUntil1(int start, int maxSteps, int adder)`
* Rekursiv definierte Reihe
* Nächstes Glied `X(n+1)` ist:
    * Wenn `X(n)` durch 3 Teilbar, dann `X(n)/3`
    * Sonst: `X(n)+adder`
* Funktion gibt zurück:
    * Anzahl der Schritte, bis ein Glied 1 ist
    * Falls diese Anzahl größer `maxsteps` ist, `-1`

-->
