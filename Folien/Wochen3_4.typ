#import "header.typ": *

#show: htwslides

#title-slide(
  title: "Programmierung 1",
  subtitle: "Wochen 3-4: Der Schritt zu Java",
  institution-name: "HTW Berlin"
)

== Einführung

- Neben Strukturdiagrammen gibt es viele Programmiersprachen

```python
vals = [1, 6, 5, 3]
for i in range(0, len(vals)):
    print(vals[i])
```

```c
#include <iostream>
int vals[4] = {1, 6, 5, 3};
for(int i=0; i<sizeof(vals)/sizeof(int); i+=1) {
    std::cout << vals[i] << "\n";
}
```

Was tut dieser Code? Ideen, ohne Python/C++ zu können?

== Warum Java?

- Ist eine breit eingesetzte Programmiersprache
- Kümmert sich um Speicherverwaltung (anders als bspw. C)
- Besitzt viele Komfort-Features
- Beliebt auf dem Markt

== Verwendung von LLMs

- Trotz LLMs:
  - Selber programmieren können ist wichtig!
  - Unbedingt Code ausprobieren, verändern, selber schreiben!
  - Sonst: Kein Verständnis, Halluzinationen #sym.arrow wertlos auf dem Arbeitsmarkt, Studium = verschwendete Zeit
- Realität: Viel Code von LLMs generiert
  - Wichtig: Selber den Algorithmus entwickeln und verstehen!
  - Richtige Tools verwenden statt einfach Aufgabe in ChatGPT pasten
  - In Programmierung 1: Nur selber Code schreiben, Grundlage!
#sym.arrow Klausur direkt in VPL:
  - Kaum Syntax-Unterstützung, keine Code Completion
  - *kein lauffähiger Code = durchgefallen*.

== Erstes Java-Programm

```java
// Jede Klasse muss in gleichnamiger Datei stehen
// Jeder Java-Code muss in einem Klassen-Block stehen: {}
public class HelloWorld {
  // Code ist in Methoden unterteilt. Anweisungen in 
  // Methoden-Blöcken
  // Spezielle Methode main: Startpunkt eines Programms
  public static void main() {
    // System.out.println: Bildschirmausgabe    
    System.out.println("Hello, world!");
    // Jede Zeile muss mit einem       ; enden
  }
  // Jede geöffnete Klammer muss geschlossen werden
}
```

HelloWorld.main() (Klassenname.Methodenname):\ 
#diagram(
  spacing: (3em, 1em),
  node-stroke: 1pt,
  edge-stroke: 1pt,
  node((0,0), [Start], radius: 1.3em),
  edge("-|>"),
  node((1,0), [println("Hello, world!")], corner-radius: 5pt),
  edge("-|>"),
  node((2,0), [Ende], radius: 1.3em),
)

== Allgemeine Struktur eines Java-Programms


#grid(
  columns: (1fr, 1.2fr),
  gutter: 0.5em,
  [
    ```java
    public class Klassenname {
      public static void methode1() {
        anweisung1;
        anweisung2;
        //...
        anweisungN1;
      }
      public static void methode2() {
        anweisung1;
        anweisung2;
        //...
        anweisungN2;
      }
      //...
      public static void methodeM() {
        anweisung1;
        anweisung2;
        //...
        anweisungN3;
      }
    }
    ```
  ],
  [
    Hierarchisch aufgebaut: 
    - Klasse 
      - Methode 
        - Anweisungen

    Anweisungen:
    - Werden nacheinander abgearbeitet
    - Können sein:
      - Variable erstellen
      - Variablenwert ändern
      - Methode aufrufen
      - Bedingung/Schleife
      - Rückgabe
  ]
)

== Variablen in Java

HelloWorld.main():\ 
#diagram(
  spacing: (1em, 1em),
  node-stroke: 1pt,
  edge-stroke: 1pt,
  node((0,0), [Start], radius: 1.3em),
  edge("-|>"),
  node((1,0), [i=0], corner-radius: 5pt),
  edge("-|>"),
  node((2,0), [k=3], corner-radius: 5pt),
  edge("-|>"),
  node((3,0), [i=i+1], corner-radius: 5pt),
  edge("-|>"),
  node((4,0), [i=(k+3*i)%2], corner-radius: 5pt),
  edge("-|>"),
  node((5,0), [System.out.print(i)], corner-radius: 5pt),
  edge("-|>"),
  node((6,0), [Ende], radius: 1.3em),
)
```java
public class HelloWorld {
  public static void main() {
    // Variablen (hier: Zahlen) erstellen: deklarieren und initialisieren
    int i = 0;
    int k = 3;
    // Variablenwert ändern: Wert von i um 1 erhöhen
    i ++;
    // Mathematische Operationen (hier: +, * und Modulo)
    i = (k + 3*i) % 2;
    // Methode aufrufen
    System.out.print(i);
  }
}
```

