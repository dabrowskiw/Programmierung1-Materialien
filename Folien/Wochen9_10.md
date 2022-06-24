---
marp: true
theme: HTW
paginate: true
footer: Prof. Dr.-Ing. P. W. Dabrowski - Programmierung 1 - HTW Berlin

---

## Static-Attribute

Wichtig bei Attributen: Jedes Objekt hat eine eigene Kopie!

* Sinnvoll bei Eigenschaften des Objekts (ISBN des Buches)
* Aber schwierig, wenn Eigenschaft gemeinsam sein soll

Lösung: Statische Attribute:

* Markierung mittels `static`
* Alle Objekte haben gemeinsamen Wert!

---

## Static-Attribute: Instanzen zählen (+Heap)

```java
public Class Book {
    private int ID;
    public static int numBooks = 0;
    public Book() {
        ID = numBooks;
        numBooks += 1;
    }
    public int getID() { return ID; } 
}
Book book1 = new Book();
System.out.println("Book 1 ID: " + book1.getID())
System.out.println("Total number of books: " + Book.numBooks); //nicht book1.
Book book2 = new Book();
System.out.println("Book 2 ID: " + book2.getID())
System.out.println("Total number of books: " + Book.numBooks);
```

---

## Static-Methoden: Logik kapseln

* Methoden, die keinen Zugriff auf Attribute außer `static` brauchen
* Typisch:
    * Utility-Methoden, die logisch in die Klasse gehören
    * Ganze Utility-Klassen
    * Getter für statische Attribute

```java
public Class Book {
    private static int numBooks = 0;
    //...
    public static int getNumBooks() { return numBooks; } // kann static sein
}
```

---

## Live-Beispiele

* Book - was passiert mit und ohne static?
* static als Fehlerquelle - PatientList.calculateMeanAge() mit Patient.age als static
* Singleton zum Verwalten von Einstellungen
* DateUtilities.getDay("12.07.2022") - ähnliche Logik wie Integer.parseInt("12")

---

## Exceptions: Die Idee

* Bisheriges Umgehen mit Fehlern:
    * Alle Fehlerquellen abfangen
    * Ungültigen Wert zurückgeben
* Aber das geht nicht immer
    * Oft zu viele mögliche Gründe für Fehler, um alle zu vermeiden
    * Es können alle Rückgabewerte sinnvoll sein
* Alternative: Neuer Informationskanal zusätzlich zu return

---

## Exceptions: Die Umsetzung

* Bei Auftreten eines Fehlers kann eine Exception geworfen werden:

```java
public class Divider {
    public static double divide(double a, double b) throws Exception {
        if(b == 0) {
            throw new Exception("Can't divide by zero");
        }
        return a/b;
    }
}
try {
	System.out.println(Divider.divide(7, 0));
} catch(Exception e) {
    System.out.println("Ups, Fehler: " + e.getMessage());
}
```

---

## Exceptions: Regeln

* Wenn eine Methode eine Exception werfen kann, muss sie das mit `throws` in der Signatur ankündigen
* Wird eine Exception von einer Methode `a` geworfen, dann:
    * Ist das automatisch wie ein return an dieser Stelle
    * Wird die Exception an der Stelle, wo `a` aufgerufen wurde, sofort wieder geworfen
    * Die Kette wird erst durch ein passendes `catch` unterbrochen
* Alle Exceptions außer `RuntimeExceptions` wie `ArrayIndexOutOfBounds` müssen zwingend per `catch` gefangen werden, bevor sie aus der main-Methode fliegen können

---

## Exceptions: Live-Beispiel

```java
public static void doDivision(double v1, double v2) {
    boolean success = true;
    System.out.println("Versuche, " + v1 + " durch " + v2 + " zu teilen...");
    double a = Divider.divide(v1, v2); // braucht throws!
    try {
        double b = Divider.divide(v1, v2); // braucht kein throws
    } catch(Exception e) {
        success = false;
    }
    if(success) {
        // Vorsicht, der scope von b ist der try-catch-Block!
        System.out.println("Hat geklappt: " + b); // geht deshalb nicht
        System.out.println("Hat geklappt: " + a); // würde gehen
    }
}
```

---

## Dateien

* Spezilalisierte Klassen für Dateioperationen:
    * Datei selber: `File`
    * Lesen: `FileReader` + `BufferedReader`
    * Schreiben: `FileWriter` + `BufferedWriter`
    * Werfen bei Fehlern (Datei existiert nicht, keine Berechtigung, Festplatte voll...) `IOException`
* Idee: `File` beschreibt Datei, `Reader`/`Writer` macht low-Level-Zugriff, `BufferedReader`/`BufferedWriter` bietet Komfort-Funktionen (z.B. zeilenweises Lesen)

---

## Dateien: Live-Beispiel

```java
public class TextReader {
	public static int countWords(String infile) {
		int res = 0;
		File f = new File(infile);
		try {
			BufferedReader r = new BufferedReader(new FileReader(f));
			while(r.ready()) {
				String[] words = r.readLine().split(" ");
				res += words.length;
			}
		}
		catch(IOException e) {
			e.printStackTrace();
		}
		return res;
	}
}
```

---

## Zu guter Letzt: Evaluationsbögen

* Bitte ausfüllen! Jetzt 20 Minuten Zeit.
