# Datentypen

Wie in der letzten Woche beschrieben gibt es noch einige Konzepte in Java, die über das hinausgehen, was wir beim Beschreiben von Algorithmen in Snap! gelernt haben. Zwei dieser Konzepte wenden wir uns in dieser und der nächsten Woche zu: Datentypen (die das int den Schleifen und das void in der Signatur der Methode `main` erklären) sowie Arrays (die die eckigen Klammern in `String[]` erklären).

Wie in der letzten Woche beschrieben stehen im Speicher eines Computers nur Zahlen, die von der CPU interpretiert werden - manchmal als Anweisungen, manchmal als Argumente von Anweisungen, mit denen etwas getan werden soll. Aus technischen Gründen werden diese Zahlen im Binärformat abgespeichert.

## Exkurs: Binärsystem, Zweierkomplement und overflows

Technisch gesehen ist ein Computer nur in der Lage, mit Einsen und Nullen zu arbeiten - sein Speicher besteht aus Schaltern, von denen jeder nur an oder aus sein können. Der von einem solchen Schalter gespeicherte Wert (eine 1 oder eine 0) wird als ein Bit bezeichnet. Um mit diesen 2 Ziffern Zahlen, die größer als 1 sind, darstellen zu können, werden mehrere Bits zu einer längeren Zahl zusammengesetzt. Das funktioniert genau so, wie in dem Zehnersystem, in dem wir normalerweise denken: Auch uns stehen nur wenige (10 unterschiedliche) Ziffern zur Verfügung und um Zahlen, die größer als 9 sind, darzuzstellen, müssen wir mehrere Ziffern zusammensetzen. Dabei lesen wir eine solche zusammengesetzte Zahl intuitiv von als Summe von absteigenden Zehnerpotenzen, beginnend bei $10^{Anzahl der Ziffern-1}$. Konkret: Die Zahl 394 lesen wir wie folgt: `3*10^2+9*10^1+4*10^0=300+90+4=394`[^1]. Stehen nur zwei Ziffern - wie bei der Arbeit mit Bits - zur Verfügung, funktionier es genau so, nur dass man anstatt von Zehnerpotenzen (bei unseren 10 Ziffern von 0-9) mit Zweierpotenzen (bei 2 Ziffern von 0-1) arbeitet. Die Binärzahl 1101 liest man also als `1*2^3+1*2^2+0*2^1+1*2^0=8+4+0+1=13`.

Wenn man negative Zahlen darstellen will, verwendet man die erste Ziffer als Marker für das Vorzeichen und einen als Zweierkomplement bezeichneten Trick: Wenn die erste Ziffer 0 ist, liest man den Rest der Zahl normal. Wenn die erste Ziffer 1 ist, ist die Zahl negativ und man liest den Rest der Zahl ein wenig anders[^2].

Das führt allerdings zu einem Problem, welches als signed overflow bezeichnet wird und häufig zu Problemen bei Berechnungen führt. Stellen Sie sich vor, Sie haben eine 4-Stellige binäre Zahl, die sowohl positiv als auch negativ sein kann. Sie beginnen mit 0110 (`1*2^2+1*2^1+0*2^0=4+2+0=6`) und Sie addieren 1 - Sie bekommen 0111 (`1*2^2+1*2^1+2^0=4+2+1=7`). So weit so gut. Nun addieren Sie aber nochmal 1 - Sie bekommen 1000 (`1*2^3+0*2^2+0*2^1+0*2^0=8+0+0+0=8`). Wird allerdings das erste Bit als Vorzeichen interpretiert, ist das plötzlich eine negative Zahl (im Zweierkomplement `-1*(1*2^3+1*2^2+1*2^0)-1=-1*(4+2+1)-1=-8`). Also ist 7+1=-8. Da an einer binären Zahl nicht erkannt werden kann, ob sie negativ sein kann, sondern das davon abhängt, wie Sie die Zahl nachher lesen, kann dieser Fehler nicht vom Computer bei der Berechnung abgefangen werden, sondern Sie müssen darauf achten. Das ist das wichtigste Fazit aus diesem Exkurs: Achten Sie bei Berechnungen darauf, nur mit Zahlen zu arbeiten, die tatsächlich in Ihre Datentypen reinpassen!