== Eigene Methoden in Java

#grid(
  columns: (1fr, 1fr),
  [
    HelloWorld.printNumber(n: Zahl)
    #diagram(
      spacing: (1em, 1em),
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node((0,0), shape: ellipse, width: 5em, [Start\ n: Zahl]),
      edge("-|>"),
      node((0, 1), [System.out.print(n)]),
      edge("-|>"),
      node((0,2), shape: ellipse, [Ende]),
    )
    HelloWorld.main()
    #diagram(
      spacing: (1em, 1em),
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node((0,0), shape: ellipse, [Start]),
      edge("-|>"),
      node((0, 1), [printNumber(10)]),
      edge("-|>"),
      node((0,2), shape: ellipse, [Ende]),
    )
  ],
  [
    ```java
    public class HelloWorld {
      public static void printNumber(int n) {
        System.out.println(n);
      }
      public static void main() {
        printNumber(10);
      }
    }
    ```
    Java: Explizite Datentypen
    - `int n` = "n: Zahl"
    - `void printNumber` = "Ende" ohne Rückgabe
  ]
)

== Grundvokabular: Datentypen

Wir arbeiten mit Zahlen, Texten. Aber Computer kann nur 1 und 0 (bit)?
- Binärsystem: 
    - Wie 10er-System, aber mit nur 2 Ziffern.
    - Umrechnung mit 2er statt 10er Potenzen, Beispiel: Addition
- Definierte Breite einer Zahl: 8 bit = 1 byte -> 0 - 255
- Datentypen: Sagen dem Computer, was der Speicherinhalt bedeutet
    - `int`, `long`: Ganze Zahl
    - `float`, `double`: Gleitkommazahl #sym.arrow Mantisse+Exponent
    - `char`: Buchstabe (mit Hochkomma: `char x = 'a';`) #sym.arrow ASCII
    - `boolean`: Ja/nein (`true` oder `false`)
    - `String`: Text mit mehreren Zeichen hintereinander (mit Anführungsstrichen: `String text = "Text";`)

== Speicherinterpretation: Datentypen

Was bedeutet `01001000 01101001`?
- Zwei `byte`: 72, 105?
- Ein `short`: 18537?
- Zwei `char`: "H", "i"?

-> Datentypen müssen in Java deklariert werden und *ändern die Bedeutung* von Variablen - z. B. `00110111` kann die Zahl 55 oder das Zeichen "7" sein (aber niemals die Zahl 7)! 


== Grundvokabular: Java-Programm

#let col_declaration=rgb("#8A7420")
#let col_assignment=rgb("#BA06A8")
#let col_jump=rgb("#004FE0")
#let col_control=rgb("#969696")

