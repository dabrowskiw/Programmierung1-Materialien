# Der Schritt zu Java

Wir haben nun gelernt, Alfred auf eine sehr systematische Art zu sagen, was er tun soll - auf eine Art, die derjenigen sehr ähnelt, auf die man einem Computer unter Verwendung der Programmiersprache Java sagt, was er tun soll. Wenden wir nun also unsere Kenntnisse an, um unsere ersten Java-Programme zu schreiben. Zunächst müssen wir aber eine wichtige Formalität klären, über die wir uns mit Alfred keine Gedanken gemacht haben: Wie teilen wir dem Computer mit, dass er das, was wir als Java-Programm aufschreiben, tun soll? Bei Alfred haben wir es uns einfach gemacht, indem wir gesagt haben, dass er bestimmte Anweisungen versteht. Die Anweisungen, die ein Computer von sich aus versteht, sind aber viel zu simpel, als dass man damit einfach programmieren könnte.

## Was macht eigentlich ein Computer?

Auch, wenn wir heutzutage Computern unglaublich komplexe Aufgaben überlassen, sind sie im Kern sehr einfache Maschinen. Im Prinzip besteht der Computer aus einer Berechnungseinheit (Central Processing Unit, CPU), die Anweisungen abarbeitet und sich einen Wert merken kann (in einem als Register bezeichneten Bereich), und einem Speicher (Random Access Memory, RAM), in dem Daten stehen. Wenn ein Programm ausgeführt wird, wird dazu der CPU mitgeteilt, wo im RAM das Programm beginnt - also welche Daten sie als Anweisungen interpretieren soll. Die CPU nimmt dann die Anweisung, die unter der angegebenen Speicheradresse liegt, führt sie aus, geht dann zur nächsthöheren Speicheradresse, führt diese aus, und so weiter. Dabei versteht sie folgende Anweisungen:

1. **Lade(«Speicheradresse»)**: Merke dir im Register den Wert, der im RAM unter der Adresse «Speicheradresse» steht.
2. **Speichere(«Speicheradresse»)**: Speichere den Wert, der im Register steht, im RAM unter der Adresse «Speicheradresse».
3. **Addiere(«Wert»)**: : Addiere die Zahl «Wert» auf das, was im Register steht, und merke dir das Ergebnis wieder im Register.
4. **Subtrahiere(«Wert»)**: Ziehe die Zahl «Wert» von dem ab, was im Register steht, und merke dir das Ergebnis wieder im Register.
5. **Springe(«Speicheradresse»)**: Springe zur Adresse «Speicheradresse» (und führe entsprechend als nächstes die Anweisung aus, die dort steht).
6. **SpringeNull(«Speicheradresse»)**: Wenn der aktuell im Register gespeicherte Wert exakt gleich 0 ist, dann springe zur Adresse «Speicheradresse» (und führe entsprechend als nächstes die Anweisung aus, die dort steht).

