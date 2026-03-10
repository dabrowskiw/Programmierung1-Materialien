#import "@preview/touying:0.6.1": *
#import "@preview/colorful-boxes:1.3.1": *
#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond, ellipse
#import "@preview/numbly:0.1.0": numbly
#import themes.university: *

#set text(
  hyphenate: true,
  lang: "de"
)

#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Programmierung 1 (IKG)],
    date: "WiSe 25/26",
    institution: "HTW Berlin",
    author: "Prof. Dr.-Ing. P. W. Dabrowski"
  ),
  config-colors(
    primary: rgb("#76b900"),
    secondary: rgb("#0082D1"),
    tertiary: rgb("#FF5F00"),
    neutral-lightest: rgb("#ffffff"),
    neutral-darkest: rgb("#000000"),
  )
)

#show link: underline

#title-slide()

= Organisatorisches

== Mitmachen & bestehen

- Selber programmieren wichtig -> 1 SWS VL, 3 SWS PCÜ
- Präsenzzeit reicht *nicht*!
  - Regelmäßige Hausaufgaben
  - Zusatzaufgaben zum selber üben
  - Fragen stellen (Forum, SL)! 
- Prüfungsleistung: 
  - Wie Hausaufgabe, aber größer (2 Wochen)
  - Voraussetzung: 2 Hausaufgaben-Vorstellungen
    - Ich wähle in jeder Übung zufällig Leute aus
    - Code zeigen, erklären!
    - 1x darf man sich auch aussuchen, dass man vorstellen will

== Boni

- Alternative zu Prüfungsleistung: Projekt
  - Rechtzeitig mit mir reden, um Umfang zu definieren
  - Muss alle Konzepte des Moduls beinhalten
  - Sprache, Thema sind egal
  - Vorstellung am Semesterende
- Bonuspunkte für Verbesserungsvorschläge (siehe #link("https://github.com/dabrowskiw/Programmierung1-Materialien/tree/IKGneu")[#underline("git-repo")]): 2.5% für Vorschlag, 5% für Code (mail, pull request), max. 2/Semester

= Allgemeine Hintergründe

== Fahrplan

- Was ist allgemein Programmierung?
- Visuelle Übungen mit #link("https://godotengine.org")[#underline("Godot")] und Flussdiagrammen (2 Wochen)
- "Fingerübungen" mit Java (ca. 4 Wochen)
- Anwendungsaufgaben (ca. 6-8 Wochen):
  - Arrays
  - Grundlagen der Objektorientierung
  - Eigenes Noten-zu-Tonausgabe-Programm entwickeln
- Puffer

== Was tun wir hier eigentlich?

- Grundlagen des Programmierens (in Java) beherrschen
- Einfache Algorithmen selber ausdenken und implementieren
- Grundbegiffe der (objektorientierten) Programmierung beherrschen
- Desillusionierung:
  - Programmieren lernen ist zeitaufwendig!
  - Ich kann es Ihnen nicht beibringen!
- Wichtig: Ab Anfang konsequent mitmachen, gerne Laptop in die VL mitbringen
- Ideal: Eigene Projekte haben!


== Was ist Programmierung?

- Wie mit jemandem reden, der gar nicht mitdenkt
- Anweisungen müssen extrem exakt formuliert sein
- Einfachste Herangehensweise:
  - Problem selber lösen
  - Sich selber dabei beobachten ("warum tue ich das gerade?")
  - Beobachtungen idiotensicher zum Nachkochen aufschreiben
-> Algorithmus: Finite Abfolge von ausführbaren Anweisungen


= Algorithmen

== Beispiel-Algorithmus

- Schreiben Sie ein Programm, das mich zur Tür bringt
- Erlaubte Anweisungen:
  - "Schritt": Ich mache einen Schritt
  - "Drehen": Ich drehe mich um 90 Grad nach links
- Freiwillige/r an der Tafel
- Bitte mich nicht umbringen!


== Wie schreibt man das auf?

  #place(top+left, dx: -20pt, box(width: 280pt, clip: true, image(width: 800pt, "Bilder/flow.png")))

  #place(top+right, dx: 40pt, image(width: 500pt, "Bilder/flow_xkcd.png"))

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




