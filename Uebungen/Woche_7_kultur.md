Die Aufgabe in der letzten Übung war ein wenig umständlich - und stellt man sich vor, dass es außer `ages` und `stati` noch mehr interessante Informationen gibt, kann man sich vermutlich vorstellen, dass man mit Arrays nicht sonderlich weit kommt, ohne dass es unübersichtlich wird. Entsprechend geht es diese Woche darum, die Funktionalität aus der letzten Übung objektorientiert nachzustellen. In diesem Fall arbeiten wir anstatt mit Patienten mit Kunstobjekten in einer Auktion, die Preisschätzungen haben (das ist der Wert, auf den das Objekt vor der Auktion geschätzt wurde, nicht der tatsächliche Verkaufspreis) und verkauft oder nicht verkauft wurden - die Logik ist aber exakt die gleiche wie bei den Patienten in der letzten Hausaufgabe. 

Sie können als Testarrays die folgenden Daten von einer [Auktion moderner Kunst im Juli 2020 in Paris](https://bidtoart.com/auction-houses/modern-art/79115b60-02c0-11eb-8cba-c4b301b9da2d) verwenden:

```java
char[] stati = new char[] {'s', 's', 's', 'u', 'u', 'u', 's', 's', 'u', 'u', 'u', 'u', 's', 's', 'u', 's', 's', 's', 
's', 'u', 'u', 's', 's', 's', 's', 'u', 's', 's', 'u', 'u', 's', 'u', 'u', 's', 's', 'u', 'u', 's', 's', 'u'};
double[] prices = new double[] {600, 6000, 1500, 1000, 1000, 1500, 2500, 1800, 1500, 400, 4000, 2000, 5000, 1000, 
2000, 6000, 800, 1000, 1500, 1000, 1500, 500, 1500, 1500, 1500, 8000, 3000, 8000, 2500, 5000, 1500, 5000, 10000, 
2000, 1500, 3500, 1500, 2500, 2500, 2500}; 
```

Es gibt für die Implementation der Klasse sowie das Testen in dieser Übung entsprechend zwei erforderliche Dateien: Eine `Aufgabe7Kultur.java` mit einer Klasse `Aufgabe7Kultur`, in der der Einstiegspunkt für das Programm mit der `public static void main(String[] args)` steht, sowie eine `ArtObject.java`, in der Sie Ihre eigene Klasse definieren.

Hinweis: Aufgrund der Funktionalität, mit der die Überprüfung der Klassen stattfindet, erscheint beim Evaluieren zunächst immer der Kompilierungs-Hinweis, dass in den Tests unsichere Operationen verwendet. Um die Kommentare zur Bewertung zu sehen, klicken Sie unten rechts auf den Reiter `Kommentare`.

# Aufgabe 1: Klassendefinition

Definieren Sie zunächst in `ArtObject.java` eine Klasse ArtObject (Zugriff: public, genauso wie Aufgabe7Kultur). Diese soll einen Constructor `public ArtObject(char status, double price)` besitzen, der den Status des Kunstobjekts als char und den Preis als double nimmt und in zwei Klassenattributen speichert: `public char status` und `public double price`.

# Aufgabe 2: Kennzahlen

Implementieren Sie in `Aufgabe7Kultur` eine Methode `public static double[] priceMetrics(ArtObject[] objects)`, die ein Array der Länge 3 mit den folgenden drei Werten (beginnend bei Index 0) zurückgibt:

* Den Preis des günstigsten Kunstobjekts
* Den Preis des teuersten Kunstobjekts
* Den Mittelwert der Preise aller Kunstobjekte

# Aufgabe 3: Filter

Implementieren Sie in `Aufgabe7Kultur` eine Methode `public static ArtObject[] filterByStatus(ArtObject[] objects, char status)`, die ein neues Array von ArtObject zurückgibt. Dieses Array soll diejenigen Kunstobjekte enthalten, die den angegebenen Status haben.

# Aufgabe 4: Kunstobjekte erstellen

Implementieren Sie in `Aufgabe7Kultur` eine Methode `public static ArtObject[] createArtObjects(char[] stati, double[] prices)`, die aus dem Status und dem Preis jeweils an der gleichen Position in den übergebenen Arrays ein neues ArtObject-Objekt erstellt und ein neues Array mit den erstellten ArtObject-Objekten zurückgibt.

# Aufgabe 5: Ist Geiz geil?

Implementieren Sie in `Aufgabe7Kultur` eine Methode `public static String[] showMetrics(ArtObject[] object)`, die den Mindest-, Maximal und Durchschnittspreis jeweils für die verkauften und nicht verkauften Kunstobjekte als Strings zurückgibt.

Das Ausgabeformat soll wie folgt sein (wichtig für die automatische Überprüfung):

```java
result[0]="Verkauft - Min: <Min-preis>, Max: <Max-preis>, Mean: <MW>";
result[1]="Nicht verkauft - Min: <Min-preis>, Max: <Max-preis>, Mean: <MW>";
```

Hier ein Beispiel mit konkreten Werten:

```java
result[0]="Verkauft - Min: 1200, Max: 8000000, Mean: 500000";
result[1]="Nicht verkauft - Min: 50000, Max: 700000, Mean: 95000";
```

Hinweis: Sie können einen neuen String ähnlich erstellen, wie Sie Informationen ausgeben. Wenn Sie z.B. eine Zeile mittels `System.out.println("Der Wert von x ist: " + x + "!");` ausgeben, können Sie stattdessen einen neuen String mit diesem Text wie folgt erstellen: `String ausgabe = "Der Wert von x ist" + x + "!";`.
