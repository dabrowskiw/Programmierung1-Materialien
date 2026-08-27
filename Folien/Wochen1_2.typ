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
    node((0,0), [Start], shape: ellipse),
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
    node((3,3), [Drehen], name: <d6>, corner-radius: 5pt),
    edge("-|>"),
    node((2,3), [Schritt], corner-radius: 5pt),
    edge("-|>"),
    node((1,3), [Schritt], corner-radius: 5pt),
    edge("-|>"),
    node((0,3), [Ende], shape: ellipse),
    pause,
    hlnode((<d1>, <d2>, <d3>)),
    hlnode((<d4>, <d5>, <d6>)),
  )
)

3x drehen = nach Rechts drehen #sym.arrow Auslagern in eigenen Algorithmus!

== Beispiel: Zur Tür laufen

#grid(
  columns: (1fr, 3fr),
  align(center,
    box(
      stroke: 1pt+black,
      inset: 0.2em,
      [
      Rechts drehen:
      #diagram(
        spacing: (3em, 1em),
        node-stroke: 1pt,
        edge-stroke: 1pt,
        node((0,0), [Start], radius: 1.3em),
        edge("-|>"),
        node((0,1), [Drehen], corner-radius: 5pt),
        edge("-|>"),
        node((0,2), [Drehen], corner-radius: 5pt),
        edge("-|>"),
        node((0,3), [Drehen], corner-radius: 5pt),
        edge("-|>"),
        node((0,4), [Ende], radius: 1.3em),
      )
      ]
    )
  ),
  [
    #diagram(
      spacing: (1em, 1em),
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node((0,0), [Start], shape: ellipse),
      edge("-|>"),
      node((1,0), [Drehen], name: <d1>, corner-radius: 5pt),
      edge("-|>"),
      node((2,0), [Schritt], corner-radius: 5pt),
      edge("-|>"),
      node((3,0), [Schritt], corner-radius: 5pt),
      edge("-|>"),
      node((3,1), [Drehen], name: <d2>, corner-radius: 5pt),
      edge("-|>"),
      node((2,1), [Schritt], corner-radius: 5pt),
      edge("-|>"),
      node((1,1), [Rechts drehen], name: <d3>, corner-radius: 5pt),
      edge("-|>"),
      node((0,1), [Schritt], corner-radius: 5pt),
      edge("-|>"),
      node((0,2), [Schritt], corner-radius: 5pt),
      edge("-|>"),
      node((1,2), [Schritt], corner-radius: 5pt),
      edge("-|>"),
      node((2,2), [Rechts Drehen], name: <d4>, corner-radius: 5pt),
      edge("-|>"),
      node((3,2), [Schritt], corner-radius: 5pt),
      edge("-|>"),
      node((3,3), [Drehen], name: <d5>, corner-radius: 5pt),
      edge("-|>"),
      node((2,3), [Schritt], corner-radius: 5pt),
      edge("-|>"),
      node((1,3), [Schritt], corner-radius: 5pt),
      edge("-|>"),
      node((0,3), [Ende], shape: ellipse),
      pause,
      hlnode((<d1>)),
      hlnode((<d2>)),
      hlnode((<d3>)),
      hlnode((<d4>)),
      hlnode((<d5>)),
    )
    Warum eigentlich "Drehen" und "Rechts drehen"?

    Schöner: Drehen(rechts) und Drehen(links)
  ]
)

== Beispiel: Zur Tür laufen