Aktuelle CPUs haben mehrere Register und unterstützten deutlich mehr Anweisungen (eine Intel Core i7-CPU versteht beispielsweise [knapp 350 unterschiedliche Anweisungen](https://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-software-developer-instruction-set-reference-manual-325383.pdf)), diese sind aber im Endeffekt nur bequemere zusammengesetzte Varianten der hier angegebenen Anweisungen: Computer arbeiten grundlegend auf der Ebene von Zahlen, die miteinander verrechnet werden, und basierend auf dem Ergebnis wird das Programm vor- oder zurückgespult.

Wie kann mit solchen simplen Anweisungen überhaupt ein sinnvolles Computerprogramm entstehen[^1]? Nehmen wir ein sehr einfaches Beispiel: Ein Programm, das die Taste, die gerade auf der Tastatur gedrückt wird, auf dem Bildschirm anzeigt. Und der Einfachkeit halber hat unser Computer nur eine sehr kleine Tastatur - mit nur zwei Buchstaben, I und L - und einen sehr kleinen Bildschirm - mit nur 3x3 Pixeln.

Die Tastatur ist dabei so angeschlossen, dass sie den Inhalt des Speichers an der Adresse 0 kontrolliert: Wird die Taste I gedrückt, steht an der Speicheradresse 0 der Wert 1, und wird die Taste L gedrückt, steht dort der Wert ``2''[^2].

Der Bildschirm ist auch direkt an den Speicher angeschlossen: Die Speicheradressen 1-3 kontrollieren die Pixel der ersten Reihe, die Speicheradressen 4-6 die mittlere Pixelreihe, und die Speicheradressen 7-9 die letzte. Steht an einer dieser Speicheradressen eine 1, wird das entsprechende Pixel schwarz dargestellt, und sonst weiß[^3]. Wir nehmen an, dass zunächst dieser Speicherbereich immer mit 1 gefüllt ist (der Bildschirm ist schwarz). 

Ab der Speicheradresse 10 beginnt das Programm. Allerdings stehen im Speicher nur Zahlen, keine Texte. Entsprechend sind den einzelnen Anweisungen Werte zugeordnet, die sogenannten Opcodes (Operation Codes). Eine vollständige Anweisung besteht aus zwei Zahlen: Dem Opcode gefolgt von dem Argument. Der Einfachkeit halber entsprechen bei uns die Opcodes den Nummern der Anweisungen in der Aufzählung oben. Die zwei Werte ``1 0'' würden also heißen: Opcode 1 mit dem Argument 0, also ``Lade(0)'', also ``Merke dir im Register den Wert, der in der Speicheradresse 0 steht'' (wir erinnern uns: Die Speicheradresse, an die die Tastatur schreibt).


Einen Algorithmus, der die gedrückte Taste aus der Speicheradresse 0 ausliest und dann, je nachdem ob es ein I (Wert 1 unter der Speicheradresse 0 eingetragen) oder ein L (Wert 2 unter der Speicheradresse 0 eingetragen) ist, entweder die Werte unter den Speicheradressen 2, 5, und 8 auf 0 setzt (damit werden die drei Pixel in der mittleren Reihe weiß - es wird also ein I auf dem Bildschirm angezeigt), oder zusätzlich den Wert unter der Speicheradresse 9 auf 0 setzt (damit wird auch das rechte untere Pixel weiß, es wird also ein L auf dem Bildschirm angezeigt), sehen Sie hier:

```
In einer Endlosschleife wiederholen {
  Wenn 1 an Speicheradresse 0 steht {
    Schreibe Werte, die "I" darstellen, in die Speicheradressen 1-9
  }
  Wenn 2 an Speicheradresse 0 steht {
    Schreibe Werte, die "L" darstellen, in die Speicheradressen 1-9
  }
}
```

Im Computer wäre das mit eingangs beschriebenen Anweisungen umgesetzt: 

![Assembly](Bilder/assembly.png)

Auf der linken Seite steht die Abfolge der Anweisungen, daneben die Übersetzung in Opcodes (Zuordnung Anweisung -> Opcode siehe Nummerierung der Anweisungen in der Liste am Anfang der Seite), und daneben der resultierende Speicherhinhalt. Unter den Speicheradressen 0-9 sind als Beispiel die Werte eingetragen, nachdem die Taste L gedrückt wurde (die Tastatur also den Wert 2 an die Speicheradresse 0 geschrieben hat) und das Programm durchgelaufen ist (die Speicheradressen 1-9, die die Pixel auf dem Bildschirm kontrollieren, also so gesetzt hat, dass ein weißes ``L``auf schwarzem Hintergrund gezeichnet wurde). Versuchen Sie, im Kopf die Anweisungenfür den dargestellten Fall, dass ein L gedrückt wurde, durchzuspielen, um nachzuvollziehen, dass dann die richtigen Speicherwerte gesetzt werden, um auch ein L anzuzeigen. Beachten Sie dabei, dass ``Speichere«Speicheradresse»`` den Wert aus dem Register unter der angegebenen Speicheradresse speichert, und zu dem Zeitpunkt, zu dem die Speichern-Anweisungen ausgeführt werden, im Register auf jeden Fall 0 steht (das Programm kommt durch ein ``SpringeNull`` zu den ``Speichere``-Anweisungen, und ``SpringeNull`` springt zu einer Speicheradresse, wenn im Register 0 steht). Versuchen Sie dann auch, nachzuvollziehen, wie diese Anweisungen in Opcode-Argument-Zahlenpaare übersetzt werden und dass der Computer dann auf Basis der Werte, die in den Speicheradressen 10-29 stehen, tatsächlich das Programm ausführen kann.

[^1]: Keine Sorge, Sie müssen nicht in der Lage sein, das selber zu machen. Aber es zu verstehen ist Voraussetzung, um später zu verstehen, warum bestimmte Dinge in Java auf eine bestimmte Art gelöst sind.

[^2]: Das war in frühen Computern tatsächlich so gelöst. Heutzutage sind ein paar Abstraktionsebenen dazwischen, um z.B. Sicherheitsprobleme zu umgehen, aber im Endeffekt funktioniert es immer noch genauso.

[^3]: Auch hier gilt: Früher funktionierte das exakt so, heutzutage sind ein paar Abstraktiosebenen dazwischen, am Grundkonzept hat sich aber nichts geändert.