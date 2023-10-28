## Aufgabe 1

Ergänzen Sie die Lösung der Aufgabe 2 aus letzter Woche um das Zählen von Schritten: Fügen Sie eine Ausgabe hinzu, so dass der Pfeil am Ende (wenn er auf dem gelben Feld steht) für 2 Sekunden sagt: "Took X steps to find the exit", wobei `x` die Anzahl an gemachten Schritten sein soll. Sie finden die Aufgabe mit den dafür nötigen Blöcken [hier](https://snap.berkeley.edu/project?user=piotrdabrowski&project=Prog1-Uebung2). Implementieren Sie das auf zwei Arten:

Lösen Sie die Aufgabe, indem Sie eine Zählvariable einführen und diese nach jedem Schrritt um 1 erhöhen (also indem Sie Ihre Lösung der Aufgabe 2 von letzter Woche anpassen)

## Aufgabe 2

Lösen Sie die Aufgabe, indem Sie den neuen Block `walk until wall or end` aus Aufgabe 3 der letzten Woche so anpassen, dass sie:

* die Anzahl der bisher gemachten Schritte als Argument bekommt,
* intern die Anzahl der gemachten Schritte mitzählt und
* die neue Anzahl an gemachten Schritten zurückgibt.

Das Skript am Ende sollte also so aussehen:

![Skript für Aufgabe 4](Bilder/uebung4_script.png)

## Aufgabe 3

Mit dem Block `stamp` (zu finden in der Kategorie `Pen`) können Sie einen Stempel des Sprites auf dem aktuellen Feld hinterlassen.

Verwenden Sie für die nächsten Aufgaben [diesen Link](https://snap.berkeley.edu/project?user=piotrdabrowski&project=Prog1-Uebung3), wo die entsprechenden Blöcke freigeschaltet sind.

Schreiben Sie ein Skript, welches das folgende Muster erzeugt:

![Muster für Aufgabe 5](Bilder/uebung5.png)

Erstellen Sie dafür zwei neue Blöcke: `draw line of x stamps`, welcher `x` Stempel hintereinander erzeugt, sowie `return to beginning of line x`, welcher den Pfeil wieder an den Anfang der Zeile dadrunter bringt (also: Wenn Sie eine Zeile von 4 Stempeln erzeugt haben, sollte `return to beginning of line 4` den Cursor in die Zeile dadrunter bringen, und dafür 4 Schritte zurück laufen). Das Skript, um das obige Bild zu erzeugen (wobei der untere Pfeil kein Stempel ist, sondern der Cursor), sollte also so aussehen:

![Skript für Aufgabe 5](Bilder/uebung5_script.png)

## Aufgabe 4

Erzeugen Sie nun das folgende Muster (Sie brauchen dafür keine weiteren Custom-Blöcke, verwenden Sie die beiden neuen Blöcke aus Aufgabe 3 weiter):

![Muster für Aufgabe 6](Bilder/uebung6.png)


## Aufgabe 5

Erzeugen Sie nun das folgende Muster (Sie brauchen dafür keine weiteren Custom-Blöcke, verwenden Sie die beiden neuen Blöcke aus Aufgabe 3 weiter):

![Muster für Aufgabe 7](Bilder/uebung7.png)
