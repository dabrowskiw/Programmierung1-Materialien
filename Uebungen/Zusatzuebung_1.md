# Zusatzübung

Hier finden Sie einige Fingerübungen, um die Grundlagen der Definition von Methoden und der Arbeit mit Arrays zu üben.

Implementieren Sie Ihre Lösungen bitte in der Klasse `public class Zusatz1Loesung`.

## Basen finden

Implementieren Sie eine Methode `public static int countBases(char[] sequence, char toFind)`, die die Anzahl der Vorkommnisse der Base `toFind` in der Sequenz `sequence` zurückgibt.

Beispiel:
```text
char[] sequence = {'G', 'A', 'T', 'T', 'A', 'C', 'A'};
char toFind = 'T';
int numT = countBases(sequence, toFind);
// numT sollte jetzt den Wert 2 haben
```

## Purine/Pyrimidine zählen

Die beiden Basen A und G werden als Purine bezeichnet, die beiden Basen T und C als Pyrimidine.

Implementieren Sie unter Verwendung der Methode `countBases` die beiden Methoden:
* `public static int countPurines(char[] sequence)`
* `public static int countPyrimidines(char[] sequence)`

Diese Methoden sollen jeweils die Anzahl der Purine bzw. Pyrimidine in der übergebenen Sequenz zurückgeben.

Beispiel:
```text
char[] sequence = {'G, 'A', 'T', 'T', 'A', 'C', A'};
int numPur = countPurines(sequence);
int numPyr = countPyrimidines(sequence);
// numPur sollte jetzt den Wert 4 haben
// numPyr sollte jetzt den Wert 3 haben
```

## Alle Basen zählen

Implementieren Sie eine Methode `public static int[] countBases(char[] sequence)`, die die Anzahl von jeweils A, C, G und T in einem Array (in dieser Reihenfolge - alphabetisch) zurückgeben soll. Vorsicht: Die Methode heißt genau so, wie die in der ersten Aufgabenstellung! Das ist in Ordnung, die beiden Methoden haben nämlich unterschiedliche Signaturen: Je nachdem, welche Argumente Sie übergeben (ob es nur ein `char[]` oder ein `char[]` und ein `char` sind) ist klar, welche der Methoden gemeint ist.

Beispiel:
```text
char[] sequence = {'G, 'A', 'T', 'T', 'A', 'C', A'};
int[] numBases = countBases(sequence);
// numBases sollte jetzt den Wert {3, 1, 1, 2} haben
```

## Komplementäre Sequenz berechnen

Jeweils A und T sowie G und C werden als komplementäre Basen bezeichnet - sie können "aneinander kleben", wodurch die Entstehung der DNA-Doppelhelix ermöglicht wird.

Eine Sequenz, die aus komplementären Basen zu einer anderen Sequenz besteht, wird als komplementäre Sequenz bezeichnet.

Implementieren Sie eine Methode `public static char[] complementSequence(char[] sequence)`, die die zu `sequence` komplementäre Sequenz zurückgibt.

Beispiel:
```text
char[] sequence = {'G, 'A', 'T', 'T', 'A', 'C', A'};
char[] compl = complementSequence(sequence);
// compl sollte jetzt den Wert {'C', 'T', 'A', 'A', 'T', 'G', 'T'} haben
```

## Reverse Sequenz berechnen

Aus biologischen Gründen (ganz kurz: die beiden Stränge einer DNA-Doppelhelix werden in einander entgegengesetzter Richtung abgelesen) hat die sogenannte reverse Sequenz eine besondere Bedeutung.

Implementieren Sie eine Methode `public static char[] reverseSequence(char[] sequence)`, die die reverse Sequenz (also von hinten nach vorne gelesen) zurückgibt.

Beispiel:
```text
char[] sequence = {'G, 'A', 'T', 'T', 'A', 'C', A'};
char[] rev = reverseSequence(sequence);
// rev sollte jetzt den Wert {'A', 'C', 'A', 'T', 'T', 'A', 'G'} haben
```

## Revers-komplementäre Sequenz berechnen

Implementieren Sie unter Verwendung der zwei vorher implementierten Methoden eine Methode `public static char[] reverseComplementSequence(char[] sequence)`, die die revers-komplementäre Sequenz (also von hinten nach vorne gelesen, aber mit den komplementären Basen) zurückgibt.

Beispiel:
```text
char[] sequence = {'G, 'A', 'T', 'T', 'A', 'C', A'};
char[] revcomp = reverseComplementSequence(sequence);
// revcomp sollte jetzt den Wert {'T', 'G', 'T', 'A', 'A', 'T', 'C'} haben
```


# Optionale Aufgaben

Wenn Sie sich schon mal die Objektorientierung genauer anschauen wollen, können Sie die optionalen Aufgaben bearbeiten

## Sequenz-Klasse

Implementieren Sie eine Klasse `Sequence`, die eine Sequenz abbilden soll. Sie soll die folgenden Methoden haben:

* `public Sequence(char[] seq)`: Legt die übergebene Sequenz in der Klasse als Attribut ab. Vorsicht: Kopieren Sie den Inhalt des Arrays in ein neues Array, sonst verändert sich die Sequenz der Klasse, wenn das Array irgendwo anders im Programm geändert wird (wir erinnern uns an Heap vs. Stack)
* `public int getLength()`: Git die Länge der Sequenz zurück
* `public int getNumPyrimidines()`: Gibt die Anzahl der Pyrimidine in der Sequenz zurück
* `public int getNumPurines()`: Gibt die Anzahl der Purine in der Sequenz zurück
* `public Sequence reverseComplement()`: Gibt ein neues `Sequence`-Objekt zurück, das die revers-komplementierte Version der Sequenz enthält
