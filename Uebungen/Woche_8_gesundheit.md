In dieser Übung strukturieren Sie nochmals die Implementation der Aufgabenstellung, die Sie zum ersten Mal in Übung 6 gesehen haben, neu. Nun haben Sie genug Wissen über objektorientiertes Programmieren, um es so zu implementieren, wie man es tatsächlich heutzutage machen würde - so, dass die Funktionalität sauber gekapselt ist und Sie diesen Code in einem Team in der Softwareentwicklung zur weiteren Verwendung freigeben könnten.

Achten Sie beim Schreiben darauf, wie sich der Code im Vergleich zu den letzten Versionen verändert: Sie schreiben nun zwar immer mehr Zeilen Code, aber jede der Methoden, die Sie implementieren, wird einfacher zu lesen und enthält weniger Zeilen Code. Das ist die Idee bei Objektorientierung: Der Code wird übersichtlicher, und Sie brauchen an weniger denken, während Sie schreiben. Beispielsweise können Sie in der Aufgabe "Kennzahlen berechnen" in wenigen Zeilen die Metriken berechnen, indem Sie sich einfach auf die Funktionalität der Klasse AgeMetrics, die Sie in der Aufgabe "Kennzahlen in einer Klasse" implementieren, verlassen - was Sie genau für Berechnungen in AgeMetrics durchführen, brauchen Sie bei deren Verwendung jetzt nicht mehr in Erinnerung haben, Sie können sich darauf verlassen, dass `.addAge(double age)` das richtige macht.

## Patient mit Gettern und Settern

Implementieren Sie in `Patient.java` eine Klasse `Patient` die folgende Methoden besitzt:

* Einen Constructor `Patient(char status, double age)`, der inten Status ('r': recovered, genesen; 'd': deceased, verstorben) und Alter des Patienten setzt
* `public double getAge()`:  Gibt das Alter des Patienten zurück
* `public char getStatus()`:  Gibt den Status des Patienten zurück

Machen Sie bitte die Attribute age und status selber `private`, damit auf diese nur noch per getter-Methoden zugegriffen werden kann, sie aber nach Erstellung eines Patienten nicht mehr verändert werden können.

## Liste von Patienten als Klasse

Implementieren Sie in `PatientList.java` eine Klasse PatientList, die die Liste von Patienten verwalten soll. Diese soll folgende Methoden besitzen:

* Einen Constructor, der keine Argumente nimmt
* `void addPatient(Patient p)`:  Fügt einen Patienten zur internen Liste von Patienten hinzu
* `int getNumPatients()`:  Gibt die Anzahl der Patienten in der Liste zurück

Nutzen Sie zur internen Speicherung der Patienten eine ArrayList oder eine LinkedList (denken Sie an die Angabe des Datentyps bei der Deklaration und Instanziierung des Listen-Objektes - Sie sollen Patient-Objekte speichern).

## Kennzahlen in einer Klasse

Implementieren Sie in `AgeMetrics.java` eine Klasse `AgeMetrics`, die folgende Methoden besitzt:

* Einen Constructor, der keine Argumente nimmt
* `public void addAge(double age)`:  Fügt ein weiteres Alter zu den Metriken hinzu
* `public double getMinAge()`:  Gibt das kleinste bisher hinzugefügte Alter zurück
* `public double getMaxAge()`:  Gibt das höchste bisher hinzugefügte Alter zurück
* `public double getAverageAge()`:  Gibt das durchschnittliche Alter zurück
* `public boolean isEmpty()`:  Gibt `true` zurück, falls noch kein Alter zu den Metriken hinzugefügt wurde, sonst `false`

Hinweis: Sie brauchen keine Liste mit allen Werten zu speichern, nur die Metriken - orientieren Sie sich an der Berechnung in der letzten Aufgabe: Mindest- und Maximalalter können Sie direkt beim Hinzufügen eines neuen Alters aktualisieren, für getAverageAge müssen Sie sich sowohl die Summe aller bisher hinzugefügten Alter, als auch die Anzahl der hinzugefügten Alter merken.

## Kennzahlen berechnen

Implementieren Sie in `PatientList` eine Methode `public AgeMetrics getAgeMetrics()`, die die Metriken zu allen in der Liste gespeicherten Patienten als AgeMetrics-Objekt zurückliefert.

## Filter

Implementieren Sie in `PatientList` eine Methode `public PatientList filterByStatus(char status)`, die ein neues PatientList-Objekt mit den Patienten, die den angegebenen Status haben, zurückgibt.

## Ausgabe der Liste

Implementieren Sie in `AgeMetrics` eine Methode `public String toString()`, die das Mindest-, Maximal und Durchschnittsalter als String zurückgibt.

Das Ausgabeformat soll sein: 

```text
Min: <Min-alter>, Max: <Max-alter>, Mean: <MW>
```

Das ist wichtig für die automatische Überprüfung. Beachten Sie bitte, dass hier im Vergleich zu den Übungen 6 und 7 das `Genesen` und `Verstorben` fehlen!

## Risikofakter Alter

Implementieren Sie in `Aufgabe8Gesundheit` eine Methode `public static String[] showMetrics(PatientList patients)`, die in dem folgenden Format die Alter der verstorbenen und genesenen Patienten aus der übergebenen Liste zurückgibt:

```java
result[0]="Verstorben - Min: <Min-alter>, Max: <Max-alter>, Mean: <MW>"
result[1]="Genesen - Min: <Min-alter>, Max: <Max-alter>, Mean: <MW>"
```
