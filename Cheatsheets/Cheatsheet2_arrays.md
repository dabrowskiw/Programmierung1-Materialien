# Arrays

## Deklarieren von Arrays

Arrays von einem Datentyp werden mit `[]` hinter dem Datentyp deklariert, die Werte werden in geschweiften Klammern angegeben. Beispiel: Array vom Datentyp `int` mit den 3 Werten 3, 7 und -8:

```java
int[] x = {3, 7, -8};
```

Anstatt das Array mit Werten vorzubefüllen, kann nur die Länge angegeben werden (die Werte sind dann alle `0` oder `null`, je nach Datentyp). Beispiel: Array der Länge 1000 vom Datentyp `float`:

```java
float[] x = new float[1000];
```

## Zugriff auf Werte

Auf Werte wird zugegriffen, indem die Position des Wertes (Index) in eckigen Klammern angegeben wird. Vorsicht: Die Zählung beginnt bei `0`!

```java
int[] x = {3, 7, -8};
System.out.println(x[0]); // Gibt 3 aus.
```

Entsprechend können auch Werte gesetzt werden:

```java
int[] x = {3, 7, -8};
System.out.println(x[1]); // Gibt 7 aus.
x[1] = 20;
System.out.println(x[1]); // Gibt 20 aus.
```

## Länge des Arrays

Die Länge eines Arrays steht im Attribut `.length` des Arrays. Beispiel:

```java
char[] word = {'J', 'a', 'v', 'a'};
System.out.println("Länge des Wortes: " + word.length); // 4
```

## Iterieren über Arrays

Natürlich lässt sich einfach durch Mitzählen des Index über ein Array iterieren:

```java
char[] word = {'J', 'a', 'v', 'a'};
// In einer Schleife alle Werte des Arrays ausgeben:
for(int pos = 0; pos < word.length; pos++) {
    System.out.print(word[pos]); 
}
```

Wenn man den Index nicht braucht, kann mit einer anderen Form der for-Schleife über alle Elemente iteriert werden:

```java
char[] word = {'J', 'a', 'v', 'a'};
// In einer Schleife alle Werte des Arrays ausgeben:
for(char c : word) {
    System.out.print(c); 
}
```

## Mehrdimensionale Arrays

Es können auch Arrays von Arrays erstellt werden, indem die eckigen Klammern wiederholt werden (`int[][]` bedeutet so viel wie: Array vom Datentyp `int[]`):

```java
int[][] twodim = new int[2][5];
System.out.println(twodim.length); // 2 - twodim ist ein int[2]
System.out.println(twodim[0].length); // 5 - twodim[0] ist ein int[5]
```