#only("2-")[
  #codly(
    annotation-format: none,
    annotations: (
      (start: 1, end: 1, content: [Klassendefinition]),
      (start: 2, end: 2, content: [Beginn Codeblock (Klasse)]),
      (start: 3, end: 3, content: [Methodendefinition]),
      (start: 4, end: 4, content: [Beginn Codeblock (Methode)]),
      (start: 5, end: 5, content: [#text(col_declaration)[Variablen-Deklaration]]),
      (start: 6, end: 6, content: [#text(col_assignment)[Zuweisung Variable=Ausdruck]]),
      (start: 7, end: 7, content: [#text(col_declaration)[Deklaration] mit #text(col_assignment)[Initialisierung]]),
      (start: 8, end: 8, content: [#text(col_assignment)[Compound assignment]]),
      (start: 9, end: 9, content: [#text(col_jump)[Methodenaufruf]]),
      (start: 10, end: 10, content: [#text(col_jump)[Rückgabe]]),
      (start: 11, end: 11, content: [Ende Codeblock (Methode)]),
      (start: 12, end: 12, content: [Ende Codeblock (Klasse)]),

    ),
    highlights: (
      (line: 6, start: 11, end: 13, fill: orange, tag: "(Ausdruck)"),
      (line: 7, start: 21, end: 25, fill: blue, tag: "(String literal)"),
      (line: 8, start: 15, end: 18, fill: blue, tag: "(String literal)"),
      (line: 9, start: 24, end: 35, fill: orange, tag: "(Ausdruck)"),
    )
  )
]

```java
public class HelloWorld 
{
  public static int triple(int n) 
  {
    int res;
    res = n*3;
    String prefix = "res";
    prefix += ": ";
    System.out.println(prefix + res);
    return res;
  }
}
```

#only(2)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    [
      Anweisung: Aktion/Befehl
      - #text(col_declaration)[Deklarationsanweisung]
      - #text(col_assignment)[Zuweisungsanweisung]
      - #text(col_jump)[Sprunganweisung]
    ],
    [
      Ausdruck: Berechnung
      - Liefert einen Wert
      - Verschachtelbar
      - Ändert nichts (außer #text(col_assignment)[compound])
    ]
  )
]

#only(3)[
Warum ist das wichtig? Korrektes Fachvokabular ist nötig für:
- Gemeinsame Sprache in Informatik
- Unterstützung bei Übungsaufgaben
- Prüfung
]

== Bedingungen in Java

ja/nein #sym.arrow `if-else`, `{}` definieren Codeblock
    
#grid(
  columns: (1.2fr, 1fr),
  [
    #diagram(
      spacing: (1em, 1em),
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node((0,0), shape: ellipse, width: 7em, height: 4em, [Start\ w: Zahl\ h: Zahl]),
      node((1,0), height: 2em, [$"BMI"=frac("w", "h*h")$]),
      node((1,1), shape: diamond, height: 1.5em, align(center)[$"BMI" < 20$]),
      node((1,2), shape: diamond, height: 1.5em, align(center)[$"BMI" <= 24.9$], name: <n2_3>),
      node((0,1), shape: ellipse, width: 7em, height: 2em, [Untergewicht], name: <n1>),
      node((1,3), shape: ellipse, width: 7em, height: 2em, [Normalgewicht], name: <n2_1>),
      node((0,2), shape: ellipse, width: 7em, height: 2em, [Übergewicht], name: <n2_2>),
      edge((0,0), (1,0), "-|>"),
      edge((1,0), (1,1), "-|>"),
      edge((1,1), (0,1), "-|>", [ja]),
      edge((1,2), (1,3), "-|>", [ja]),
      edge((1,2), (0,2), "-|>", [nein]),
      edge((1,1), (1,2), "-|>", [nein]),
      hlnode(((<n1>))),
      hlnode(((<n2_1>, <n2_2>, <n2_3>)), col: orange.lighten(90%)),
    )
  ],
  [
    #codly(
      highlighted-lines: (
        (5, blue.lighten(60%)),
        (6, blue.lighten(60%)),
        (7, blue.lighten(60%)),
        (9, orange.lighten(60%)),
        (10, orange.lighten(60%)),
        (11, orange.lighten(60%)),
        (12, orange.lighten(60%)),
        (13, orange.lighten(60%)),
        (14, orange.lighten(60%)),
        (15, orange.lighten(60%)),
        (16, orange.lighten(60%)),
      )
    )
    ```java
public class Main {
  public static String bmi(double w, double h) {
    double BMI = w/(h*h);
    if(BMI < 20) 
    {
      return "Untergewicht";
    }
    else 
    { 
      if(BMI <= 24.9) {
        return "Normalgewicht";
      }
      else {
        return "Übergewicht";
      }
    }
  }
}
    ```
  ]
)

== Bedingungen: if-else if-else

#only(2)[
  #codly(
    annotation-format: none,
    annotations: (
      (start: 1, end: 1, content: [Klassendefinition]),
      (start: 2, end: 2, content: [Methodendefinition]),
      (start: 3, end: 3, content: [#text(col_declaration)[Deklaration] mit #text(col_assignment)[Initialisierung]]),
      (start: 4, end: 4, content: [#text(col_control)[Kontrollfluss-Anweisung]]),
      (start: 5, end: 5, content: [#text(col_jump)[Rückgabe]]),
      (start: 7, end: 7, content: [#text(col_control)[Kontrollfluss-Anweisung]]),
      (start: 8, end: 8, content: [#text(col_jump)[Rückgabe]]),
      (start: 10, end: 10, content: [#text(col_control)[Kontrollfluss-Anweisung]]),
      (start: 11, end: 11, content: [#text(col_jump)[Rückgabe]]),

    ),
    highlights: (
      (line: 3, start: 18, end: 24, fill: orange, tag: "(Ausdruck)"),
      (line: 4, start: 8, end: 15, fill: orange, tag: "(Ausdruck)"),
      (line: 7, start: 13, end: 23, fill: orange, tag: "(Ausdruck)"),
      (line: 5, start: 14, end: 27, fill: blue, tag: "(String literal)"),
      (line: 8, start: 14, end: 28, fill: blue, tag: "(String literal)"),
      (line: 11, start: 14, end: 27, fill: blue, tag: "(String literal)"),
    )
  )
]

```java
public class Main {
  public static String bmi(double w, double h) {
    double BMI = w/(h*h);
    if(BMI < 20) {
      return "Untergewicht";
    }
    else if(BMI <= 24.9) {
      return "Normalgewicht";
    }
    else {
      return "Übergewicht";
    }
  }
}
``` 
#only(2)[
  - `if`, `else if` (1-n Mal), `else`: #text(col_control)[Kontrollfluss-Answeisungen]
  - `if`, `else if`: Benötigen Ausdruck, der zu `true`/`false` evaluiert

]

== Schleifen in Java

#only("1-3")[
  `while`: Tue Dinge in Codeblock immer wider, so lange Ausdruck `true` ist
]
#only("4-")[
  `for`: Wie while, aber mit Initialisierung und Änderung Zählvariable
]

#grid(
  columns: (1fr, 1fr),
  [
    #diagram(
      spacing: (1em, 1em),
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node((0,0), shape: ellipse, width: 7em, height: 4em, [Start\ out: Zahl]),
      edge("-|>"),
      node((1,0), [n=out]),
      edge("-|>"),
      node((1,1), shape: diamond, height: 1.5em, align(center)[$n >= 0$], name: <n0>),
      node((0,1), [Ausgabe: out], name: <n1>),
      edge("-|>"),
      node((0,2), [n=n-1], name: <n2>),
      edge((0,2), (0,1), "-|>"),
      node((1,3), shape: ellipse, [Ende]),
      edge((1,1), (0,1), "-|>", [ja]),
      edge((1,1), (1,3), "-|>", [nein]),
      hlnode((<n0>, <n1>, <n2>)),
    )
  ],
  [
    #only("1-3")[

      #codly(
        highlighted-lines: (
          (4, blue.lighten(60%)),
          (5, blue.lighten(60%)),
          (6, blue.lighten(60%)),
          (7, blue.lighten(60%)),
        )
      )
      ```java
public class Main {
  public static void pn(int out) {
    int n = out;
    while(n >= 0) {
      System.out.println(out);
      n -= 1;
    }
  }
}
      ```
    ]
    #only("4-")[

      #codly(
        highlighted-lines: (
          (3, blue.lighten(60%)),
          (4, blue.lighten(60%)),
          (5, blue.lighten(60%)),
        )
      )
      ```java
public class Main {
  public static void pn(int out) {
    for(int n=out; n >= 0; n-=1) {
      System.out.println(out);
    }
  }
}
      ```
    ]

    #only(2)[
      Was ist (Fachvokabular):
      - `while`?
      - `n >= 0`?
    ]
    #only(3)[
      Was ist (Fachvokabular):
      - `while`: #text(col_control)[Kontrollfluss-Anweisung]
      - `n >= 0`: Ausdruck
    ]
    #only(4)[
      Was ist (Fachvokabular):
      - `for`?
      - `int n=out`?
      - `n >= 0`?
      - `n -= 1`?
    ]
    #only(5)[
      Was ist (Fachvokabular):
      - `for`: #text(col_control)[Kontrollfluss-Anweisung]
      - `int n=out`: #text(col_declaration)[Deklarations-] mit #text(col_assignment)[Zuweisungs-Anweisung]
      - `n >= 0`: Ausdruck
      - `n-=1`: #text(col_assignment)[Zuweisungs-Anweisung]
    ]
  ]
)



== Dateneingabe

Wo kommen die Werte her? Spezialisierte Methoden, z.B. für:
- Dateien (später)
- GUI (nächstes Semester)
- Texteingabe: Scanner-Klasse
  - Erstellen einer Scanner-Variable:\ `Scanner myScanner = new Scanner(System.in);`\ Details warum `new`: Später
  - Einlesen mittels z.B.:
    - `int`: `Scanner.nextInt()`
    - `double`: `Scanner.nextDouble()`
    - `String`: `Scanner.nextLine()`

== Beispiel Dateneingabe

#grid(
  columns: (1fr, 1.15fr),
  gutter: 1em,
  [
    Algorithmus-Idee:
    #diagram(
      spacing: (1em, 1em),
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node((0,0), shape: ellipse, [Start]),
      edge("-|>"),
      node((1,0), [Ausgabe:\ "Höhe?"]),
      edge("-|>"),
      node((1,1), [h=einlesen\ mit Scanner]),
      edge("-|>"),
      node((0,1), [Ausgabe:\ "Gewicht?"]),
      edge("-|>"),
      node((0,2), [w=einlesen\ mit Scanner]),
      edge("-|>"),
      node((1,2), [gew=bmi(w, h)]),
      edge("-|>"),
      node((1,3), [Ausgabe:\ "Sie haben "+gew]),
      edge("-|>"),
      node((0,3), shape: ellipse, [Ende]),
      
    )
  ],
  [
    ```java
public class Main {
  public static void main() {
    Scanner s = new Scanner(System.in);
    System.out.print("Höhe?");
    int h = s.nextInt();
    System.out.print("Gewicht?");
    int w = s.nextInt();
    String gew = bmi(w, h);
    System.out.println("Sie haben "+gew);
  }
}
    ```

    Zusammen: Welche Zeile ist was?
    - Mehrere Sprachelemente in einer Zeile möglich
    - Methodenaufruf kann #text(col_jump)[Sprunganweisung] und Ausdruck sein
  ]
)

= Speicherorganisation

== Stack


- Eigener Speicherbereich für jede Methode, pro Aufruf neu
- Variablen der Methode werden dort angelegt/übergeben
- ``printNumbers(0, 100, 2)`` könnte ergeben:

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
 [ 71 ], [... ], [Rücksprung-Adresse vorherige Methode],
 [ ... ], [ ... ], [ Restlicher Stack ]

)


