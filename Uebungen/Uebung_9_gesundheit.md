In dieser Übung verwenden Sie einen realen (wenn auch von mir etwas aufgeräumten, damit Sie bequemer damit arbeiten können) Datensatz mit [Daten zum Infektionsgeschehen](https://github.com/beoutbreakprepared/nCoV2019) aus einer [Nature-Publikation zur Bereitstellung epidemiologischer Daten in der Corona-Krise](https://www.nature.com/articles/s41597-020-0448-0). Da die Status-Information zu den meisten Patienten fehlt, wenden wir uns hier den Infektionszahlen zu.

## Patient

Implementieren Sie in `Patient.java` eine Klasse `Patient` die folgende Methoden besitzt:

* Einen leeren private-Constructor
* Eine statische Methode `static Patient parseCSVLine(String line)`, die eine Zeile aus einer Patienten beschreibenden csv-Datei nimmt und ein Patient-Objekt zurückliefert - Details siehe unten
* Folgende getter:

  * getFromAge()
  * getToAge()
  * getSex()
  * getDay()
  * getMonth()
  * getYear()

Was Sie hier in `parseCSVLine(String line)` implementieren ist eine sogenannte "static factory method" (englisch so viel wie "statische Fabrik-Methode") und ein kleiner Vorgeschmack auf die design-Pattern, mit denen Sie sich in den nächsten Semestern auseinandersetzen werden. Die Idee ist, dass die Klasse nicht durch Aufruf des Constructors instanziiert werden kann, sondern nur durch Aufruf der factory method (da der constructor private ist, kann er nicht von außerhalb der Klasse aufgerufen werden, darf aber in der Methode `parseCSVLine` selber, die ja Teil der gleichen Klasse ist, genutzt werden, um ein neues Patient-Objekt zu erstellen). Einer der Vorteile ist, dass damit auf einfach lesbare Art unterschiedliche Formate unterstützt werden können - während es nur einen Constructor `public Patient(String data)` geben kann, könnten Sie, wenn Sie neben CSV-Dateien zum Einlesen auch z.B. TSV-Dateien unterstützen wollten, einfach eine zweite Methode `static Patient parseTSVLine(String line)` implementieren, die zum Erstellen von Patienten aus Zeilen im TSV-Format verwendet werden kann.

\begin{figure}
  \begin{subfigure}[t]{0.45\textwidth}
    \begin{lstlisting}
<Alter>,<Geschlecht>,<Datum>
    \end{lstlisting}
    \caption{Formatdefinition. }
    \label{fig1_1}
  \end{subfigure}\hspace{2em}
  \begin{subfigure}[t]{0.45\textwidth}
    \begin{lstlisting}
N/A,male,01-03-2020
12,N/A,02-05-2020
50-60,female,30-12-2019
    \end{lstlisting}
    \caption{Zeilenbeispiele}
    \label{fig1_2}
  \end{subfigure}
    \caption{Format der CSV-Datei, die die Patienten beschreibt.}
    \label{fig1}
\end{figure}

Das Format der Zeile für `parseCSVLine(String line)` ist "<Alter>,<Geschlecht>,<Datum>", beispielsweise also könnte eine Datei wie folgt aussehen:

```text
N/A,male,01-03-2020
12,N/A,02-05-2020
50-60,female,30-12-2019
```

Dabei sind gültige Werte für Alter "N/A", "Zahl" oder "Zahl-Zahl". Gültige Werte für Geschlecht sind "N/A", "female" und "male". Das Datumsformat ist "TT-MM-JJJJ".

Es sollen daraus folgende Informationen gelesen werden:

* Das Alter. Da das Alter z.T. nur als Altersspanne angegeben wird, müssen in einem Patienten der untere und der obere Grenzwert der Spanne abgespeichert werden (`fromAge`, `toAge`). Dabei gibt es drei Optionen:

  * Wenn das Alter mit "N/A" angegeben ist (Zeile 1 in der Beispieldatei), sollen sowohl `fromAge` als auch `toAge` -1 sein.
  * Wenn das Alter als konkrete Zahl angegeben ist (Zeile 2 in der Beispieldatei), sollen sowohl `fromAge` als auch ``toAge'' auf diesen Wert gesetzt werden.
  * Wenn das Alter als Spanne von-bis angegeben ist (Zeile 3 in der Beispieldatei), sollen `fromAge` und `toAge` auf den ersten bzw. auf den zweiten Wert der Spanne gesetzt werden.

* Das Geschlecht. Dieses soll als der in der Datei angegebene String als `sex` gespeichert werden.
* Das Datum (des positiven SARS-CoV 2-Testergebnisses). Dieses soll in drei Werte aufgespalten gespeichert werden: `day`, `month` und `year`.

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

## Liste von Patienten als Klasse

Implementieren Sie in "PatientList.java" eine Klasse `PatientList`, die die Liste von Patienten verwalten soll. Diese soll folgende Methoden besitzen:

* Einen Constructor, der keine Argumente nimmt
*`void addPatient(Patient p)`: Fügt einen Patienten zur internen Liste von Patienten hinzu
*`void addFromCSVFile(String filepath)`: Fügt die Patienten aus der angegebenen Datei zur Liste hinzu. Wenn Sie im VPL testen wollen, können Sie als `filepath` "Berlin.csv" verwenden, diese Datei ist direkt im Ausführungspfad vorhanden und sie finden Sie hier im repository im Order "Beispieldaten"
*`int getNumPatients()`: Gibt die Anzahl der Patienten in der Liste zurück
* Einige Filter-Methoden, die jeweils wieder eine PatientList zurückgeben:

    * `PatientList filterByFromAge(int minfromage, int maxfromage)`: Gibt nur die Patienten zurück, deren fromAge zwischen minfromage und maxfromage liegt
    * `PatientList filterByToAge(int mintoage, int maxtoage)`: Gibt nur die Patienten zurück, deren toAge zwischen mintoage und maxtoage liegt
    * `PatientList filterBySex(String sex)`: Gibt nur die Patienten zurück, deren Geschlecht sex ist
    * `PatientList filterByYear(int year)`: Gibt nur die Patienten zurück, deren Diagnose im Jahr year liegt
    * `PatientList filterByMonth(int month)`: Gibt nur die Patienten zurück, deren Diagnose im Monath month liegt (unabhängig vom Jahr, `filterByMonth(2)` würde also sowohl einen Patienten, der im Februar 2019 als auch einen Patienten, der im Februar 2020 diagnostiziert wurde, zurückgeben)

Nutzen Sie zur internen Speicherung der Patienten eine ArrayList oder eine LinkedList (denken Sie an die Angabe des Datentyps bei der Deklaration und Instanziierung des Listen-Objektes - Sie sollen Patient-Objekte speichern).

## Monatliche Infektionszahlen

Implementieren Sie in `Loesung.java` eine statische Methode `static int[] monthlyInfections(PatientList pl, int fromYear, int toYear, int fromMonth, int toMonth)`, die ein int-Array mit den monatlichen Infektionszahlen zurückgibt. Dabei soll der erste Wert im Array die Anzahl der Infektionen im Monat fromMonth im Jahr fromYear sein, der nächste Wert die Anzahl der Infektionen im darauffolgenden Monat etc., bis zum Monat toMonth im Jahr toYear.

Bedenken Sie, dass Sie im Jahr fromYear nur die Daten aus den Monaten fromMonth-12, im Jahr toYear nur die Daten aus den Monaten 1-toMonth, und in den Jahren dazwischen die Daten aus allen 12 Monaten benötigen (es sei denn, fromYear ist gleich toYear). Bedenken Sie zudem, dass die filterBy-Methoden aus PatientList jeweils wieder eine PatientList zurückgeben, Sie also einfach Aufrufe verketten können, z.B. `PatientList male2020 = pl.filterBySex("male").filterByYear(2020);`.

