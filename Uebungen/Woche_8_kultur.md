In dieser Übung strukturieren Sie nochmals die Implementation der Aufgabenstellung, die Sie zum ersten Mal in Übung 6 gesehen haben, neu. Nun haben Sie genug Wissen über objektorientiertes Programmieren, um es so zu implementieren, wie man es tatsächlich heutzutage machen würde - so, dass die Funktionalität sauber gekapselt ist und Sie diesen Code in einem Team in der Softwareentwicklung zur weiteren Verwendung freigeben könnten.

Achten Sie beim Schreiben darauf, wie sich der Code im Vergleich zu den letzten Versionen verändert: Sie schreiben nun zwar immer mehr Zeilen Code, aber jede der Methoden, die Sie implementieren, wird einfacher zu lesen und enthält weniger Zeilen Code. Das ist die Idee bei Objektorientierung: Der Code wird übersichtlicher, und Sie brauchen an weniger denken, während Sie schreiben. Beispielsweise können Sie in der Aufgabe "Kennzahlen berechnen" in wenigen Zeilen die Metriken berechnen, indem Sie sich einfach auf die Funktionalität der Klasse PriceMetrics, die Sie in der Aufgabe "Kennzahlen in einer Klasse" implementieren, verlassen - was Sie genau für Berechnungen in PriceMetrics durchführen, brauchen Sie bei deren Verwendung jetzt nicht mehr in Erinnerung haben, Sie können sich darauf verlassen, dass `.addPrice(double price)` das richtige macht.

## Kunstobjekt mit Gettern und Settern

Implementieren Sie in `ArtObject.java` eine Klasse `ArtObject` die folgende Methoden besitzt:

* Einen Constructor `ArtObject(char status, double price)`, der inten Status ('s': sold, verkauft; 'u': unsold, nicht verkauft) und Preis des Kunstobjekts setzt
* `public double getPrice()`: Gibt den Preis des Kunstobjekts zurück
* `public char getStatus()`: Gibt den Status des Kunstobjekts zurück
* `public String toString()`: Gibt einen String zurück, der das Kunstobjekt beschreibt. Format: `Kunstobjekt, Preis: <Preis>, Status: <Status>`

Machen Sie bitte die Attribute price und status selber `private`, damit auf diese nur noch per getter-Methoden zugegriffen werden kann, sie aber nach Erstellung eines Kunstobjekts nicht mehr verändert werden können.

## Liste von Kunstobjekten als Klasse

Implementieren Sie in `ArtObjectList.java` eine Klasse ArtObjectList, die die Liste von Kunstobjekten verwalten soll. Diese soll folgende Methoden besitzen:

* Einen Constructor, der keine Argumente nimmt
* `void addArtObject(ArtObject p)`:  Fügt ein Kunstobjekt zur internen Liste von Kunstobjekten hinzu
* `int getNumArtObjects()`:  Gibt die Anzahl der Kunstobjekte in der Liste zurück

Nutzen Sie zur internen Speicherung der Kunstobjekte eine ArrayList oder eine LinkedList (denken Sie an die Angabe des Datentyps bei der Deklaration und Instanziierung des Listen-Objektes - Sie sollen ArtObject-Objekte speichern).

## Kennzahlen in einer Klasse

Implementieren Sie in `PriceMetrics.java` eine Klasse `PriceMetrics`, die folgende Methoden besitzt:

* Einen Constructor, der keine Argumente nimmt
* `public void addPrice(double price)`:  Fügt einen weiteren Preis zu den Metriken hinzu
* `public double getMinPrice()`:  Gibt den kleinsten bisher hinzugefügten Preis zurück
* `public double getMaxPrice()`:  Gibt den höchsten bisher hinzugefügten Preis zurück
* `public double getAveragePrice()`:  Gibt den durchschnittliche Preis zurück
* `public boolean isEmpty()`:  Gibt `true` zurück, falls noch kein Preis zu den Metriken hinzugefügt wurde, sonst `false`

Hinweis: Sie brauchen keine Liste mit allen Werten zu speichern, nur die Metriken - orientieren Sie sich an der Berechnung in der letzten Aufgabe: Mindest- und Maximalpreis können Sie direkt beim Hinzufügen eines neuen Preises aktualisieren, für getAveragePrice müssen Sie sich sowohl die Summe aller bisher hinzugefügten Preise, als auch die Anzahl der hinzugefügten Preise merken.

## Kennzahlen berechnen

Implementieren Sie in `ArtObjectList` eine Methode `public PriceMetrics getPriceMetrics()`, die die Metriken zu allen in der Liste gespeicherten Kunstobjekte als PriceMetrics-Objekt zurückliefert.

## Filter

Implementieren Sie in `ArtObjectList` eine Methode `public ArtObjectList filterByStatus(char status)`, die ein neues ArtObjectList-Objekt mit den Kunstobjekten, die den angegebenen Status haben, zurückgibt.

## Ausgabe der Liste

Implementieren Sie in `PriceMetrics` eine Methode `public String toString()`, die Mindest-, Maximal und Durchschnittspreis als String zurückgibt.

Das Ausgabeformat soll sein: 

```text
Min: <Min-preis>, Max: <Max-preis>, Mean: <MW>
```

Das ist wichtig für die automatische Überprüfung. Beachten Sie bitte, dass hier im Vergleich zu den Übung 7 das `Verkauft - ` und `Nicht verkauft - ` fehlen!

## Ist Geiz geil?

Implementieren Sie in `Aufgabe8Kultur` eine Methode `public static String[] showMetrics(ArtObjectList artobjects)`, die in dem folgenden Format die Preise der verkauften und nicht verkauften Kunstobjekte aus der übergebenen Liste zurückgibt:

```java
result[0]="Verkauft - Min: <Min-preis>, Max: <Max-preis>, Mean: <MW>"
result[1]="Nicht verkauft - Min: <Min-preis>, Max: <Max-preis>, Mean: <MW>"
```
