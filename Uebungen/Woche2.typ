#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond, ellipse

#set text(lang: "de")

In dieser Woche üben wir nochmal das Erstellen von Algorithmen, deren sauberes Aufschreiben als Flussdiagramme und die Erstellung von Trace-Tabellen.

Bedenken Sie, dass für das Testat in der nächsten Woche insbesondere die korrekte Schreibweise der Algorithmen als Flussdiagramme wichtig ist! Für Flussdiagramme, die von der Idee her korrekt sind, die aber Schreibfehler enthalten (beispielsweise eine Frage in einem Rechteck oder Kreis anstatt einer Raute; Zwei von einer Operation ausgehende Pfeile; Unbeschriftete Pfeile, die von einer Frage ausgehen) gibt es keine volle Punktzahl, bei zu vielen Formfehlern bis hin zu 0 Punkten!

= Aufgabe 1

== Aufgabe 1.1

Entwickeln Sie einen Algorithmus `fibo(n: Zahl)`, der das n-te Element der Fibonacci-Folge berechnet. Verwenden Sie keine rekursive Lösung (der Algorithmus darf sich nicht selber verwenden, Sie dürfen also nicht in einem Schritt im Algorithmus selber wieder als Anweisung `fibo(n)` schreiben). Gehen Sie von $n>=0$ aus.

Die Fibonacci-Folge ist wie folgt definiert:

- Die ersten beiden Elemente ($n=0$ und $n=1$) sind 0 und 1
- Jedes nächste Element ist die Summe der zwei vorherigen Elemente

Die ersten Elemente der Fibonacci-Folge und somit die erwarteten Ergebnisse des Algorithmus sind also:

- $n=0$: 0 (per Definition)
- $n=1$: 1 (per Definition)
- $n=2$: 1 (die Summe der vorhergehenden 2 Elemente ist $0+1=1$)
- $n=3$: 2 (die Summe der vorhergehenden 2 Elemente ist $1+1=2$)
- $n=4$: 3 (die Summe der vorhergehenden 2 Elemente ist $1+2=3$)
- $n=5$: 5 (die Summe der vorhergehenden 2 Elemente ist $2+3=5$)

Ihnen wird in diesem Fall vermutlich eine Hilfsvariable nicht reichen, Sie werden mehrere eigene Hilfsvariablen erstellen müssen.

Schreiben Sie Ihren Algorithmus als korrekt formatiertes Flussdiagramm auf.

== Aufgabe 1.2

Schreiben Sie Trace-Tabelle für `fibo(n: Zahl)` für die Werte

- $n=1$
- $n=3$

== Aufgabe 1.3

Versuchen Sie, eine Trace-Tabelle für `fibo(n:Zahl)` für den Wert $n=-3$ zu erstellen. Was passiert?

Erweitern Sie Ihren Algorithmus so, dass er für Werte von $n<0$ den Wert $0$ zurückgibt.

Schreiben Sie Ihren Algorithmus als korrekt formatiertes Flussdiagramm auf.

== Aufgabe 2

== Aufgabe 2.1

Schreiben Sie einen Algorithmus `quersumme(x: Zahl, l: Zahl)`, der die Summe aller Ziffern in der Zahl $x$ berechnet. Das Argument $l$ ist die Anzahl der Ziffern in der Zahl (bspw. $x=739$, $l=3$). Sie dürfen davon ausgehen, dass $l$ immer die korrekte Anzahl an Ziffern in der Zahl $x$ ist. 

Sie dürfen im Algorithmus die folgenden Operationen benutzen:
- Die mathematischen Grundoperationen $+$, $−$, $*$ und $\/$ (bspw. $𝑧 = 𝑎 − 𝑏$)
- `nteZiffer(z: Zahl, n: Zahl)`: Die $n$-te Ziffer aus der Zahl $z$, beginnend mit der 0-ten Ziffer ganz rechts in der Zahl. Beispiele:
  - `nteZiffer(2789, 0)` ist 9
  - `nteZiffer(2789, 2)` ist 7
  - `nteZiffer(x, y)`, wenn `x` den Wert 786 hat und `y` den Wert 2 hat, ist 7
- Die Erstellung neuer Variablen (bspw. $𝑧 = 3$)
- Die Vergleiche:
  - $=$ (sind 2 Zahlen einander gleich, bspw. $𝑧 = 𝑥$)
  - $>$ und $<$ (ist eine Zahl größer oder kleiner als die andere, bspw. $𝑧 < 𝑥$)
  - $<=$ und $>=$ (ist eine Zahl größer oder gleich bzw. kleiner oder gleich der anderen, bspw. $𝑧 >= 𝑥$)

