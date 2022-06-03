# Aufgabe 1: Kennzahlen

Implementieren Sie eine Methode `public static double[] metrics(double[] values)`, die ein Array der Länge 3 mit den folgenden drei Werten (beginnend bei Index 0) zurückgibt:

* Den kleinsten Wert aus dem Array
* Den größten Wert aus dem Array
* Den Mittelwert aller Werte aus dem Array

# Aufgabe 2: Filter

Implementieren Sie eine Methode `public static int[] filter(char[] values, char toSelect)`, die ein neues Array von int zurückgibt. Dieses Array soll die Indices enthalten, unter denen das übergebene Array `values` den Wert `toSelect` hat. Beispiel: Wenn als values {'a', 'b', 'a', 'c', 'd'} und als toSelect 'a' übergeben wird, soll als Ergebnis das int-Array {0, 2} zurückgegeben werden. Hinweise:

* Am Anfang wissen Sie noch nicht, wie viele Werte Sie zurückgeben müssen, und um ein neues Array anzulegen müssen Sie dessen Länge angeben. Entsprechend werden Sie zwei Mal über values iterieren müssen - ein Mal zum Zählen, und ein Mal zum Befüllen des Ergebnis-Arrays.
* Es ist zulässig, ein Array der Länge 0 anzulegen.

# Aufgabe 3: Select

Implementieren Sie eine Methode `public static double[] select(double[] values, int[] indices)`, die ein neues Array mit den Werten aus `values` zurückgibt, welche unter den in `indices` angegebenen Indices stehen. Beispiel: Wenn als values {2, 4, 6, 8, 10} und als indices {0, 3} übergeben werden, soll die Methode {2, 8} zurückgeben.

# Aufgabe 4: Risikofaktor Alter

Im Moodle finden Sie in der Aufgabenbeschreibung zwei Array-Definitionen: `ages` und `stati`. Das sind aus dem Indischen COVID-19-Patientendatensatz\footnote{\href{https://www.kaggle.com/gdabhishek/covid19india/data}{https://www.kaggle.com/gdabhishek/covid19india/data}} die Alter und Stati (`r` für recovered, `d` für deceased) von 134 Patienten.

Geben Sie in der `public static void main(String[] args)` der Loesung-Klasse das Mindest-, Maximal und Durchschnittsalter jeweils für die verstorbenen und genesenen Patienten aus. Hinweis: Verwenden Sie die Methoden `metrics`, `filter` und `select`, die Sie gerade implementiert haben - dann ist diese Aufgabe in wenigen Zeilen gelöst.

Das Ausgabeformat soll wie folgt sein (wichtig für die automatische Überprüfung):

```
Verstorben - Min: <Mindestalter>, Max: <Maximalalter>, Mean: <Mittelwert>
Genesen - Min: <Mindestalter>, Max: <Maximalalter>, Mean: <Mittelwert>
```

Also beispielsweise:

```
Verstorben - Min: 12, Max: 80, Mean: 40.5
Genesen - Min: 8, Max: 89, Mean: 45.31
```

Beachten Sie bitte die korrekten Trennzeichen (also: Komma, Doppelpunkt etc. richtig setzen)!

Zweiter Hinweis: Da wir noch kein Einlesen von Dateien hatten, und das automatische Testen von Ausgaben nur aus der main heraus funktioniert (und nicht, wenn Sie eine Funktion mit entsprechenden Parametern implementieren), kann ich nur diesen einen Testfall abfragen. **Wenn ich bei irgendeiner dieser Lösungen sehe, dass Sie einfach per print-Ausgabe den kompletten erwarteten String mit fest einprogrammierten Werten ausgeben, anstatt die Werte zu berechnen, werde ich das als Betrugsversuch werten und Sie nicht zur Klausur zulassen** (Normalerweise würde ich das nicht so hart sehen, aber es wäre erstens ein äußerst schlechter Betrugsversuch, und zweitens steht es fett in der Aufgabenstellung - und wer nicht lesen kann, würde eh nicht bestehen ;) )!