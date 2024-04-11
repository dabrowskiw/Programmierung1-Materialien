#import "@preview/fletcher:0.4.3" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond, circle

#set par(justify: true)

= Aufgabe 1

== Aufgabe 1.1

Was tut der hier dargestellte Algorithmus? Probieren Sie ihn mit den Zahlen x=2 und y=3 aus und schreiben Sie eine trace-Tabelle (also eine Tabelle, in der für jeden Schritt die Werte der einzelnen Variablen aufgeschrieben werden). 

#diagram(
  node-stroke: 1pt,
  edge-stroke: 1pt,
  node((0,0), align(center)[Zahlen:\ x, y], shape: circle, extrude: (0, 2)),
  edge("-|>"),
  node((1,0), align(center)[z = x], corner-radius: 2pt),
  edge("-|>"),
  node((2,0), align(center)[y = y-1], corner-radius: 2pt),
  edge("-|>"),
  node((2,1), align(center)[y == 0], shape: diamond),
  node((3,0), align(center)[z = z+x], corner-radius: 2pt),
  edge((3,0), "l", "-|>"),
  edge((2,1), "r,u", "-|>", [Nein], label-pos: 0.1),
  edge((2,1), (1,1), "-|>", [Ja], label-pos: 0.1),
  node((1,1), align(center)[z ausgeben], corner-radius: 2pt),
  edge("-|>"),
  node((0,1), align(center)[Fertig], shape: circle),
)

== Aufgabe 1.2

Was passiert, wenn y=0 ist? Was müsste passieren? Erweitern Sie den Algorithmus so, dass bei y=0 auch das korrekte Ergebnis rauskommt. 

== Aufgabe 1.3

Was passiert, wenn $y<0$ ist? Was müsste passieren? Erweitern Sie den Algorithmus so, dass auch bei Werten von $y<0$ das korrekte Ergebnis rauskommt.

= Aufgabe 2

Schreiben Sie einen Algorithmus, der als Eingabe eine Zahl X sowie deren Länge L (bspw. $X=739$, $L=3$) als Eigabe bekommt und die Summe aller Ziffern in der Zahl X berechnet. Sie dürfen die folgenden Operationen benutzen:

- Die mathematischen Grundoperationen $+$, $-$, $*$ und $\/$ (bspw. $z = a-b$)
- Die Auswahl einer Ziffer aus einer Zahl (bspw. $z = 3. "Ziffer aus" X$)
- Die Erstellung neuer Variablen (bspw. $z = 3$)
- Die Vergleiche:
  - $==$ (sind 2 Zahlen einander gleich, bspw. $z == x$)
  - $>$ und $<$ (ist eine Zahl größer oder kleiner als die andere, bspw. $z < x$)
  - $>=$ und $<=$ (ist eine Zahl größer oder gleich bzw. kleiner oder gleich der anderen, bspw. $z >= x$)

Spielen Sie den Algorithmus, um seine Korrektheit zu testen, mit den Eingabewerten $X=993$, $L=3$ durch und schreiben Sie dafür eine trace-Tabelle auf.

== Aufgabe 2.1

Erweitern Sie den Algorithmus so, dass er nur die Zahl X als Eingabe bekommt und im ersten Schritt L selber berechnet. Tipp: Überlegen Sie, was die Länge der Zahl im 10er-System bedeutet - wie würden Sie beispielsweise am einfachsten eine beliebige Zahl um eine Ziffer länger machen?

Spielen Sie den neuen Teil des Algorithmus, um seine Korrektheit zu testen, mit dem Eingabewert $X=5690$ durch und schreiben Sie dafür eine trace-Tabelle auf.

= Aufgabe 3

Entwickeln Sie einen Algorithmus, der eine Zahl X als Eingabe bekommt und bestimmt, ob diese Zahl durch 3 teilbar ist. Bedenken Sie, dass eine Zahl genau dann durch 3 teilbar ist, wenn ihre Quersumme durch 3 teilbar ist.

Sie dürfen die gleichen Operationen wie in Aufgabe 2 verwenden. Zusätzlich dürfen Sie die folgenden Operationen verwenden:
- Ihren in Aufgabe 2.1 entwickelten Algorithmus als Operation "Berechne Ziffernsumme" verwenden (bspw. "Berechne Ziffernsumme von $z$")
- Die logischen Verknüpfungen "und" sowie "oder" in Entscheidungen (bspw. "x < 2 oder y == 0")

Spielen Sie den Algorithmus, um seine Korrektheit zu testen, mit den Eingabewerten $X=86$ sowie $X=9487$ durch und schreiben Sie dafür jeweils eine trace-Tabelle auf. Sie dürfen an dieser Stelle davon ausgehen, dass Ihre Operation "Berechne Ziffernsumme" korrekt funktioniert und behandeln Sie ihn wie eine Grundoperation (also: Sie brauchen keine Einträge in der trace-Tabelle für die einzelnen Schritte in "Berechne Ziffernsumme" erstellen).
