#import "header.typ": *

#show: htwslides

#title-slide(
  title: "Programmierung 1",
  subtitle: "Wochen 5-6: Arrays",
  institution-name: "HTW Berlin"
)

== Recap

```java
public static void doSomething(int value, boolean change) {
  if(change) {
    value = value - 2;
  }
}
public static void main() {
  int value = 3;
  doSomething(value, 1==(2-1));
  System.out.println(value);
}
```

#only(1)[
  Sprachelemente:
  - Codeblöcke?
  - Methodendefinitionen?
  - Ausdrücke?
  - Anweisungen? Welche Art?
]

#only(2)[
  Stack:
    - Was wird in Zeile 7 ausgegeben?
    - Was steht wann auf dem Stack?
]

== Zusammenhängende Daten

Beispiel: Mittelwert von Tagestemperaturen in der Woche

```java
public static double getAverageTemp(double t1, double t2, double t3, double t4, double t5, double t6, double t7) {
  double sum = t1+t2+t3+t4+t5+t6+t7;
  return sum/7;
}
public static void main() {
  double weekAverage = getAverageTemp(12.5, 11.9, 13.5, 13.2, 11.9, 8.7, 5.8);
  System.out.println("Durchschnittstemperatur diese Woche: " + weekAverage);
}
```

#only(2)[
  Und jetzt für das ganze Jahr...?

  #sym.arrow Spezieller Datentyp für zusammenhängende Werte
]

== Arrays

- Speichern mehrerer zusammenhängender Werte oft nötig
    - Verlauf von einem Wert über die Zeit (Aktie, Infektionen, Ton...)
    - Liste von Werten (Koordinaten von Städten, Namen...)
    - Mehrdimensionale Werte (Pixel im Bild, Niederschlagsmengen...)
- Es kann Arrays von jedem Datentyp geben (auch von Arrays)
- Alle Werte im Array haben *den selben Datentyp*
- Jeder Wert hat einen Index, beginnend bei 0
- Die Länge eines Arrays ist *fest* (was würde sonst im RAM passieren?)

Beispiel für ein `double`-Array mit Temperaturen:
#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  inset: 0.2em,
  stroke: 1pt+black,
  [*Wert*], [12.5], [11.9], [13.5], [13.2], [11.9], [8.5], [5.8],
  [*Index*], [0], [1], [2], [3], [4], [5], [6],
)

== Eindimensionale Arrays

  #codly(
    annotation-format: none,
    annotations: (
      (start: 1, end: 1, content: [#text(col_declaration)[Deklaration]]),
      (start: 2, end: 2, content: [#text(col_assignment)[Initialisierung]]),
      (start: 3, end: 3, content: [#text(col_assignment)[Wertzuweisung über Index]]),
      (start: 4, end: 5, content: [#text(col_declaration)[Deklaration] mit #text(col_assignment)[Initialisierung]]),
      (start: 6, end: 6, content: [Wertzugriff über Index]),
    ),
  )
```java
double[] temperatures;
temperatures = new double[7];
temperatures[0] = 12.5;
String[] days = {"Mo", "Di", "Mi", "Do", 
                 "Fr", "Sa", "So"};
System.out.println("3. Tag: " + days[2]);
```

Array ist eine *Referenz-Variable*:
- Enthält nicht die Werte, sondern *Speicheradresse* wo die Werte sind
- Eigentliche Werte sind auf dem *Heap* Gespeichert
- Deklaration: Setzt Wert auf `null` (ungültige Adresse)
- Initialisierung:
  - Reserviert benötigten Speicherplatz auf *Heap*
  - Schreibt Heap-Adresse in Variablenwert auf *Stack*
- Wertzugriff: Adresse in Variable #sym.arrow Wert auf Heap

== Beispiel Speicherorganisation

#grid(
  columns: 2,
  gutter: 1em,
  [
    #only(1)[
```java
public static void main() {
  int x = 6;
  int[] vals = {1, x, 5, 3};
}
```]
    #only(2)[
```java
public static void main() {
  int x = 6;
  int[] vals = {1, x, 5, 3};
  f(vals);
}
```]
  ],
  [
    #only(2)[
```java
public static void f(int[] v) {
  System.out.println(v[1]);
  v[1]=1;
}
```]
  ]
)
#grid(
  columns: 2,
  gutter: 1em,
  [*Stack* (Adressen 0-100)
    #only(1)[
      #table(
        columns: 3,
        table.header(
         [  Adresse  ], [  Wert  ], [  Kommentar  ], 
        ),
        [  ...  ], [  ...  ], [  Andere Variablen ],
        [  12  ], [  ...  ], [  Rücksprungadresse  ],
        [  13  ], [  6  ], [  x  ],
        [  14  ], [  173  ], [  vals  ],
      )
    ]
    #only(2)[
      #table(
        columns: 3,
        table.header(
         [  Adresse  ], [  Wert  ], [  Kommentar  ], 
        ),
        [  ...  ], [  ...  ], [  Andere Variablen ],
        [  12  ], [  ...  ], [  Rücksprungadresse  ],
        [  13  ], [  6  ], [  x  ],
        [  14  ], [  173  ], [  vals  ],
        [  15  ], [  ...  ], [  Rücksprungadresse  ],
        [  16  ], [  173  ], [  v  ],
      )
    ]
  ],
  [*Heap* (Adressen ab 100)
    #table(
      columns: 3,
      table.header(
       [  Adresse  ], [  Wert  ], [  Kommentar  ], 
      ),
      [  ...  ], [  ...  ], [  Andere Variablen ],
      [  173  ], [  4  ], [  Länge (metadata)  ],
      [  174  ], [  1  ], [  1. Wert  ], 
      [  175  ], [  6  ], [ 2. Wert  ],
      [  176  ], [  5  ], [  3. Wert  ],
      [  177  ], [  3  ], [  Letzter Wert ],
      [  ...  ], [...], [  Andere Variablen ],
    )
  ]
)

