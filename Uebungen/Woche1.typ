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

== Aufgabe 1.6

Was sollte das Ergebnis der mathematischen Operation, die der Algorithmus durchführt, sein, wenn die Eingabewerte $x=4$ und $y=-3$ sind?

Versuchen Sie, eine Trace-Tabelle für die Eingabewerte $x=4$ und $y=-3$ zu erstellen. Was können Sie beobachten?

== Aufgabe 1.7

Passen Sie den Algorithmus so an, dass für alle Werte von $y$ den korrekten Wert zurückliefert (anstatt wie jetzt nur in den Fällen, in denen $y>=0$ ist).

