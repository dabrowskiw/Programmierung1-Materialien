# Variablen

## Deklarieren

Bei der Deklaration Datentyp und Variablenname angeben:

```java
int x; // Ganze Zahl
char letter; // Zeichen
double eineZahl; // Gleitkommazahl
```

## Wert verändern

Variablen können werde zugewiesen werden:

```java
int x;
x = 15;
int y;
y = x;
```

Zuweisungen können auch direkt bei Deklaration vorgenommen werden:

```java
int x = 15;
```

Bei `char` wird mit einfachen Anführungszeichen gezeigt, dass man nicht einen Variablennamen sondern das Zeichen meint:

```java
char zeichen = 'x'; // Zeichen x, nicht Wert der Variable mit dem Namen x
```

## Casting

Datentypen können ineinander umgewandelt werden:

```java
int x = 72;
char zeichen = (char)x; // Zeichen 'H' (H hat den ASCII-Code 72)
```

## Mathematische Operationen

Java versteht die typischen mathematischen Operationen:

* `+`: Addieren
* `-`: subtrahieren
* `*`: Multiplizieren
* `/`: Teilen
* `%`: Modulo

Beispiel:

```java
double x = 12.5;
double y = x / 8;
char c = 'H'; // in c ist die Zahl 72 gespeichert, wird entsprechend ASCII als 'H' interpretiert
c = c-1; // 72-1=71, also wird das als 'G' interpretiert
```

Kurzformen ziehen die Zuweisung direkt mit einem `=` zusammen:

```java
// Diese beiden Zeilen tun das gleiche:
x = x + 1;
x += 1;
```

Für `+=1` und `-=1` existieren noch die Abkürzungen `++` und `--`:

```java
// Diese drei Zeilen tun das gleiche:
x = x + 1;
x += 1;
x++;
```

Vergleiche von Werten:

* `x == y`: Ist x gleich y?
* `x <= y`: Ist x kleiner oder gleich y?
* `x >= y`: Ist x größer oder gleich y?
* `x < y`: Ist x kleiner y?
* `x > y`: Ist x größer y?
* `x != y`: Ist x ungleich y?

## Ausgaben

Werte von Variablen können mittels `System.out.println()` (mit Zeilenumbruch am Ende) oder `System.out.print()` (ohne Zeilenumbruch am Ende) ausgegeben werden:

```java
int x = 72;
char c = (char)x;
System.out.print("Wert von x: " + x + ", Wert als char: " + c);
c = c-2;
System.out.println(", und 2 Zeichen dadrunter: " + c);
```

Sonderzeichen werden mit `\` markiert, beispielsweise `\n` = "Zeilenumbruch", `\\` = "\":

```java
System.out.print("Zeilenumbrüche werden mit \\n ausgegeben: ---\n---");
```

# Kontrollstrukturen

## Bedingungen

Operationen können mit `if` konditional ausgeführt werden:

```java
int x = 12;
if(x < 13) {
    System.out.println("Der Wert " + x + " ist kleiner als 13.")
}
```

Es können mit `else if` mehrere Bedingungen verkettet werden - jede nächste Bedingung wird nur abgefragt, falls keine der Bedingungen davor zutraf:

```java
int x = 12;
if(x < 13) {
    System.out.println("Der Wert " + x + " ist kleiner als 13.");
}
else if(x == 13) {
    System.out.println("x ist genau 13!");
}
else if(x > 13) {
    System.out.println("Der Wert " + x + " ist größer als 13.");
}
```

Am Ende eines solchen Blocks kann noch ein `else` eingefügt werden: Das passiert, falls keine der Bedingungen davor erfüllt war:

```java
int x = 12;
if(x < 13) {
    System.out.println("Der Wert " + x + " ist kleiner als 13.");
}
else if(x == 13) {
    System.out.println("x ist genau 13!");
}
else if(x > 13) {
    System.out.println("Der Wert " + x + " ist größer als 13.");
}
else {
    System.out.println("Hilfe, das kann eigentlich nicht passieren! X ist weder kleiner, noch gleich, noch größer 13!");
}
```

Bedingungen können kombiniert werden: `||` bedeutet "oder", `&&` bedeutet "und":

```java
int x = 12;
if(x < 13) {
    System.out.println("Der Wert " + x + " ist kleiner als 13.");
}
else if(x == 13 || x == 15) {
    System.out.println("x ist entweder 13 oder 15.");
}
```

## Schleifen

Mit Schleifen können Befehle wiederholt werden, solange eine Bedingung erfüllt ist:

```java
// Alle Zeichen von A bis Z ausgeben:
char c = 'A';
while(c <= 'Z') {
    System.out.println(c);
    c = c+1;
}
```

In der `for`-Schleife kann eine Variable direkt in der Schleife initialisiert werden, und es wird die Operation mit angegeben, die am Ende jedes Durchlaufs passieren soll:

```java
// Alle Zeichen von A bis Z ausgeben:
for(char c='A'; c <= 'Z'; c++) {
    System.out.println(c);
}
```

Schleifenausführungen können mittels `break` unterbrochen werden:

```java
// Alle Zeichen von A bis D ausgeben:
for(char c='A'; c <= 'Z'; c++) {
    System.out.println(c);
    if(c == 68) {
        break; // Unterbricht die Schleife, macht direkt nach dem Schleifenende weiter (also mit "System.out.println("Fertig.")")
    }
}
System.out.println("Fertig.");
```

Mit `continue` kann sofort mit dem nächsten Schleifendurchlauf begonnen werden, es wird der restliche Code in der Schleife für diesen Durchlauf übersprungen:

```java
// Alle Zeichen von A bis Z ausgeben, außer D:
for(char c='A'; c <= 'Z'; c++) {
    if(c == 68) {
        continue; // Restlichen Schleifeninhalt überspringen, direkt mit dem nächsten Durchlauf weitermachen.
    }
    System.out.println(c);
}
System.out.println("Fertig.");
```

# Programmstruktur

## Definieren von Funktionen

Funktionen werden definiert, indem ein Zugriffsmodifikator (zunächst einfach immer `public`), ein Datentyp, ein Name und optional die Argumente mit Datentypen und Namen angegeben werden. Das wird als Signatur der Funktion bezeichnet. Ein Wert wird mittels `return` zurückgegeben:

```java
public int add(int x, int y) { // Das ist die Signatur
    int result = x + y;
    return result;
}
```

Wenn eine Funktion nichts zurückgibt, ist ihr Datentyp `void`:

```java
public void gibWertAus(int wert) {
    System.out.println("Der Wert ist: " + wert);
}
```

Wenn eine Funktion einen Wert zurückgibt, kann sie im Programm wie eine Variable verwendet werden (ihr Rückgabewert kann anderen Variablen zugewiesen werden):

```java
public int add(int x, int y) {
    int result = x + y;
    return result;
}

//...

int ergebnis = add(5, 7);
```

## main

Die Einstiegsfunktion des Programms muss in Java immer diese Signatur haben:

```java
public static void main(String[] args) {
    System.out.println("Das Programm wurde gestartet!");
}
```