Schreiben Sie Ihren Algorithmus als korrekt formatiertes Flussdiagramm auf.

== Aufgabe 2.2

Schreiben Sie eine Trace-Tabelle für `quersumme(x: Zahl, l: Zahl)` für die Werte $x=993$ und $l=3$

== Aufgabe 2.3

Schreiben Sie einen Algorithmus `laenge(z: Zahl)` der die Anzahl an Ziffern in einer Zahl `z` zurückgibt (beispielsweise würde `laenge(192)` den Wert $3$ zurückgeben). Überlegen Sie dabei, was die Anzahl an Ziffern in einer Zahl im Zehner-System bedeutet: Sie sagt Ihnen, wie viele Zehnerpotenzen eine Zahl enthält bzw. wie häufig man sie durch 10 teilen könnte, bevor sie kleiner als 1 wird (bspw. hat 1984 4 Ziffern, da diese Zahl zwischen $10^3$ und $10^4$ liegt; wenn man 1984 3 Mal durch 10 teilt bekommt man 1.984, was größer als 1 ist; wenn mn 1984 4 Mal durch 10 teilt, bekommt man 0.1984, was kleiner als 10 ist).

Sie dürfen alle Operationen benutzen, die Sie in Aufgabe 2.1 benutzen durften.

Schreiben Sie Ihren Algorithmus als korrekt formatiertes Flussdiagramm auf.

== Aufgabe 2.4

Schreiben Sie eine Trace-Tabelle für `laenge(z: Zahl)` für $z=18943$.

== Aufgabe 2.5

Für welche Werte von $z$ gibt `laenge(z: Zahl)` falsche oder nicht definierte Werte zurück? Überlegen Sie, was sinnvolle Rückgabewerte für diese Sonderfälle wären und passen Sie Ihren Algorithmus, falls nötig, entsprechend an.

== Aufgabe 2.6

Schreiben Sie einen Algorithmus `quersumme(x: Zahl)`, der die Quersumme aller Ziffern in der Zahl `x` berechnet. Sie dürfen alle Operationen verwenden, die Sie in Aufgabe 2.1 verwenden durften, sowie zusätzlich die zwei Algorithmen, die Sie in Aufgabe 2 bereits entwickelt haben: `quersumme(x: Zahl, l: Zahl)` sowie `laenge(z: Zahl)`. Hinweis: Wenn Sie denken, die Lösung muss wohl falsch sein, weil sie zu einfach aussieht, haben Sie vermutlich die richtige Lösung - das ist die Macht der Wiederverwendung von Algorithmen, die Sie schon mal geschrieben haben.

Schreiben Sie Ihren Algorithmus als korrekt formatiertes Flussdiagramm auf.

== Aufgabe 3

== Uafgabe 3.1

Entwickeln Sie einen Algorithmus `teilberDurch3(z: Zahl)`, der `ja` zurückgibt, falls die Zahl $z$ durch 3 teilbar ist, und sonst `nein`. Hinweise: 
- Eine Zahl ist genau dann durch 3 teilbar, wenn ihre Quersumme durch 3 teilbar ist.
- Diese Regel lässt sich beliebig verketten. Die Quersumme $q_1$ einer Zahl $z$ ist durch 3 teilbar, wenn auch die Quersumme $q_2$ von $q_1$ durch 3 teilbar ist und so weiter.
- Die Quersumme einer Zahl mit einer Ziffer ist die Zahl selber, und ist durch 3 teilbar, wenn die Zahl $3$, $6$ oder $9$ ist.

Sie dürfen die gleichen Operationen wie in Aufgabe 2.1 verwenden. Zusätzlich
dürfen Sie alle Algorithmen verwenden, die Sie in Aufgabe 2 entwickelt haben.

Schreiben Sie Ihren Algorithmus als korrekt formatiertes Flussdiagramm auf.

== Aufgabe 3.2

Schreiben Sie Trace-Tabellen für `teilbarDurch3(z: Zahl)` für die Eingabewerte $z=86$ sowie $z=9487$. Sie brauchen in der Trace-Tabelle die Schritte, die innerhalb der Algorithmen, die Sie als einzelne Operation verwenden, nicht aufführen (wenn Sie also beispielsweise einen Wert `z=12` haben und `y=quersumme(z)` als Operation haben, reicht für diese Operation eine Zeile in der Trace-Tabelle, in der $y$ auf den Wert $3$ gesetzt wird).