#let dex1 = align(center,
    box(
      stroke: 1pt+black,
      inset: 0.2em,
      [
      Drehen(r: Richtung):
        #diagram(
          spacing: (3em, 1em),
          node-stroke: 1pt,
          edge-stroke: 1pt,
          node((0.5,0), [Start\ r: Richtung], shape: ellipse, width: 7em, height: 3.2em),
          edge("-|>"),
          node((0.5,1), shape: diamond, align(center)[r = Rechts?]),
          edge((0.5,1), (0,2), "-|>", [nein], label-pos: 100%),
          edge((0.5,1), (1,2), "-|>", [ja], label-pos: 100%),
          node((0,2), [Drehen], corner-radius: 5pt),
          edge("-|>"),
          node((1,2), [Drehen], corner-radius: 5pt),
          edge("-|>"),
          node((1,3), [Drehen], corner-radius: 5pt),
          edge("-|>"),
          node((1,4), [Drehen], corner-radius: 5pt),
          edge("-|>"),
          node((0,4), [Ende], radius: 1.3em),
          edge((0,2), (0,4), "-|>"),
        )
      ]
    )
  )

#grid(
  columns: (1.3fr, 2fr),
  dex1,
  [
    Argumente:
      - In Definition/Verwendung:\ "Algorithmusname(Argument1: Datentyp1, ..., ArguentN: DatentypN)"
      - In Start: "Name: Datentyp"
    Fallunterscheidung:
    - Enthält immer "ja"/"nein"-Frage
    - Hat immer exakt 2 ausgehende Pfeile
    - Form: Raute
  ]
)

== Beispiel: Zur Tür laufen

#grid(
  columns: (1.3fr, 2fr),
  dex1,
  [
      #diagram(
        spacing: (1em, 1em),
        node-stroke: 1pt,
        edge-stroke: 1pt,
        node((0,0), [Start], shape: ellipse),
        edge("-|>"),
        node((1,0), [Drehen(links)], corner-radius: 5pt),
        edge("-|>"),
        node((2,0), [Schritt], name: <s1>, corner-radius: 5pt),
        edge("-|>"),
        node((2,1), [Schritt], name: <s2>, corner-radius: 5pt),
        edge("-|>"),
        node((1,1), [Drehen(links)], corner-radius: 5pt),
        edge("-|>"),
        node((0,1), [Schritt], name: <s3>, corner-radius: 5pt),
        edge("-|>"),
        node((0,2), [Drehen(rechts)], corner-radius: 5pt),
        edge("-|>"),
        node((1,2), [Schritt], name: <s4>, corner-radius: 5pt),
        edge("-|>"),
        node((2,2), [Schritt], name: <s5>, corner-radius: 5pt),
        edge("-|>"),
        node((2,3), [Schritt], name: <s6>, corner-radius: 5pt),
        edge("-|>"),
        node((1,3), [Drehen(rechts)], corner-radius: 5pt),
        edge("-|>"),
        node((0,3), [Schritt], name: <s7>, corner-radius: 5pt),
        edge("-|>"),
        node((0,4), [Drehen(links)], corner-radius: 5pt),
        edge("-|>"),
        node((1,4), [Schritt], name: <s8>, corner-radius: 5pt),
        edge("-|>"),
        node((2,4), [Schritt], name: <s9>, corner-radius: 5pt),
        edge("-|>"),
        node((2,5), [Ende], shape: ellipse),
        pause,
        hlnode((<s1>, <s2>)),
        hlnode((<s3>)),
        hlnode((<s4>, <s5>)),
        hlnode((<s5>, <s6>)),
        hlnode((<s7>)),
        hlnode((<s8>, <s9>)),
      )
      #place(
        bottom+right,
        dx: -6cm,
        dy: -0.1cm,
        align(left, [Viele Einzelschritte...\ Schöner wäre Schritte(n)])
      )
  ]
)

== Beispiel: Zur Tür laufen

