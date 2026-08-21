#import "header.typ": *

#show: htwslides

#title-slide(
  title: "Programmierung 1",
  subtitle: "Wochen 1-2: Einführung",
  institution-name: "HTW Berlin"
)

= Organisatorisches

== Mitmachen & bestehen

- Selber programmieren wichtig -> 1 SWS VL, 3 SWS PCÜ
- Präsenzzeit reicht *nicht*!
  - Regelmäßige Hausaufgaben
  - Zusatzaufgaben zum selber üben
  - Fragen stellen (Forum, SL)! 
- Prüfungsleistung: 
  - Wie Hausaufgabe, aber:
    - Größer (2-3 Wochen)
    - Einfacher
  - Voraussetzung: 2 von 3 Testaten bestanden 
    - Enthält Papier-Aufgabe! Nur KI #sym.arrow Keine Zulassung!
    - Keine Ausnahmen, kein Nachholen! #sym.arrow Rechtzeitig kommen!

== Boni

- Alternative zu Prüfungsleistung: Projekt
  - Rechtzeitig mit mir reden, um Umfang zu definieren
  - Muss alle Konzepte des Moduls beinhalten
  - Thema ist egal, Sprache muss Java sein
  - Vorstellung am Semesterende
  - Gleiche Zulassungsvoraussetzung wie Prüfung!
- Bonuspunkte für Verbesserungsvorschläge (siehe #link("https://github.com/dabrowskiw/Programmierung1-Materialien/tree/IKGneu")[#underline("git-repo")]): 2.5% für Vorschlag, 5% für Code (mail, pull request), max. 2/Semester

= Allgemeine Hintergründe

== Fahrplan

- Logik-Übungen mit Flussdiagrammen (2 Wochen) #sym.arrow *Testat 1*:
  - Entwicklung eines Algorithmus aus Fragestellung
  - Grundlegende Funktionsweise einer Programmiersprache
- Java-Einführung (4 Wochen) #sym.arrow *Testat 2*:
  - Grundlegender Programmaufbau
  - Primitive Datentypen
  - Methoden, Stack, Heap
  - Tooling (IDE, Debugging, KI)
- Anwendungsaufgaben (ca. 6-8 Wochen) #sym.arrow *Testat 3*:
  - Grundlagen der Objektorientierung
  - Dateioperationen
  - Eigenes Noten-zu-Tonausgabe-Programm entwickeln

== Was tun wir hier eigentlich?

#slide(composer: (3fr,2fr))[
- Grundlagen des Programmierens (in Java) beherrschen
- Einfache Algorithmen selber ausdenken und implementieren
- Grundbegiffe der Programmierung beherrschen
- Desillusionierung:
  - Programmieren lernen braucht Zeit!
  - Ich kann es Ihnen nicht beibringen!
  - ChatGPT = Durchfallen
- Ab Anfang mitmachen!
- Ideal: Eigene Projekte haben!][
  #image("Bilder/orly-progconcept.png")
]


== Was ist Programmierung?

- Wie mit jemandem reden, der gar nicht mitdenkt
- Anweisungen müssen extrem exakt formuliert sein
- Einfachste Herangehensweise:
  - Problem selber lösen
  - Sich selber dabei beobachten ("warum tue ich das gerade?")
  - Beobachtungen idiotensicher zum Nachkochen aufschreiben
- Programmiersprache: 
  - Egal welche, es gibt viele
  - Konkrete Schreibweise: "X for Y programmers"-Bücher, KI
- Wichtigster Skill: Problem verstehen, Algorithmus entwickeln
#sym.arrow Testate enthalten *Papier-Teil ohne Computer-Hilfe*!

= Algorithmen

== Definition Algorithmus

#tip(title: "Algorithmus")[Eine Abfolge von Schritten, die nötig sind, um von vorgegebenen Eingabewerten zu einem Ausgabewert zu kommen]

5 Eigenschaften nach Donald Erwin Knuth:
- *Finit*: Endet nach einer endlichen Anzahl von Schritten.
- *Definiert*: Jeder Schritt vollkommen sind eindeutig definiert.
- *Eingabe*: Startwerte und -Bedingungen sind eindeutig definiert.
- *Ausgabe*: Ausgabe in Relation zur Eingabe vollständig definiert.
- *Effektiv*: Verwendet Algorithmen oder Basisoperationen (könnten von Mensch mit Papier und Stift erledigt werden).