== Scope

Scope ergibt sich aus Stack:
- Methoden verändern nur ihre eigenen Werte!
- Methoden kriegen nur Kopien der Argument-Werte!

#only(2)[
  ```java
public class StackBeispiel {
  public static void pn(int from, int to, int by) {
    for(; from<to; from += by) {
      System.out.println(from);
    }
  }
  public static void main(String[] args) {
    from = 0;
    pn(from, 100, 2);
    System.out.println("From: " + from);
  }
}
  ```
  #v(-0.3cm)
  - Was tut `pn(0, 100, 2)`?
  - Was wird in Zeile 10 ausgegeben? 0 oder 100?
]

== Randnotiz: Highlighting, Einrückung

#only(1)[
  Korrekt eingerückter Code: Codeblöcke erkennbar
  ```java
public class StackBeispiel {
  public static void pn(int from, int to, int by) {
    for(; from<to; from += by) {
      System.out.println(from);
    }
  }
  public static void main(String[] args) {
    from = 0;
    pn(from, 100, 2);
    System.out.println("From: " + from);
  }
}
  ```
]
#only(2)[
  Nicht eingerückt: Ist das lesbar?
```java
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
```
]
#only(3)[
  Falsch eingerückt: Ist das lesbar?
```java
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
```
]
#only(4)[
Ganz schlimm: Nicht eingerückt, kein highlighting.
```
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
```
]