#let dex2 = align(center,
    box(
      stroke: 1pt+black,
      inset: 0.2em,
      [
      Schritte(n: Zahl):
        #diagram(
          spacing: (1em, 2em),
          node-stroke: 1pt,
          edge-stroke: 1pt,
          node((0.5,0), [Start\ n: Zahl], shape: ellipse, width: 7em, height: 3.2em),
          edge("-|>"),
          node((0,1), [gelaufen = 0], corner-radius: 5pt),
          edge("-|>"),
          node((0,2), shape: diamond, align(center)[gelaufen = n?]),
          edge("r", "-|>", [nein], label-pos: 50%),
          edge("d", "-|>", [ja], label-pos: 50%),
          node((1,2), [Schritt], corner-radius: 5pt),
          edge("-|>"),
          node((1,1), [gelaufen += 1], corner-radius: 5pt),
          edge((1,1), (0, 2), "-|>"),
          node((0,3), [Ende], radius: 1.3em),
        )
      ]
    )
  )

#grid(
  columns: (2.1fr, 2fr),
  gutter: 1em, 
  dex2,
  [
    Typisches Konzept: Schleife
    - Etwas immer wieder tun
    - *Finit*: Irgendwann Abbruch
    
    #sym.arrow häufig "Zählvariable"
    - Name für Wert
    - Kann sich ändern
    - Trace-Tabelle für Schritt(3)
  ]
)

== Beispiel: Zur Tür laufen

#grid(
  columns: (2.1fr, 2fr),
  gutter: 1em,
  dex2,
  [
      #diagram(
        spacing: (1em, 1em),
        node-stroke: 1pt,
        edge-stroke: 1pt,
        node((0,0), [Start], shape: ellipse),
        edge("-|>"),
        node((1,0), [Drehen(links)], corner-radius: 5pt),
        edge("-|>"),
        node((1,1), [Schritte(2)], corner-radius: 5pt),
        edge("-|>"),
        node((0,1), [Drehen(links)], corner-radius: 5pt),
        edge("-|>"),
        node((0,2), [Schritte(1)], name: <s3>, corner-radius: 5pt),
        edge("-|>"),
        node((1,2), [Drehen(rechts)], corner-radius: 5pt),
        edge("-|>"),
        node((1,3), [Schritte(3)], name: <s4>, corner-radius: 5pt),
        edge("-|>"),
        node((0,3), [Drehen(rechts)], corner-radius: 5pt),
        edge("-|>"),
        node((0,4), [Schritte(1)], name: <s7>, corner-radius: 5pt),
        edge("-|>"),
        node((1,4), [Drehen(links)], corner-radius: 5pt),
        edge("-|>"),
        node((1,5), [Schritte(2)], corner-radius: 5pt),
        edge("-|>"),
        node((0,5), [Ende], shape: ellipse),
      )
      #pause
      Immer noch "Schritt"+"Drehen"! #sym.arrow "Schreibe A" vs. "Setze Pixel"
  ]
)


== Take-aways

Wichtig für Testat (in PCÜ in 2 Wochen)!

- Algorithmus: 
  - Beschreibt Schritte, um ein Problem zu lösen
  - Finit, definierte Schritte, Eingaben und Ausgabe, effektiv
- Flussdiagramm:
  - Graphische Darstellung eines Algorithmus
  - Wichtig, korrekt zu zeichnen: Start, Schritte, Fallunterscheidungen, Ende
- Entwicklung einfacher Algorithmen:
  - Fallunterscheidungen
  - Variablen
  - Schleifen

== Übungsbeispiel: Zur Tür laufen
  
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
== Übungsbeispiel: Gewichtszone
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

== Lösung: Gewichtszone

#place(top+left)[
    #diagram(
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node((0,0), shape: ellipse, width: 7em, height: 4em, [Start\ w: Zahl\ h: Zahl]),
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

  #place(bottom, dy: -0.5em)[
      Aufgabe: Erweitern um Geschlecht. Gruppen (2 oder 3), 10 Minuten
  ]

