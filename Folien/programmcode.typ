#import "header.typ": *

#show: htwslides

#title-slide(
  title: "Programmierung 1",
  subtitle: "Exkurs: Programmcode",
  institution-name: "HTW Berlin"
)


== Programmcode im Speicher

#grid(
  columns: (1.9fr, 4fr),
  gutter: 1em,
    [Der Computer kann aber keinen Code, nur Zahlen...?\ #sym.arrow Betriebssysteme],
  text(size: 18pt, table(
    columns: 4,
    table.header(
      [Befehl], [Wert], [Argumente], [Kommentar]
    ),
    [print], [1], [1], [Auszugebende Adresse],
    [jeq], [2], [3], [2 Adressen verlgeichen, 3: Sprungziel],
    [add], [3], [2], [1: Adresse, 2: Zu addierender Wert],
    [jmp], [4], [1], [Sprung-Adresse],
    [put], [5], [2], [1: Adresse, 2: Wert],
  ))
)

#only(1)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    [
      ```java
      int j=10;
      for(int i=0; i<j; i++) {
        System.out.print(i);
      }
      ```
    ],
    [ #codly(lang-format: (_, _, _) => [], number-format: none)
      ```asm
      90: put 69 0 # i
      93: put 68 10 # j=10
      96: jeq 69 68 107 # i==j -> 107 (Ende)
      100: print i
      102: add i 1 # i++
      105: jmp 96 # Schleife wiederholen
      107: Programmende (0)
      ```
    ]
  )

  - Programm: `90: 5 69 0 5 68 10 2 69 68 107 1 69 3 69 1 4 96 0`
]

  #grid(
    columns: (0.7fr, 1.1fr, 2fr),
    gutter: 1em,
    [ 
#only("2-4")[
      Und das?\ #text(size: 22pt)[`90: 5 60 0 5 59 2 5 58 100 2 60 58 120 1 60 5 57 0 2 57 59 99 3 60 1 3 57 1 4 108 0`]]],
    [#only("3-4")[```
    90:  5 60 0
    93:  5 59 2  
    96:  5 58 100 
    99:  2 60 58 122 
    103: 1 60
    105: 5 57 0 
    108: 2 57 59 99
    112: 3 60 1
    115: 3 57 1 
    118: 4 108
    120: 0
  ```]],
    [#only("4")[```asm
    90: put 60 0 # i=0
    93: put 59 2 # j=2
    96: put 58 100 # k=100
    99: jeq 60 58 122 # i==k->120 (Ende)
    103: print i
    105: put 57 0 # l=0
    108: jeq 57 59 99 # l==j->99 (continue)
    112: add 60 1 # i++
    115: add l 1 # l++
    118: jmp 108 # Schleife wiederholen
    120: 0 # Ende

  ```]]
  )






