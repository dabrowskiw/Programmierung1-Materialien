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
  institution-name: "HTW Berlin"
)

= Programmiersprachen

== Einführung

- Neben Strukturdiagrammen gibt es viele Programmiersprachen

#sourcecode[```python
vals = [1, 6, 5, 3]
for i in range(0, len(vals)):
    print(vals[i])
```]

#sourcecode[```c
#include <iostream>
int vals[4] = {1, 6, 5, 3};
for(int i=0; i<sizeof(vals)/sizeof(int); i+=1) {
    std::cout << vals[i] << "\n";
}
```]


== Java

- Weit eingesetzte Programmiersprache
- Kümmert sich um Speicherverwaltung (anders als bspw. C)
- Besitzt viele Komfort-Features
- Beliebt auf dem Markt

== Erstes Java-Programm

#sourcecode[```java
// Jede Klasse muss in gleichnamiger Datei stehen
// Jeder Java-Code muss in einem Klassen-Block stehen: {}
public class HelloWorld {
  // Code ist in Methoden unterteilt. Anweisungen in 
  // Methoden-Blöcken
  // Spezielle Methode main: Startpunkt eines Programms
  public static void main(String[] args) {
    // System.out.println: Bildschirmausgabe    
    System.out.println("Hello, world!");
    // Jede Zeile muss mit einem       ; enden
  }
  // Jede geöffnete Klammer muss geschlossen werden
}
```]


== Variablen in Java

#sourcecode[```java
public class HelloWorld {
  public static void main(String[] args) {
    // Variablen (hier: Zahlen) deklarieren und initialisieren
    int i = 0;
    int k = 3;
    // Wert von i um 1 erhöhen
    i ++;
    // Mathematische Operationen (hier: +, * und Modulo)
    i = (k + 3*i) % 2;
    System.out.print(i);
  }
}
```]

== Kontrollstrukturen: if

#only("1,3")[
- Bedingung, Raute in Flussdiagramm
- Muss Ausdruck enthalten, der "ja" oder "nein" zurückgibt
]
#only(2)[
#grid(columns: (1.8fr, 1fr),

  [#sourcecode[```java
    public static void main(
                String[] args) {
      int i=5;
      if(i < 5) {
        System.out.println(
                  "i kleiner 5");
      }
      System.out.print(".");
    }
  ```]
],[
  #diagram(
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node((0,0), [Start], radius: 1.3em),
    edge("-|>"),
    node((0, 1), [i = 5]),
    edge("-|>"),
    node((0,2), shape: diamond, align(center)[i\<5?]),
    edge("r", "-|>", [ja]),
    edge("d", "-|>", [nein]),
    node((1,2), ["i kleiner 5"], corner-radius: 5pt),
    edge((1,2), (0,3), "-|>"),
    node((0,3), ["."], corner-radius: 5pt),
    edge("r", "-|>"),
    node((1,3), [Ende], radius: 1.3em),
  )
])
]

#only(3)[
  - else if: Erlaubt Verkettung von Bedingungen
  - else: Falls keine der Bedingungen zutrifft
]

== Kontrollstrukturen: if-else if

#sourcecode[```java
    public static void main(String[] args) {
      int i=5;
      if(i < 5) {
        System.out.println("i kleiner 5");
      }
      else if(i == 5) {
        System.out.println("i gleich 5");
      }
      System.out.print(".");
    }
  ```]

Flussdiagramm dazu?

== Kontrollstrukturen: if-else if-else

#sourcecode[```java
    public static void main(String[] args) {
      int i=5;
      if(i < 5) {
        System.out.println("i kleiner 5");
      }
      else if(i == 5) {
        System.out.println("i gleich 5");
      }
      else {
        System.out.print("i ist größer 5");
      }
    }
  ```]

== Kontrollstrukturen: Schleifen

- Schleife: Immer wieder das gleiche tun, so lange Bedingung erfüllt ist
- Wie "if Bedingung erfüllt #sym.arrow wieder zurück zum Schelifenanfang"
- Flussdiagramm?

#sourcecode[```java
    public static void main(String[] args) {
      int i=5;
      int fac = 1;
      while(i > 0) {
        fac = fac * i;
        i = i-1;
      }
    }
  ```]

== Kontrollstrukturen: for-Schleife

Sehr häufig: Zählvariable #sym.arrow Kurzform `for`:\ 
`for(Definition Variable; Bedingung; Änderung Variable)`

#sourcecode[```java
    public static void main(String[] args) {
      int fac = 1;
      for(int i=5; i > 0; i--) {
        fac = fac * i;
      }
    }
  ```]

== Funktionen in Java

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

= Speicherorganisation

== Stack


- Eigener Speicherbereich für jede Funktion, pro Aufruf neu
- Variablen der Funktion werden dort angelegt/übergeben
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
 [ 71 ], [... ], [Rücksprung-Adresse vorherige Funktion ],
 [ ... ], [ ... ], [ Restlicher Stack ]

)


== Scope

Scope ergibt sich aus Stack:
- Funktionen verändern nur ihre eigenen Werte!
- Funktionen kriegen nur Kopien der Argument-Werte!


== Scope

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


== Scope

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

== Scope

#sourcecode[```
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

