#import "header.typ": *


#show: htwslides

#title-slide(
  title: "Programmierung 1",
  subtitle: "Wochen 11-12: Exceptions, Dateioperationen etc.",
  institution-name: "HTW Berlin"
)

== Fehlerbehandlung

- Bisheriges Umgehen mit Fehlern:
    - Alle Fehlerquellen abfangen
    - Ungültigen Wert zurückgeben
- Aber das geht nicht immer
    - Oft zu viele mögliche Gründe für Fehler, um alle zu vermeiden
    - Es können alle Rückgabewerte sinnvoll sein
- Alternative: Neuer Informationskanal zusätzlich zu return


== Exceptions

- Bei Auftreten eines Fehlers kann eine Exception geworfen werden:

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

== Regeln

- Wenn eine Methode eine Exception werfen kann, muss sie das mit `throws` in der Signatur ankündigen
- Wird eine Exception von einer Methode `a` geworfen, dann:
    - Ist das automatisch wie ein return an dieser Stelle
    - Wird die Exception an der Stelle, wo `a` aufgerufen wurde, sofort wieder geworfen
    - Die Kette wird erst durch ein passendes `catch` unterbrochen
- Alle Exceptions außer `RuntimeExceptions` wie `ArrayIndexOutOfBounds` müssen zwingend per `catch` gefangen werden, bevor sie aus der main-Methode fliegen können


== Live-Beispiel

- Generell überall sinnvoll, wo Fehler auftreten können (-> Algorithmus kann kein sinnvolles Ergebnis liefern)
- Eigene Ideen? 
- Sonst: Fibonacci-Folge berechnen, Exception bei:
  - Integer overflow
  - Negativer Eingabe


== Dateioperationen

- Spezilalisierte Klassen für Dateioperationen:
    - Datei selber: `File`
    - Lesen: `FileReader` + `BufferedReader`
    - Schreiben: `FileWriter` + `BufferedWriter`
    - Werfen bei Fehlern (Datei existiert nicht, keine Berechtigung, Festplatte voll...) `IOException`
- Idee: `File` beschreibt Datei, `Reader`/`Writer` macht low-Level-Zugriff, `BufferedReader`/`BufferedWriter` bietet Komfort-Funktionen (z.B. zeilenweises Lesen)

== Code und Live-Beispiel

```java
public class TextReader {
	public static void printContents(String infile) {
		File f = new File(infile);
		try {
			BufferedReader r = new BufferedReader(new FileReader(f));
			while(r.ready()) {
				System.out.println(r.readLine());
			}
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}
}
```

  Wie könnte man damit die Wörter in einer Datei zählen?


== StringBuilder

- String hält intern ein `char[]`
    - immutable!
    - Scheinbare Veränderung = Inhalt kopieren + neuer String
- Effizienter Aufbau: `StringBuilder`
    - Erlaubt Hinzufügen von Textteilen
    - Werden am Ende mit `toString()` zusammengefügt
    - Nur 1 Kopiervorgang


== StringBuilder

```java
double startTime = System.currentTimeMillis();
String text = "";
for(int i=0; i<100000; i++) {
    text += i + ",";
}
System.out.println(text.substring(0, 10));
System.out.println(System.currentTimeMillis() - startTime); // 4291 ms
startTime = System.currentTimeMillis();
StringBuilder textBuilder = new StringBuilder();
for(int i=0; i<100000; i++) {
    textBuilder.append(i + ",");
}
System.out.println(textBuilder.toString().substring(0, 10));
System.out.println(System.currentTimeMillis() - startTime); // 8 ms
  ```