== Beispiel-Algorithmus

- Schreiben Sie ein Programm, das mich zur Tür bringt
- Erlaubte Anweisungen:
  - S: Schritt, ich mache einen Schritt
  - D: Drehen, ich drehe mich um 90 Grad nach links
- Freiwillige/r an der Tafel
- Bitte mich nicht umbringen!

#pause

Ist das ein Algorithmus? Finit? Definiert? Eingabe? Ausgabe? Effektiv?

== Wie schreibt man das auf?

  #place(top+left, dx: -20pt, box(width: 280pt, clip: true, image(width: 800pt, "Bilder/flow.png")))

  #place(top+right, dx: 40pt, image(width: 500pt, "Bilder/flow_xkcd.png"))

== Beispiel: Zur Tür laufen

Programm von eben als Flussdiagramm:

#block(
  width: 100%,
  height: 65%,
  diagram(
    spacing: (3em, 1em),
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node((0,0), [Start], radius: 1.3em),
    edge("-|>"),
    node((1,0), [Drehen], corner-radius: 5pt),
    edge("-|>"),
    node((2,0), [Schritt], corner-radius: 5pt),
    edge("-|>"),
    node((3,0), [Schritt], corner-radius: 5pt),
    edge("-|>"),
    node((4,0), [Drehen], corner-radius: 5pt),
    edge("-|>"),
    node((4,1), [Schritt], corner-radius: 5pt),
    edge("-|>"),
    node((3,1), [Drehen], name: <d1>, corner-radius: 5pt),
    edge("-|>"),
    node((2,1), [Drehen], name: <d2>, corner-radius: 5pt),
    edge("-|>"),
    node((1,1), [Drehen], name: <d3>, corner-radius: 5pt),
    edge("-|>"),
    node((0,1), [Schritt], corner-radius: 5pt),
    edge("-|>"),
    node((0,2), [Schritt], corner-radius: 5pt),
    edge("-|>"),
    node((1,2), [Schritt], corner-radius: 5pt),
    edge("-|>"),
    node((2,2), [Drehen], name: <d4>, corner-radius: 5pt),
    edge("-|>"),
    node((3,2), [Drehen], name: <d5>, corner-radius: 5pt),
    edge("-|>"),
    node((4,2), [Drehen], name: <d6>, corner-radius: 5pt),
    edge("-|>"),
    node((4,3), [Schritt], corner-radius: 5pt),
    edge("-|>"),
    node((3,3), [Schritt], corner-radius: 5pt),
    edge("-|>"),
    node((2,3), [Schritt], corner-radius: 5pt),
    edge("-|>"),
    node((1,3), [Ende], radius: 1.3em),
    pause,
    node(
      enclose: (<d1>, <d2>, <d3>),
      inset: 10pt,
      snap: false,
      stroke: blue + 1pt,
      fill: blue.lighten(90%),
    ),
    node(
      enclose: (<d4>, <d5>, <d6>),
      inset: 10pt,
      snap: false,
      stroke: blue + 1pt,
      fill: blue.lighten(90%),
    ),
  )
)

3x drehen = nach Rechts drehen

== Beispiel: Zur Tür laufen
  
Annahmen: 
 - Ich schaue schon Richtung Tür.
 - Es ist nichts im Weg.

Befehle:
  - Mache einen Schritt
  - Öffne die Tür

Fragen:
  - Vor der Tür?

Sonstiges:
  - Start
  - Stop

#pause
#place(top+right, dy: 80pt)[
  #diagram(
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node((0,0), [Start], radius: 1.3em),
    edge("-|>"),
    node((0,1), shape: diamond, align(center)[Vor der Tür?]),
    edge("r", "-|>", [nein]),
    edge("d", "-|>", [ja]),
    node((1,1), [Mache einen Schritt], corner-radius: 5pt),
    edge((1,1), (1,0.5), (0,0.5), (0,1), "-|>"),
    node((0,2), [Öffne die Tür], corner-radius: 5pt),
    edge("r", "-|>"),
    node((1,2), [Ende], radius: 1.3em),
  )
]
== Beispiel: Gewichtszone
  Über- bzw. Untergewicht ist an BMI schätzbar

  $"BMI" = frac("Körpergewicht in kg", "Körpergröße in m"^2)$

  #table(columns: 3,
    [*Geschlecht*], [*BMI*], [*Zustand*],
    [Männlich], [\<20], [Untergewicht],
    [Männlich], [20-24.9], [Normalgewicht],
    [Männlich], [\>24.9], [Übergewicht],
    [Weiblich], [\<19], [Untergewicht],
    [Weiblich], [19-23.9], [Normalgewicht],
    [Weiblich], [\>23.9], [Übergewicht],
  )