Technisch werden jeweils acht Bit sind zu einer Zahl zusammgefasst und werden als ein Byte bezeichnet - und da `2^8=256`, kann in einem Byte auch nur eine Zahl zwischen 0 und 255 gespeichert werden - oder, falls man die Zahl mit Vorzeichen interpretiert, zwischen -128 und 127[^3].

## Datentypen in Java

Die Verwendung des Binärcodes und die Unterteilung in Bytes stellt Programmierer aber vor einige Herausforderungen, z.B.:

* Was, wenn man mit Zahlen arbeiten will, die größer als 256 sind?
* Was, wenn man Gleitkommazahlen speichern will?
* Was, wenn man Buchstaben und nicht Zahlen abspeichern will?

Natürlich gibt es für diese Probleme etablierte Lösungen. Um mit Zahlen zu arbeiten, die größer als 256 sind, werden einfach mehrere Byte zu einer Zahl zusammengefasst - jedes zusätzliche Bit erhöht die mögliche Anzahl an speicherbaren Zahlen um den Faktor 2, wenn man also beispielsweise 2 Byte zu einer Zahl zusammenfasst, kann man schon Werte bis 65535 speichern. Braucht man Gleitkommazahlen, muss man die Bytes anders interpretieren - eine genaue Behandlung dieser Interpretation würde hier den Rahmen sprengen[^4]. Will man mit Buchstaben arbeiten, braucht man eine Übersetzungstabelle zwischen den gespeicherten Zahlen und Buchstaben - der bekannteste ist der ASCII-Code, der jeder Zahl von 0-255 ein Zeichen zuordnet[^5]. Lösungen, die es ermöglichen, alle weltweit verwendeten Zeichen in einem Dokument zu codieren, existieren auch (z.B. die UTF-8-Codierung), deren Behandlung würde aber wieder den Rahmen sprengen. 

Als Java-Programmierer will man sich mit solchen Details wie der Übersetzung der Zahl 65 in ein `A` aber genausowenig auseinandersetzen müssen, wie mit einzelnen Opcodes. Entsprechend wird dies vom Compiler übernommen. Damit der Compiler dies tun kann, muss man ihm aber mitteilen, was man denn in einer Variable speichern möchte. Das tut man, indem man einen Datentyp angibt. Beispielsweise bedeutet das `int` in `int rows=0;`, dass in der Variable `rows` ein integer - das englische Wort für "ganze Zahl" - gespeichert werden soll. Entsprechend fasst der Compiler 4 hintereinander liegende Byte im Speicher zusammen und interpretiert sie gemeinsam als eine Zahl mit Vorzeichen - es kann also eine Zahl zwischen ca. -2.15 Milliarden und +2.15 Milliarden in dieser Variable gespeichert werden.

Solche Datentypen, die direkt die Interpretation des Speicherinhalts als einen Wert beschreiben, werden als primitive Datentypen bezeichnet. In Java gibt es die folgenden primitiven Datentypen:

* **byte**: Ganze Zahl mit Vorzeichen, 1 Byte -> Werte zwischen -128 und 127
* **short**: Ganze Zahl mit Vorzeichen, 2 Byte -> Werte zwischen -32768 und 32787
* **int**: Ganze Zahl mit Vorzeichen, 4 Byte -> Werte zwischen -2147483648 und 2147483647
* **long**: Ganze Zahl mit Vorzeichen, 8 Byte -> Werte zwischen -9223372036854775808 und 9223372036854775807
* **float**: Gleitkommazahl mit Vorzeichen, 4 Byte
* **double**: Gleitkommazahl mit Vorzeichen, 8 Byte
* **char**: Buchstabe, 2 Byte
* **boolean**: Wahrheitswert - kann nur `true` oder `false` sein

Bei `float` und `double` können jeweils Werte zwischen "minus unendlich" und "plus undendlich" dargestellt werden, die Anzahl an verwendeten Byte beeinflusst aber die Genauigkeit. Standardmäßig verwendet Java für Gleitkommazahlen daher "double", und bis auf wenige Ausnahmen bei denen Berechnungen hocheffizient durchgeführt werden müssen gibt es keinen Grund, jemals `float` zu verwenden.

Wie der Name `primitive Datentypen` schon impliziert, gibt es auch noch andere Datentypen. Mit diesen werden wir uns in einem späteren Kapitel im Detail auseinandersetzen.

## Operationen auf Datentypen

