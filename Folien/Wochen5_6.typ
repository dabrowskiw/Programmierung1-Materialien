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

