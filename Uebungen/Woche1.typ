#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond, ellipse

#set text(lang: "de")

= Aufgabe 1

In dieser Aufgabe arbeiten Sie mit dem folgenden Algorithmus:

#figure(
  diagram(
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node((0,0), shape: ellipse, width: 5.5em, [Start\ x: Zahl\ y: Zahl]),
    edge("-|>"),
    node((1, 0), [$z = x$]),
    edge("-|>"),
    node((2, 0), [$y = y-1$]),
    edge("-|>"),
    node((2, 1), shape: diamond, [$y = 0$?]),
    edge("l", "-|>", [ja], label-pos: 40%),
    edge((2, 1), (3,1), (3, 0), "-|>", [nein], label-pos: 25%),
    node((3, 0), [$z = z+x$]),
    edge("l", "-|>"),
    node((1,1), shape: ellipse, [z]),
    edge((2, 1), (1,1), "-|>"),
  ),
  caption: [Algorithmus, der eine mathematische Operation durchführt.],
)<a1>

== Aufgabe 1.1

Erstellen Sie eine Trace-Tabelle für den Algorithmus in @a1 für die Eingabewerte $x=3$ und $y=4$.

== Aufgabe 1.2

Welches Ergebnis liefert der Algorithmus in @a1 für die folgenden Eingabewerte?

- $x=4$, $y=3$
- $x=3$, $y=4$
- $x=5$, $y=8$

== Aufgabe 1.3

Um welche mathematische Operation handelt es sich hier? Also, wenn der Algorithmus in @a1

$z = x ? y$ 

berechnet, welche mathematische Operation ist dann $?$?

== Aufgabe 1.4

Was sollte das Ergebnis der mathematischen Operation, die der Algorithmus durchführt, sein, wenn die Eingabewerte $x=7$ und $y=0$ sind?

Versuchen Sie, eine Trace-Tabelle für die Eingabewerte $x=7$ und $y=0$ zu erstellen. Was können Sie beobachten?

== Aufgabe 1.5

Passen Sie den Algorithmus so an, dass für alle Fälle, wenn $y>=0$ ist, den korrekten Wert zurückliefert (anstatt wie jetzt nur in den Fällen, in denen $y>0$ ist).

Schreiben Sie Ihren Algorithmus als korrekt formatiertes Flussdiagramm auf.

== Aufgabe 1.6

Was sollte das Ergebnis der mathematischen Operation, die der Algorithmus durchführt, sein, wenn die Eingabewerte $x=4$ und $y=-3$ sind?

Versuchen Sie, eine Trace-Tabelle für die Eingabewerte $x=4$ und $y=-3$ zu erstellen. Was können Sie beobachten?

== Aufgabe 1.7

Passen Sie den Algorithmus so an, dass für alle Werte von $y$ den korrekten Wert zurückliefert (anstatt wie jetzt nur in den Fällen, in denen $y>=0$ ist).

Schreiben Sie Ihren Algorithmus als korrekt formatiertes Flussdiagramm auf.

== Aufgabe 2

== Aufgabe 2.1

Entwickeln Sie einen Algorithmus `nthPrime(n: Zahl)`, der die n-te Primzahl beginnend bei 1 zurückgibt. Sie dürfen dafür zusätzlich zu den üblichen mathematischen Operationen ($+$, $-$, $*$, $\/$) und Fragen ($=$, $!=$, $<=$, $>=$) auch die Frage `isPrime(n: Zahl)` verwenden. Wenn `n` eine Primzahl ist, gibt `isPrime(n)` "ja" zurück, sonst "nein".

Beispiele für Werte, die `nthPrime(n: Zahl)` zurückgeben soll:

- Für $n=1$: 2 (2 ist die erste Primzahl über 0)
- Für $n=3$: 5 (die ersten 3 Primzahlen sind 2, 3 und 5, 5 ist also die dritte)

Sie dürfen zunächst davon ausgehen, dass $n>=1$ ist.

Schreiben Sie Ihren Algorithmus als korrekt formatiertes Flussdiagramm auf.

== Aufgabe 2.2

Schreiben Sie eine Trace-Tabelle für Ihren Algorithmus für $n=5$.

== Aufgabe 2.3

Versuchen Sie, eine Trace-Tabelle für Ihren Algorithmus für $n=-2$ zu schreiben. Was fällt Ihnen auf? Ist das ein wünschenswertes Verhalten?

Erweitern Sie Ihren Algorithmus so, dass er für den Fall, dass $n<=0$ ist, den Wert $0$ zurückgibt.

== Aufgabe 2.4

Entwickeln Sie einen erweiterten Algorithmus `nthPrime(from: Zahl, n: Zahl)`, der die n-te Primzahl beginnend bei $"from"$ (inklusive $"from"$) zurückgibt.

Beispiele für Werte, die `nthPrime(from: Zahl, n: Zahl)` zurückgeben soll:

- Für $n=-1$, $"from"=5$: 0 (für alle Werte von $n<=0$ soll per Aufgabe 2.3 der Wert $0$ zurückgegeben werden)
- Für $n=3$, $"from"=0$: 5 (für $n=0$ tut der Algorithmus genau das selbe, wie `nthPrime(n: Zahl)` aus Aufgabe 2.1)
- Für $n=3$, $"from"=6$: 13 (die ersten 3 Primzahlen, die nach der 6 kommen, sind 7, 11 und 13, 13 ist also die dritte)
- Für $n=3$, $"from"=5$: 11 (es soll inklusive $"from"$ gerechnet werden, also sind die ersten 3 Primzahlen beginnend bei 5: 5, 7 und 11, 11 ist also die dritte)

Schreiben Sie Ihren Algorithmus als korrekt formatiertes Flussdiagramm auf.

== Aufgabe 2.5

Schreiben Sie eine Trace-Tabelle für `nthPrime(from: Zahl, n: Zahl)` für die Werte $n=5$ und $"from"=3$.