Auf allem, was einen primitiven Datentyp hat, lassen sich bestimmte Operationen durchführen - diese tun das Gleiche, was wir schon beim Schreiben von Algorithmen für Alfred genutzt haben, aber zum Teil mit anderer Schreibweise oder vereinfacht:

* **a + b**: Addiert a und b
* **a - b**: Zieht b von a ab
* **a * b**: Multipliziert a und b
* **a / b**: Teilt a durch b
* **a % b**: Berechnet den Rest beim Teilen von a durch b (Modulo)
* **a && b**: Logisches und: Ist true exakt dann wenn a true ist und b true ist, sonst false
* **a || b**: Logisches oder: Ist false exakt dann wenn a false ist und b false ist, sonst true
* **a > b**: Ist true, wenn a größer als b ist, sonst false
* **a >= b**: Ist true, wenn a größer oder gleich b ist, sonst false
* **a < b**: Ist true, wenn a kleiner als b ist, sonst false
* **a <= b**: Ist true, wenn a kleiner oder gleich b ist, sonst false

Wichtig dabei ist, dass keine dieser Operationen den Wert der Operanden (in diesem Fall a oder b) verändert - die Berechnung wird ausgeführt und wenn das Ergebnis verwendet werden soll, muss es einer Variable zugewiesen werden (beispielsweise `x = a / b;`). Für alle außer den letzten vier Operationen gibt es dafür eine Kurzschreibweise: Wenn man den Operator mit einem Gleichheiszeichen verbindet, dann wird das Ergebnis im ersten Operanden gespeichert. Beispielsweise könnte man anstatt von `a = a - b;` auch schreiben `a -= b;` - der Effekt ist der gleiche: b wird von a abgezogen, und das Ergebnis wird in a gespeichert. Da besonders häufig (z.B. in Schleifen, in denen man etwas mitzählt) Werte um 1 erhöht oder verringert werden, gibt es dafür noch eine weitere Abkürzung: `--` bedeutet "verringere den Wert um 1", `++` bedeutet "erhöhe den Wert um eins"''". Also würde beispielsweise die Zeile `a++;` den Wert von a um eins erhöhen.


## Konversion von Datentypen

Primitive Datentypen können in Java ineinander umgewandelt werden, indem der Zieldatentyp in Klammern vor eine Variable, die einen anderen Datentyp hat, geschrieben wird. Möchte man beispielsweise den double x in einen integer y umwandeln, schreibt man `y = (int)x`. Dieser Vorgang wird als casting bezeichnet und ist häufig notwendig, da man oft Variablen mit unterschiedlichen Datentypen miteinander verrechnen muss (beispielsweise hat man in einem Kassensystem den Preis für einen Artikel in Euro als double abgespeichert und muss diesen zur Berechnung des zu zahlenden Betrages mit der als integer gespeicherten Anzahl an gekauften Artikeln multiplizieren). In der Regel führt Java die notwendigen casts automatisch durch, und zwar immer zur höheren Genauigkeit hin (also wird z.B. bei Multiplikation eines doubles mit einem integer zunächst der integer auf einen double gecastet und dann werden die zwei resultierenden double miteinander multipliziert), um Genauigkeitsverluste zu vermeiden. Es gilt dabei allerdings einige Dinge zu beachten:

* Beim cast einer Gleitkommazahl auf eine ganze Zahl wird einfach alles nach dem Komma abgeschnitten, es wird nicht gerundet
* Beim cast eines booleans auf einen anderen Datentyp kommt immer 0 (für false) oder 1 (für true) raus
* Beim cast eines anderen Datentyps auf boolean kommt immer true raus, es sei denn, der Wert ist exakt 0, dann erhält man ein false
* Beim casten von char auf eine Zahl bekommt man den ASCII-Wert des gespeicherten Zeichens - castet man also den character "2" auf int, erhält man 50 (den ASCII-Wert des Zeichens "2"), und nicht den Wert 2
* Gleiches gilt umgekehrt beim cast von einer Zahl auf einen character - castet man z.B. die Zahl 64 auf char, bekommt man ein "@"
* Java wird nie - auch wenn es notwendig ist - von sich auch einen genaueren Datentyp auf einen weniger genauen Datentyp casten (also z.B. einen int auf ein byte)! Wenn man das tun will, muss man den cast explizit durchführen, sonst wird bei der Compilierung der Fehler "incompatible types: possible lossy conversion" ausgegeben und das Programm kann nicht ausgeführt werden.

