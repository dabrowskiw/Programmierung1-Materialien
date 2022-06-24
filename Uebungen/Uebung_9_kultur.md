In dieser Übung verwenden Sie einen realen (wenn auch von mir etwas aufgeräumten, damit Sie bequemer damit arbeiten können) [Datensatz zu Kustauktionen der letzten Jahre](https://bidtoart.com/auction-results). Sie lesen die Daten von der Webseite aus einer csv-Datei ein (die Sie vorab gerne im Texteditor oder auch in Excel o.Ä. anschauen können) und erstellen einige Filterfunktionen, mit denen sich Fragen wie "wie waren die Gesamteinnahmen aus Auktionen pro Monat in 2020?" beantworten lassen. 

## ArtAuction

Implementieren Sie in `ArtAuction.java` eine Klasse `ArtAuction` die folgende Methoden besitzt:

* Einen leeren private-Constructor
* Eine statische Methode `static ArtAuction parseCSVLine(String line)`, die eine Zeile aus einer csv-Datei nimmt und ein ArtAuction-Objekt zurückliefert - Details siehe unten
* Folgende getter:

    * getLots() (Anzahl der Objekte in der Auktion)
    * getSale() (Summe der Einnahmen von allen verkauften Objekten)
    * getDay()
    * getMonth()
    * getYear()

Was Sie hier in `parseCSVLine(String line)` implementieren ist eine sogenannte "static factory method" (englisch so viel wie "statische Fabrik-Methode") und ein kleiner Vorgeschmack auf die design-Pattern, mit denen Sie sich in den nächsten Semestern auseinandersetzen werden. Die Idee ist, dass die Klasse nicht durch Aufruf des Constructors instanziiert werden kann, sondern nur durch Aufruf der factory method (da der constructor private ist, kann er nicht von außerhalb der Klasse aufgerufen werden, darf aber in der Methode `parseCSVLine` selber, die ja Teil der gleichen Klasse ist, genutzt werden, um ein neues Patient-Objekt zu erstellen). Einer der Vorteile ist, dass damit auf einfach lesbare Art unterschiedliche Formate unterstützt werden können - während es nur einen Constructor `public ArtAuction(String data)` geben kann, könnten Sie, wenn Sie neben CSV-Dateien zum Einlesen auch z.B. TSV-Dateien unterstützen wollten, einfach eine zweite Methode `static ArtAuction parseTSVLine(String line)` implementieren, die zum Erstellen von Auktionen aus Zeilen im TSV-Format verwendet werden kann.


Das Format der Zeile für `parseCSVLine(String line)` ist "<Datum>,<Lots>,<Sale>", beispielsweise also könnte eine Datei wie folgt aussehen:

```text
15-11-2020,174,459167
07-9-2020,194,NA
08-6-2020,NA,NA
```

Gültige Werte für Lots und Sale sind "NA" oder eine Zahl. Das Datumsformat ist "TT-MM-JJJJ".

Es sollen daraus folgende Informationen gelesen werden:

* Die Anzahl der Objekte in der Auktion. Der aus der Datei eingelesene Wert soll als `lots` gespeichert werden. Falls in der Datei "NA" steht (keine Angabe verfügbar), soll stattdessen der Wert -1 gespeichert werden.
* Der Gesamterlös Auktion. Der aus der Datei eingelesene Wert soll als `sale` gespeichert werden. Falls in der Datei "NA" steht (keine Angabe verfügbar), soll stattdessen der Wert -1 gespeichert werden.
* Das Datum der Auktion. Dieses soll in drei Werte aufgespalten gespeichert werden: `day`, `month` und `year`.

Hinweise: Sie können, wie im Skript beschrieben, einen String, der eine Zahl repräsentiert, parsen und den entsprechenden int, double etc. zurückbekommen, indem Sie die entsprechende statische parse-Methode verwenden (z.B. `double value = Double.parseDouble("129.33");`). Um überhaupt an die Werte zu kommen, werden Sie die Zeile an den entsprechenden Stellen aufspalten müssen, dafür bietet sich die Methode `split` von String an (`String[] values = "a-bc".split("-");` gibt z.B. einen String-Array mit der Länge 2 zurück, das erste Element ist "a", das zweite ist "bc").

Und ein letzter Hinweis, der für die anderen Aufgaben auch nützlich sein sollte: Der Vergleich ("==") in Java vergleicht die Werte, die in zwei Variablen stehen. Wenn Sie allerdings z.B. zwei Strings vergleichen, handelt es sich um zwei Objekte - "==" würde also die Speicheradressen, unter denen die entsprechenden Objekte gespeichert sind, vergleichen. Wenn Sie die in zwei Strings gespeicherten Texte vergleichen wollen, sollten Sie die Klassenmethode `equals` verwenden, beispielsweise so:

```java
String s = "test-test";
String[] subs = s.split("-");
System.out.println(subs[0]); //Gibt "test" aus
System.out.println(subs[1]); //Gibt auch "test" aus
System.out.println(subs[0] == subs[1]); // Gibt "false" aus
System.out.println(subs[0].equals(subs[1])); // Gibt "true" aus
```

## Liste von Auktionen als Klasse

Implementieren Sie in "ArtAuctionList.java" eine Klasse `ArtAuctionList`, die die Liste von Auktionen verwalten soll. Diese soll folgende Methoden besitzen:

* Einen Constructor, der keine Argumente nimmt (und nichts tun muss)
* `void addAuction(ArtAuction a)`: Fügt eine Auktion zur internen Liste von Auktionen hinzu
* `void addFromCSVFile(String filepath)`: Fügt die Auktionen aus der angegebenen Datei zur Liste hinzu. Wenn Sie im VPL testen wollen, können Sie als `filepath` "bidtoart.csv" verwenden, diese Datei ist direkt im Ausführungspfad vorhanden und sie finden Sie hier im repository im Order "Beispieldaten"
* `int getNumAuctions()`: Gibt die Anzahl der Auktionen in der Liste zurück
* `int getTotalSales()`: Gibt die Summe der Erlöse aller Autkionen in der Liste zurück
* Einige Filter-Methoden, die jeweils wieder eine ArtAuctionList zurückgeben:

        * `ArtAuctionList filerByLots(int minlots, int maxlots)`: Gibt nur die Auktionen zurück, deren Anzahl an lots zwischen minlots und maxlots liegt
        * `ArtAuctionList filerBySale(int minsale, int maxsale)`: Gibt nur die Auktionen zurück, deren Erlös zwischen minsale und maxsale liegt
        * `ArtAuctionList filerByYear(int year)`: Gibt nur die Auktionen zurück, die im Jahr year stattgefunden haben
        * `ArtAuctionList filerByMonth(int month)`: Gibt nur die Auktionen zurück, die im Monat month stattgefunden haben (unabhängig vom Jahr, `filterByMonth(2)` würde also sowohl eine Auktion vom Februar 2019 als auch eine Auktion vom Februar 2020 zurückgeben)
        * `ArtAuctionList filerComplete()`: Gibt nur die Auktionen zurück, für die alle Werte bekannt sind (also sowohl der Erlös als auch die Anzahl an lots in der Datei angegeben waren)

Nutzen Sie zur internen Speicherung der Auktionen eine ArrayList oder eine LinkedList (denken Sie an die Angabe des Datentyps bei der Deklaration und Instanziierung des Listen-Objektes - Sie sollen ArtAuction-Objekte speichern).

## Monatliche Erlöszahlen

Implementieren Sie in "Loesung.java" eine statische Methode `static int[] monthlySales(ArtAuctionList pl, int fromYear, int toYear, int fromMonth, int toMonth)`, die ein int-Array mit den Erlösen der im jeweiligen Jahr und Monat stattgefundenen Auktionen zurückgibt. Dabei soll der erste Wert im Array der Erlös der Auktionen im Monat fromMonth im Jahr fromYear sein, der nächste Wert der Erlös der Auktionen im darauffolgenden Monat etc., bis zum Monat toMonth im Jahr toYear.

Bedenken Sie, dass Sie im Jahr fromYear nur die Daten aus den Monaten fromMonth-12, im Jahr toYear nur die Daten aus den Monaten 1-toMonth, und in den Jahren dazwischen die Daten aus allen 12 Monaten benötigen (es sei denn, fromYear ist gleich toYear). Bedenken Sie zudem, dass die filterBy-Methoden aus ArtAuctionList jeweils wieder eine ArtAuctionList zurückgeben, Sie also einfach Aufrufe verketten können, z.B. `ArtAuctionList Jan2020 = mylist.filterByYear(2020).filterByMonth(1);`.