= Exkurs: Bytecode

== Programmcode im Speicher

Der Computer kann aber keinen Code, nur Zahlen...?

#table(
columns: 4,
[Befehl ], [ Wert ], [ Argumente ], [ Kommentar ], 
[ print ], [ 1 ], [ 1 ], [ Auszugebende Adresse ], 
[ jeq ], [ 2 ], [ 3 ], [ 2 Adressen verlgeichen, 3: Sprungziel ], 
[ add ], [ 3 ], [ 2 ], [ 1: Adresse, 2: Zu addierender Wert ], 
[ jmp ], [ 4 ], [ 1 ], [ Sprung-Adresse ], 
[ put ], [ 5 ], [ 2 ], [ 1: Adresse, 2: Wert ], 

)


== Programmcode #sym.arrow Bytecode

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

#v(-0.5cm)
Programm: 90: 5 69 0 5 68 10 2 69 68 107 1 69 3 69 1 4 96 0


== Verständnisübung

#table(
columns: 4,
[Befehl ], [ Wert ], [ Argumente ], [ Kommentar ], 
[ print ], [ 1 ], [ 1 ], [ Auszugebende Adresse ], 
[ jeq ], [ 2 ], [ 3 ], [ 2 Adressen verlgeichen, 3: Sprungziel ], 
[ add ], [ 3 ], [ 2 ], [ 1: Adresse, 2: Zu addierender Wert ], 
[ jmp ], [ 4 ], [ 1 ], [ Sprung-Adresse ], 
[ put ], [ 5 ], [ 2 ], [ 1: Adresse, 2: Wert ], 

)


90: 5 60 0 5 59 2 5 58 100 2 60 58 120 1 60 5 57 0 2 57 59 99 3 60 1 3 57 1 4 108 0
