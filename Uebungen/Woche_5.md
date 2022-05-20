# Aufgabe 1: Vergleich von Werten

Implementieren Sie eine Methode `public static int compare(int x, int y)`, die x und y vergleicht. Diese soll zurückgeben:

* -1, wenn `x<y`
* 0, wenn `x==y`
* 1, wenn `x>y`

# Aufgabe 2: Gefährliche Operationen

Implementieren Sie eine Methode `public static boolean isSafe(int a, int b, char operation)`. Diese soll `true` zurückgeben, wenn die durch `operation` definierte Operation auf den Operanden `a` und `b` durchgeführt werden kann, ohne dass es zu einem overflow kommt, sonst `false`. Dabei sind gültige Werte für operation:

* 'a': Addition
* 's': Substraktion

Falls operation nicht 'a' oder 's' ist, soll auf jeden Fall false zurückgegeben werden.

Hinweis: Ein Overflow lässt sich gut daran erkennen, dass er bei Berechnung mit höherer Genauigkeit ein anderes Ergebnis liefert (da es bei höherer Genauigkeit dank der höheren Anzahl an verfügbaren bits nicht zum Overflow kommt). Versuchen Sie also, die Operation mit Variablen vom Datentyp `long` durchzuführen - kommt dabei was anderes raus, als wenn Sie es mit int machen, ist ein Overflow im Spiel.

# Aufgabe 3: Primzahlen erkennen

Implementieren Sie eine Methode `public static boolean isPrime(int val)`, die `true` zurückgibt, wenn val eine Primzahl ist, und sonst `false`.

# Aufgabe 4: Primzahlen zählen

Implementieren Sie eine Methode `public static int countPrimes(int from, int to)`, die die Anzahl an Primzahlen zwischen `from` und `to` (inklusive `from` und `to`) zurückgibt.

Verwenden Sie dabei die Methode `isPrime` aus der vorhergehenden Aufgabe - implementieren Sie nicht nochmal von vorne die Logik zum Erkennen, ob eine Zahl eine Primzahl ist!