== Beispiel Array-Verwendung

Idee:
- Array mit Temperaturen: `double[] temps`
- Array-Länge: `temps.length`
- Durchschnittswert aller Temperaturen: Flussdiagramm (Tafel)

#only(2)[
```java
public static double getAverageTemp(double[] temps) {
  double sum = 0;
  for(int i=0; i<temps.length; i++) {
    sum += temps[i];
  }
  return sum/temps.length;
}
public static void main() {
  double[] temps = {12.5, 11.9, 13.5, 13.2, 11.9, 8.7, 5.8};
  double weekAverage = getAverageTemp(temps);
  System.out.println("Durchschnittstemperatur diese Woche: " + weekAverage);
}
```
]

== Beispiel Array-Verwendung

Häufige Schleife: "Für jedes Element des Arrays, tue..."

#sym.arrow Kurzschreibweise: `for(<datatype> x : array) {...}`

#codly(
  highlighted-lines: (
        (3, blue.lighten(60%)),
        (4, blue.lighten(60%)),
        (5, blue.lighten(60%)),
      )
)
#only(2)[
```java
public static double getAverageTemp(double[] temps) {
  double sum = 0;
  for(double temp : temps) {
    sum += temp;
  }
  return sum/temps.length;
}
public static void main() {
  double[] temps = {12.5, 11.9, 13.5, 13.2, 11.9, 8.7, 5.8};
  double weekAverage = getAverageTemp(temps);
  System.out.println("Durchschnittstemperatur diese Woche: " + weekAverage);
}
```
]
== Referenzvariablen und Scoping

```java
  public static void swapValues(int[] values, int x) {
    values[0] = x;
    x = values[1];
  }
  public static void main() {
    int[] vals = new int[] {0, 1, 2, 3};
    int x = 12;
    System.out.println(vals[0] + ", " + x); 
    doSomethingElse(vals);
    System.out.println(vals[0] + ", " + x); 
  }
```

#grid(
  columns: 2,
  gutter: 1em,
  [
    Was passiert:
    - Auf dem Stack?
    - Auf dem Heap?
    - In Zeile 8?
    - In Zeile 10?
  ],
  [
    #only(2)[
      Merke:
      - *Primitive Variable*: Wert direkt auf *Stack*
      - *Referenz-Variable*: 
        - Adresse in *Stack*
        - Werte auf *Heap*
    ]
  ]
)

== Referenzvariablen und Scoping

#codly(
  highlighted-lines: (
        (2, blue.lighten(60%)),
        (3, blue.lighten(60%)),
      )
)
```java
  public static void swapValues(int[] values, int x) {
    values = new int[4];
    values[0] = x;
    x = values[1];
  }
  public static void main() {
    int[] vals = new int[] {0, 1, 2, 3};
    int x = 12;
    System.out.println(vals[0] + ", " + x); 
    doSomethingElse(vals);
    System.out.println(vals[0] + ", " + x); 
  }
```

#grid(
  columns: 2,
  gutter: 1em,
  [
    Was passiert:
    - Auf dem Stack?
    - Auf dem Heap?
    - In Zeile 9?
    - In Zeile 11?
  ],
  [
    #only(2)[
      Gilt für *Primitive Variablen* und *Referenz-Variablen*:

      What happens on the stack stays on the stack!
    ]
  ]
)

== Vergleiche von Arrays

#grid(
  columns: 2,
  gutter: 1em,
  [
    #only(1)[
```java
static void main() {
  int[] arr1 = {1, 2, 3};
  int[] arr2 = {1, 2, 3};
  if(arr1 == arr2) {
    System.out.println("arr1 = arr2");
  } else {
    System.out.println("arr1 != arr2");
  }
}
```
    ]
    #only(2)[