== Lösung: Code reuse
  #place(top+left, dx:-40pt)[
    #place(top+left, dx: 0.3em, dy:0.3em, [*f(w: Zahl, h: Zahl, ug: Zahl, ng: Zahl)*])
    #box(stroke: black, inset: (top: 35pt, left: 10pt, right: 10pt, bottom: 20pt),
      [
        #diagram(
          node-stroke: 1pt,
          edge-stroke: 1pt,
          node((0,1), shape: ellipse, width: 6em, height: 7em, [Start\ w: Zahl\ h: Zahl\ ug: Zahl\ ng: Zahl]),
          node((1,0.25), height: 2em, [$"BMI"=frac("w", "h*h")$]),
          node((1,1), shape: diamond, height: 2em, align(center)[BMI < ug?]),
          node((1,1.75), shape: diamond, height: 2em, align(center)[BMI <= ng?]),
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
  #place(top+right, dx:20pt)[
    #diagram(
        node-stroke: 1pt,
        edge-stroke: 1pt,
        node((0,0), shape: ellipse, width: 7em, height: 5.5em, [Start\ w: Zahl\ h: Zahl\ sex: Text]),
        node((0,0.75), shape: diamond, width: 3em, height: 2em, [sex=m?]),
        node((0, 1.5), shape: ellipse, height: 2.5em, [f(w, h, 19, 23.9)]),
        node((0, 2.25), shape: ellipse, height: 2.5em, [f(w, h, 20, 24.9)]),
        edge((0,0), (0,0.75), "-|>"),
        edge((0,0.75), (0,1.5), "-|>", [nein]),
        edge((0,0.75), (0.6, 0.75), (0.6, 2.25), (0,2.25), "-|>", [ja], label-pos: 0.1),
      )
  ]

== Beispiel: N! berechnen

$n!$ = Fakultät von n = $1*2*3*...*n$. Annahme: $n >= 1$

#diagram(
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node((0,0), shape: ellipse, height: 3em, [Start\ n: n]),
    edge("-|>"),
    node((1, 0), [$"res" = n$]),
    edge("-|>"),
    node((2, 0), shape: diamond, [$n = 1$?]),
    edge("r", "-|>", [ja]),
    edge("d", "-|>", [nein]),
    node((3,0), shape: ellipse, [res]),
    node((2, 1), [$"res" = "res" * n$]),
    edge("-|>"),
    node((1, 1), [$n = n - 1$]),
    edge((1,1), (1, 0.2), (2, 0), "-|>"),
  )

== Trace-Tabelle

Für n=4:

#table(
  columns: (1fr, 1fr, 1fr),
  table.header(
    [*Schritt*], [*n*], [*res*]
  ),
  [0], [4], [-],
  [1], [.], [4],
  [2], [.], [16],
  [3], [3], [.],
  [4], [.], [48],
  [5], [2], [.],
  [6], [.], [96],
  [7], [1], [.],
)

#sym.arrow Ergebnis: 96 #pause Aber stimmt das? #pause $4! = 24$, nicht 96

== Beispiel: N! korrigieren

$n!$ = Fakultät von n = $1*2*3*...*n$. Annahme: $n >= 1$

#diagram(
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node((0,0), shape: ellipse, height: 3em, [Start\ n: n]),
    edge("-|>"),
    node((1, 0), [$"res" = n$]),
    edge("-|>"),
    node((2, 0), shape: diamond, [$n = 1$?]),
    edge("r", "-|>", [ja]),
    edge("d", "-|>", [nein]),
    node((3,0), shape: ellipse, [res]),
    node((2, 1), name: <n1>, [$n = n - 1$]),
    edge("-|>"),
    node((1, 1), name: <n2>,[$"res" = "res" * n$]),
    edge((1,1), (1, 0.2), (2, 0), "-|>"),
    hlnode((<n1>,<n2>)),
  )

== Trace-Tabelle

Für n=4:

#table(
  columns: (1fr, 1fr, 1fr),
  table.header(
    [*Schritt*], [*n*], [*res*]
  ),
  [0], [4], [-],
  [1], [.], [4],
  [2], [3], [.],
  [3], [.], [12],
  [4], [2], [.],
  [5], [.], [24],
  [6], [1], [.],
)

#sym.arrow Ergebnis: 24