= Einstiegsaufgaben Java

== Allgemeine Hinweise

- Code selber schreiben, nicht copy-pasten!
- LLMs zum Erklären, nicht um sich den Code schreiben zu lassen!
- Selber coden ist viel besser als Tutorials lesen (siehe Video)
- Fehler machen und finden ist wichtig!
- Verwenden Sie das Cheatsheet im Moodle!
- Gehen Sie schrittweise vor - kleine Änderungen, immer wieder ausprobieren!

== Aufgabe 1

- Implementieren Sie eine Klasse `HelloWorld` mit main-Methode
- Die main-Methode soll:
  - "Hello, world!" ausgeben.
  - Danach "Hallo, \<Ihr Name>" ausgeben.
  - Fügen Sie eine Variable `int x=5` und eine Bedingung hinzu:
    - Wenn x kleiner 4 ist, soll "Hello, world!" ausgegeben werden
    - Sonst soll "Hallo, \<Ihr Name>" ausgegeben werden
  - Beobachten Sie: Was wird ausgegeben?
  - Verändern Sie den Wert von x so, dass "Hello, world!" ausgegeben wird.

== Aufgabe 2

- Implementieren Sie eine Klasse `BMICalculator` mit main-Methode.
- Implementieren Sie eine Methode `public static void showBMI(int w, int h)`. Diese soll zunächst nur wie Werte von w und h ausgeben.
- Rufen Sie `showBMI` von `main` aus mit unterschiedlichen Argumenten auf, beobachten Sie.
- Implementieren Sie die Ausgabe in `showBMI` entsprechend Folie 13 der ersten Vorlesung. Testen Sie mit unterschiedlichen Werten von w und h (ideal: Erst nur Ausgabe von BMI, dann der Rest).

== Aufgabe 3

- Implementieren Sie zusätzlich die Methode `public static void showBMI(int w, int h, char sex)`. `sex` soll nur 'm' oder 'w' sein können. Verwenden Sie die Tabelle von Folie 12 aus der Vorlesung. 
- Implementieren Sie zusätzlich die Methode `public static void f(int w, int h, int uglimit, int nglimit)` entsprechend Folie 14 aus der Vorlesung und verwenden Sie sie in beiden Versionen von `showBMI`.

== Aufgabe 4

- Implementieren Sie eine Klasse `TaxCalculator` mit main-Methode.
- Implementieren Sie eine Methode `public static void calculateTaxrate(int income)`, die den Steuersatz entsprechend Folie 15 aus der Vorlesung ausgibt.
- Verwenden Sie für die Berechnung des Steuersatzes eine Variable vom Typ `double`
- Gehen Sie schrittweise vor:
  - Geben Sie bei Einkommen von 0-744 den Wert "0" aus, sonst "Nicht unterstütztes Einkommen".
  - Erweitern Sie das Programm so, dass auch für Einkommen von 745-14753 der korrekte Wert ausgegeben wird. Testen Sie.
  - Gehen Sie so Zeile für Zeile vor.