#codly(
  highlighted-lines: (
        (4, blue.lighten(60%)),
      )
)
```java
static void main() {
  int[] arr1 = {1, 2, 3};
  int[] arr2 = {1, 2, 3};
  if(compareArr(arr1, arr2)) {
    System.out.println("arr1 = arr2");
  } else {
    System.out.println("arr1 != arr2");
  }
}
```
    ]
  ],
  [
    #only(2)[
      ```java
static boolean compareArr(
      int[] a1, int[] a2) {
  if(a1.length != a2.length) {
    return false;
  }
  for(int i=0; i<a1.length; i++) {
    if(a1[i] != a2[i]) {
      return false;
    }
  }
  return true;
}
      ```
    ]
  ]
)

Was gibt dieser Code aus? Warum?

#only(2)[
  Und jetzt? Was ist anders?
]

== Ausgabe von Arrays

```java
static void main() {
  int[] values = {1, 7, 12, 0};
  System.out.println(values);
}
```

Was wird ausgegeben? #pause Etwas wie `[I@1affbebc`:
- Was könnte das sein?
- Wie gibt man die Werte aus? #pause

```java
static void main() {
  int[] values = {1, 7, 12, 0};
  for(int val : values) {
    System.out.print(val + " ");
  }
}
```

Was passiert hier? Warum so?

== Mehrdimensionale Arrays

Deklaration eines Arrays: #text(colorsPrimary)[Datentyp]#text(colorsSecondary)[`[]`] #sym.arrow #text(colorsSecondary)[Array] von #text(colorsPrimary)[Datentyp].
- #text(colorsPrimary)[`int`]#text(colorsSecondary)[`[]`]: #text(colorsSecondary)[Array] von #text(colorsPrimary)[int]
- #text(colorsPrimary)[`String`]#text(colorsSecondary)[`[]`]: #text(colorsSecondary)[Array] von #text(colorsPrimary)[String]#pause
- #text(colorsPrimary)[`int[]`]#text(colorsSecondary)[`[]`]#pause: #text(colorsSecondary)[Array] von #text(colorsPrimary)[`int[]`]: #text(colorsSecondary)[Array] von #text(colorsPrimary)[`Array von int`] 
  - Zweidimensionales Array (`int[][]`)
  - Jedes Element ist wieder ein Array (`int[]`)
  - Jedes Element davon ist ein `int`
  - Beliebig viele Dimensionen möglich, z.B. `int[][][]`
- Ideen für Anwendungsfälle für mehr als 2 Dimensionen?

== Mehrdimensionale Arrays: Syntax

  #codly(
    annotation-format: none,
    annotations: (
      (start: 1, end: 1, content: [#text(col_declaration)[Deklaration] mit #text(col_assignment)[Initialisierung]]),
      (start: 2, end: 2, content: [#text(col_declaration)[Deklaration]]),
      (start: 3, end: 3, content: [#text(col_declaration)[Deklaration] mit #text(col_assignment)[Initialisierung]]),
      (start: 4, end: 4, content: [#text(col_assignment)[Initialisierung] (Länge=Variablenwert)]),
      (start: 5, end: 6, content: [#text(col_assignment)[Initialisierung] von unter-Arrays]),
      (start: 7, end: 11, content: [#text(col_declaration)[Deklaration] mit #text(col_assignment)[Initialisierung]]),
      (start: 12, end: 14, content: [Wertzugriff über Index]),
    ),
  )
```java
int[][] pixels = new int[1024][1024];
int[][] groups;
int numGroups = 2;
groups = new int[numGroups][];
groups[0] = new int[3];
groups[1] = new int[5];
int[][] tictactoe = { 
              {0, 1, 0}, 
              {0, 2, 1},
              {2, 0, 0}
            };
int[] firstRow = tictactoe2[0];
int topRightPlayer = firstRow[2];
int centerPlayer = tictactoe[1][1];
```

Zusammen an der Tafel:
- Was steht in `groups` auf dem Stack?
- Was passiert in Zeilen 2-5 auf dem Heap?
- Wie sieht `tictactoe` auf Stack und Heap aus?

== Minibeispiel mehrdimensionale Arrays

#grid(
  columns: 2,
  gutter: 1em,
  [
```java
public static void main() {
  Scanner s = new Scanner(System.in);
  char[][] tictactoe = new char[3][3];
  char player = 'X';
  while(true) {
    System.out.println(
          "Player " + player + ": ");
    int row = s.nextInt();
    int col = s.nextInt();
    tictactoe[row][col] = player;
    player = player=='X'?'O':'X';
    showBoard(tictactoe);
  }
}
```
  ],
  [
    ```java
public static void showBoard(
                char[][] b) {
  for(char[] row : b) {
    for(char player : row) {
      char out = player==0?' ':player;
      System.out.print(out);
    }
    System.out.println();
  }
}
    ```
  ]
)
#v(-0.8cm)
- Gemeinsam: Durchlaufen, was passiert? Welche Zeile ist was?
- Kurzform von `if-else`: Ternary if
  - Keine Anweisung, sondern komplexer Ausdruck!
  - Format: Bedingung ? Wert, wenn `true` : wert wenn `false`
  - Bedingung ist selber Ausdruck, der `true` oder `false` sein muss