== Lösung: Gewichtszone II

#place(top+left)[
    #diagram(
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node((0,0), shape: ellipse, width: 7em, height: 3em, [w=weight\ h=height]),
      node((1,0), height: 2em, [$"BMI"=frac("w", "h*h")$]),
      node((1,1), shape: diamond, height: 2em, align(center)[BMI < 20?]),
      node((1,2), shape: diamond, height: 2em, align(center)[BMI <= 24.9?]),
      node((2,1), shape: ellipse, width: 7em, height: 2em, [Untergewicht]),
      node((2,2), shape: ellipse, width: 7em, height: 2em, [Normalgewicht]),
      node((0,2), shape: ellipse, width: 7em, height: 2em, [Übergewicht]),
      edge((0,0), (1,0), "-|>"),
      edge((1,0), (1,1), "-|>"),
      edge((1,1), (2,1), "-|>", [ja]),
      edge((1,2), (2,2), "-|>", [ja]),
      edge((1,2), (0,2), "-|>", [nein]),
      edge((1,1), (1,2), "-|>", [nein]),
    )
  ]

  #pause

  #place(bottom, dy: -1em)[
      Aufgabe: Erweitern um Geschlecht. Gruppen (2 oder 3), 10 Minuten
  ]

== Beispiel: Code reuse
  #place(top+left, dx:-40pt)[
    #place(top+left, dx: 0.3em, dy:0.3em, [*f(w, h, uglimit, nglimit)*])
    #box(stroke: black, inset: (top: 35pt, left: 20pt, right: 20pt, bottom: 20pt),
      [
        #diagram(
          node-stroke: 1pt,
          edge-stroke: 1pt,
          node((0,1), shape: ellipse, width: 6em, height: 7em, [w=weight\ h=height\ uglimit\ nglimit]),
          node((1,0.25), height: 2em, [$"BMI"=frac("w", "h*h")$]),
          node((1,1), shape: diamond, height: 2em, align(center)[BMI < 20?]),
          node((1,1.75), shape: diamond, height: 2em, align(center)[BMI <= 24.9?]),
          node((2,1), shape: ellipse, width: 6em, height: 3em, [Unter-\ gewicht]),
          node((2,1.75), shape: ellipse, width: 6em, height: 3em, [Normal-\ gewicht]),
          node((0,1.75), shape: ellipse, width: 6em, height: 2em, [Übergewicht]),
          edge((0,1), (1,0.25), "-|>"),
          edge((1,0.25), (1,1), "-|>"),
          edge((1,1), (2,1), "-|>", [ja]),
          edge((1,1.75), (2,1.75), "-|>", [ja]),
          edge((1,1.75), (0,1.75), "-|>", [nein]),
          edge((1,1), (1,1.75), "-|>", [nein]),
        )
      ]
    )
  ]
  #place(top+right, dx:40pt)[
    #diagram(
        node-stroke: 1pt,
        edge-stroke: 1pt,
        node((0,0), shape: ellipse, width: 3em, height: 3em, [w, h\ sex]),
        node((0,0.75), shape: diamond, width: 3em, height: 2em, [sex=m?]),
        node((0, 1.5), [f(w, h, 19, 23.9)]),
        node((0, 2.25), [f(w, h, 20, 24.9)]),
        edge((0,0), (0,0.75), "-|>"),
        edge((0,0.75), (0,1.5), "-|>", [nein]),
        edge((0,0.75), (0.6, 0.75), (0.6, 2.25), (0,2.25), "-|>", [ja], label-pos: 0.1),
      )
  ]

== Beispiel: Steuersatz berechnen

  In zweier- oder dreier-Gruppen, 10 Minuten

  #table(
    columns: 2,
    [*Einkommen*], [*Steuersatz*],
    [0-744€], [0%],
    [745-14.753€], [14%-24%],
    [14.754€-57.918€], [24%-42%],
    [57.919€-274.612€], [42%],
    [>274.612€], [45%],
  )