== HashMap

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    - Array, ArrayList, LinkedList: Zuordnung Index #sym.arrow Wert
    - Zuordnung+Abfrage von Eigenschaften (z.B. "Pflanze hat Farbe") - wie? #only(2)[
      - Objektorientierung: 
        - Klasse `Pflanze` mit Attribut Farbe
        - Liste von Pflanzen
      ...umständlich.
      ]#only(3)[
      - Alternative: `HashMap<Key, Value>`
        - Key statt Index
        - Beliebige Klassen
        - Zuordnung über Hash (#sym.arrow Index in internem Array)
      ] 
  ],
  [
    #only(2)[
      ```java
      public class Pflanze {
        public String name;
        public String farbe;
        public Pflanze(String n, String f) {
          name = n;
          farbe = f;
        }
      }
      //...
      public class PflanzenListe {
        private LinkedList<Pflanze> pflanzen;
        //Constructor, addPflanze() etc.
        public String getFarbe(String name) {
          for(Pflanze p : pflanzen) {
            if(p.name.equals(name)) {
              return p.farbe;
            }
          }
          return null;
        }
      }
      ```
    ]
    #only(3)[
      ```java
      public class Main {
        public static void main() {
          HashMap<String, String> pflanzen = 
                      new HashMap<>();
          pflanzen.put("roses", "red");
          pflanzen.put("violets", "blue");
          System.out.println(
                      pflanzen.get("blub"));
          System.out.println(
                      pflanzen.get("rose"));
          for(String n : pflanzen.keySet()) {
            System.out.println(n + " are " 
                      + pflanzen.get(name) 
                      + ",");
          }
        }
      }
      ```
    ]
  ]
)



== Static-Attribute

Wichtig bei Attributen: Jedes Objekt hat eine eigene Kopie!

- Sinnvoll bei Eigenschaften des Objekts (ISBN des Buches)
- Aber schwierig, wenn Eigenschaft gemeinsam sein soll

Lösung: Statische Attribute:

- Markierung mittels `static`
- Alle Objekte haben gemeinsamen Wert!


== Static-Attribute: Beispiel

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

== Static-Methoden

- Methoden, die keinen Zugriff auf Attribute außer `static` brauchen
- Typisch:
    - Utility-Methoden, die logisch in die Klasse gehören
    - Ganze Utility-Klassen
    - Getter für statische Attribute

```java
public Class Book {
    private static int numBooks = 0;
    //...
    public static int getNumBooks() { return numBooks; } // kann static sein
}
```

== Live-Beispiele für static

- Book - was passiert mit und ohne static?
- static als Fehlerquelle - PatientList.calculateMeanAge() mit Patient.age als static
- Singleton zum Verwalten von Einstellungen
- DateUtilities.getDay("12.07.2022") - ähnliche Logik wie Integer.parseInt("12")


== Externe Libraries

- Viele Leute haben ähnliche Probleme
- Immer das Rad neu zu erfinden ist ineffizient - "Wir stehen auf den Schultern von Giganten"
- Lösung in Programmierung: Bibliotheken ("Libraries")
    - Eigenen Code so verpacken, dass er einfach nachnutzbar ist
    - Fremde Libraries verwenden, wenn sinnvoll möglich
- In Java: JAR-Dateien

== Libraries: Sicherheit

#grid(
  columns: (1fr, 1.3fr),
  gutter: 1em,
  [
    #image("Bilder/xkcd_dependency.png", height: 100%)
  ],
  [
    - Projekte sind oft "Hobbies"
    - Einige Kriterien:
        - Größe der Community
        - Verwendung in Projekten
        - Umgang mit issues 
    - Aktuell: Supply-Chain-Angriffe:
      - Shai-Hulud NPM Worm
      - XZ Utils attack
      - Repo confusion, z.B. GitHub Search Manipulation
    - Manchmal muss man das Rad doch neu erfinden...
  ]
)

== Libraries: Lizenzen

- Open Source vs. Closed Source
- Copyleft vs. Copyright
- Kompatibilität (-> immer eigene Lizenz setzen)!

#image("Bilder/licensecompat.png", height: 65%)

== Letzte (Verständnis-)Fragen

- Jetzt Möglichkeit, noch offene Fragen vor der Prüfung zu klären!