## Datentypen von Methoden

So wie jede Variable einen Datentyp hat, hat auch jede Methode einen Datentyp. Das liegt daran, dass Methoden nicht einfach nur Dinge tun können. Um wirklich nützlich zu sein, müssen sie häufig auch Informationen wie Berechnungergebnisse zurückgeben. Stellen Sie sich vor, dass Sie das folgende Programm zum Berechnen des kleinsten von drei Werten einfacher lesbar machen wollen, indem Sie die Berechnung des kleinsten der drei Werte in eine Funktion auslagern:

```java
public class MainClass {
  public static void main(String[] args) {
    int a = 3;
    int b = 5;
    int c = -1;
    int smallest = a;
    if(b < smallest) {
      smallest = b;
    }
    if(c < smallest) {
      smallest = c;
    }
    System.out.println(smallest);
  }
}
```

Das kann nur funktionieren, wenn Sie aus dem Funktionsaufruf irgendwie den berechneten Wert zurückbekommen können. Um das zu ermöglichen, kann einer Methode genauso wie einer Variable ein Datentyp zugeordnet werden. Eine solche Methode muss über den Befehl `return` einen Wert von dem entsprechenden Datentyp zurückgeben (siehe Zeile 10), dann kann der Aufruf der Funktion wie eine Variable von diesem Typ verwendet werden (siehe Zeile 14):

```java
public class MainClass {
  public static int getSmallest(int value1, int value2, int value3) {    
    int smallest = value1;
    if(value2 < smallest) {
      smallest = value2;
    }
    if(value3 < smallest) {
      smallest = value3;
    }
    return smallest;
  }
  
  public static void main(String[] args) {
    int smallestValue = getSmallest(3, 5, -1);
    System.out.println(smallestValue);
  }
}
```

Es gibt allerdings auch Funktionen, die keinen Wert zurückgeben. Für diese gibt es einen speziellen Datentyp, der für Variablen nicht zulässig ist: `void` (Englisch für "leerer Raum"). Da die Standard-Einstiegsmethode `main` keinen Wert zurückzuliefern braucht, ist sie von diesem Typ.

[^1]: Bei kurzen Zahlen wie 394 merken wir nicht, dass wir erstmal die Ziffern zählen müssen, um zu wissen, welche Zehnerpotenz eigentlich die 3 vorne darstellt. Aber lesen Sie mal die Zahl 19275439772, dann können Sie das an sich selber beobachten.

[^2]: Das ist ein technisches Randdetail und Sie brauchen die Details nicht kennen, aber zur Information: Die Bedeutung von 0 und 1 wird vertauscht und vom Ergebnis wird nochmal 1 abgezogen. Beispielsweise liest man dann die Zahl 111 als `-1*(0*2^1+0*2^0)-1=-1`, die Zahl 100 als `-1*(1*2^1+1*2^0)-1=-4` und so weiter. Das hat zwei technische Gründe: Mathematische Operationen mit negativen Zahlen werden auf Hardware-Ebene einfacher, und man hat keine zwei unterschiedliche Repräsentationen für die 0 (sonst hätte man eine `0` und eine `-0`, was Probleme bereiten würde).

[^3]: Diese Definition, dass ein Byte aus genau 8 Bit besteht, ist weder technisch notwendig noch irgendwie besonders vorteilhaft - es hat sich historisch so ergeben und wird aus Kompatibilitätsgründen und weil der Aufwand, es zu ändern, den Nutzen bei weitem übersteigen würde, beibehalten.

[^4]: Für die, die selber weiterlesen wollen: Die Bitfolge wird in zwei Teile aufgespalten, der erste wird als Mantisse bezeichnet, der zweite als Exponent. Die gespeicherte Gleitkommazahl ist dann `Mantisse * 2^Exponent`, wobei in bei der Mantisse an einer vordefinierten Position bereits ein Komma steht. Details der Berechnung einer Mantisse und eines Exponenten, die eine konkrete Gleitkommazahl gut repräsentieren, würden den Rahmen dieses Skriptes sprengen.

[^5]: Dabei sind die Zeichen für die Werte von 0-127 der Standard-ASCII-Code, die andere Hälfte der Werte ist länderspezifisch und kann je nach verwendeter Tabelle Umlaute, französische Akzente etc. bedeuten.
