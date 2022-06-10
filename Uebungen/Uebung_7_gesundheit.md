Die Aufgabe in der letzten Übung war ein wenig umständlich - und stellt man sich vor, dass es außer `ages` und `stati` noch mehr interessante Informationen gibt, kann man sich vermutlich vorstellen, dass man mit Arrays nicht sonderlich weit kommt, ohne dass es unübersichtlich wird. Entsprechend geht es diese Woche darum, die Funktionalität aus der letzten Übung objektorientiert nachzustellen.

Es gibt entsprechend in dieser Übung zwei erforderliche Dateien: Eine `Aufgabe7Gesundheit.java` mit der Klasse `Aufgabe7Gesundheit`, in der der Einstiegspunkt für das Programm mit der `public static void main(String[] args)` steht, sowie eine `Patient.java`, in der Sie Ihre eigene Klasse definieren.

Aufgrund der Funktionalität, mit der die Überprüfung der Klassen stattfindet, erscheint beim Evaluieren zunächst immer der Kompilierungs-Hinweis, dass in den Tests unsichere Operationen verwendet. Um die Kommentare zur Bewertung zu sehen, klicken Sie unten rechts auf den Reiter "Kommentare".

# Aufgabe 1: Klassendefinition

Definieren Sie zunächst in `Patient.java` eine Klasse Patient (Zugriff: public, genauso wie Aufgabe7Gesundheit). Diese soll einen Constructor `public Patient(char status, double age)` besitzen, der den Status des Patienten als char und das Alter des Patienten als double nimmt und in zwei Klassenattributen speichert: `public char status` und `public double age`.

\subsection{Kennzahlen}

Implementieren Sie in `Aufgabe7Gesundheit` eine Methode `public static double[] ageMetrics(Patient[] patients)`, die ein Array der Länge 3 mit den folgenden drei Werten (beginnend bei Index 0) zurückgibt:

* Das Alter des jüngsten Patienten
* Das Alter des ältesten Patienten
* Den Mittelwert der Alter aller Patienten

# Aufgabe 2: Filter

Implementieren Sie in `Aufgabe7Gesundheit` eine Methode `public static Patient[] filterByStatus(Patient[] patients, char status)`, die ein neues Array von `Patient` zurückgibt. Dieses Array soll diejenigen Patienten enthalten, die den angegebenen Status haben.

## Aufgabe 3: Patienten erstellen

Implementieren Sie in `Aufgabe7Gesundheit` eine Methode `public static Patient[] createPatients(char[] stati, double[] ages)`, die aus dem Status und dem Alter jeweils an der gleichen Position in den übergebenen Arrays ein neues Patient-Objekt erstellt und ein neues Array mit den erstellten Patient-Objekten zurückgibt.

## Aufgabe 4: Risikofaktor Alter

Implementieren Sie in `Aufgabe7Gesundheit` eine Methode `public static String[] showMetrics(Patient[] patients)`, die das Mindest-, Maximal und Durchschnittsalter jeweils für die verstorbenen und genesenen Patienten als Strings zurückgibt.

Das Ausgabeformat soll wie folgt sein (wichtig für die automatische Überprüfung):

```java
result[0]="Verstorben - Min: <Min-alter>, Max: <Max-alter>, Mean: <MW>";
result[1]="Genesen - Min: <Min-alter>, Max: <Max-alter>, Mean: <MW>";
```

Hier ein Beispiel mit konkreten Werten:

```java
result[0]="Verstorben - Min: 12, Max: 80, Mean: 40.5"
result[1]="Genesen - Min: 8, Max: 89, Mean: 45.31"
```

Hinweis: Sie können einen neuen String ähnlich erstellen, wie Sie Informationen ausgeben. Wenn Sie z.B. eine Zeile mittels `System.out.println("Der Wert von x ist: " + x + "!");` ausgeben, können Sie stattdessen einen neuen String mit diesem Text wie folgt erstellen: `String ausgabe = new String("Der Wert von x ist" + x + "!");`.