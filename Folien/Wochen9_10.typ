#import "@preview/polylux:0.4.0": *
#import "@preview/colorful-boxes:1.3.1": *
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge
#import "@preview/codelst:2.0.2": sourcecode
#import fletcher.shapes: diamond, ellipse
#import "/home/wojtek/Documents/workspaces/typst/htw-polylux/university.typ": theme, main
//#import "@local/fau-typst:0.0.1": fau-theme, main
#import theme: *  // import everything from the theme (slide types)

// initialize the template with this function (important!)
#show: main.setup-theme.with(
  short-author: "Prof. Dr.-Ing. Piotr Wojciech Dabrowski",
  short-title: "Programmierung 1",
  short-date: datetime.today(),
  short-organization: "IKG",
)

//#import themes.university: *

#set text(
  hyphenate: true,
  lang: "de"
)

//#show: university-theme.with(
//  color-a: rgb("#76B900"),
//  color-b: rgb("#0082D1"),
//  color-c: rgb("#EDf5DF"),
//  short-title: "Programmierung 1 IKG",
//  short-date: "WiSe 24/25"
//)

#show link: underline

#title-slide(
  title: "Programmierung 1",
  subtitle: "Das Finale: Dateioperationen",
//  date: "07.11.2024",
  authors: (
    (
      name: "Piotr Dabrowski",
      affiliation: "HTW Berlin",
      email: "piotr.dabrowski@htw-berlin.de",
    ),
  )
)

== Komplexe Daten mit Arrays

- Mehrdimensionales Array: Wie Tabelle
- Beispiel: Mob in Spiel

#table(columns: (1fr,1fr,1fr,2fr),
  [x], [y], [hp], [type],
  [ 9 ], [ 2 ], [ 15 ], [ G ],
  [ 7 ], [ 5 ], [  3 ], [ V ],
)

```java
int[] xpos = new int[]{9, 7};
int[] ypos = new int[]{2, 5};
int[] hp = new int[]{15, 3};
char[] type = new char[]{'G', 'V'};
```



== Komplexe Daten mit Arrays - Verwendung

- Wenn etwas getan werden soll, notwendige Arrays übergeben
- Zusammenhang über Index (wie in Übung/Hausaufgabe)

```java
public static void moveMob(int num, int[] x, int[] y, char dir) {
    if(dir=='Q') {
      x[num] -=1;
      y[num] -= 1;
    }
}
//...
int[] xpos = new int[]{9, 7};
int[] ypos = new int[]{2, 5};
int[] hp = new int[]{15, 3};
```



== Komplexe Daten mit Arrays - Verwendung 2

```java
public static void moveMob(int num, int[] x, int[] y, int[] hp, 
                           char[] type, char dir) {
    if(dir=='Q') {
      x[num] -=1;
      y[num] -= 1;
    }
    if(type[num] == 'G') {
        hp[num] -= 1;
    }
}
public class Main {
  public static void main(String[] args) {
    int[] xpos = new int[]{9, 7};
    int[] ypos = new int[]{2, 5};
    int[] hp = new int[]{15, 3};
    char[] type = new char[]{'G', 'O'}; // G=Gelatinous Cube
  }
}
```
-> Je mehr Daten zusammenhängen, um so schwieriger



== Lösung: Objekte

- Dinge, die konzeptionell zusammengehören verbinden
- Gemeinsame Speicherung (Heap! Wie Array mit mehr Datentypen)

```java
public class Mob {
    public int x;
    public int y;
    public int hp;
    public char type;
}
public class Main {
  public static void main(String[] args) {
    Mob mob1 = new Mob();
    mob1.x = 9;
    mob1.y = 2;
    mob1.hp = 15;
    mob1.type = 'G';
  }
}
```



== Objekt initialisieren: Constructor

```java
public class Mob {
    public int x;
    public int y;
    public Mob(int newx, int newy) {
        x = newx;
        y = newy;
    }
}
public class Main {
  public static void main(String[] args) {
    Mob mob1 = new Mob(9, 2);
    Mob mob2 = new Mob(7, 5);
  }
}
```

- x: Attribut, newx: Variable
- Mob(): Constructor + Methode
- Mob: Klasse, mob1+mob2: Objekte



== Scoping

```java
public class Mob { /* [...] */ }

public class Main {
  public void changeX(Mob mob, int diff) {
      mob.x += diff;
  }
  public void replaceMob(Mob mob, int x, int y) {
      mob = new Mob(x, y);
  }
  public static void main(String[] args) {
    Mob mob1 = new Mob(12, 15);
    System.out.println(mob1.x + ", " + mob1.y); // "12, 15"
    changeX(mob1, 7);
    System.out.println(mob1.x + ", " + mob1.y); // "Mob at ?, ?"
    replaceMob(mob1, 8, 9);
    System.out.println(mob1.x + ", " + mob1.y); // "Mob at ?, ?"
  }
}
```



== Auflösung von Variablen/Attributen

Wenn auf etwas mit dem Namen `varname` zugegriffen wird:
- Falls es Varialbe `varname` gibt, die verwenden
- Falls nein, schauen ob es Attribut `varname` gibt

```java
public class Mob {
    public int x;
    public int y;
    public Mob(int newx, int y) {
        x = newx;
        this.y = y; // shadowing - Variable y "überschattet" Attribut y
    }
}
```



== Methoden

```java
public class Mob {
    public int x;
    public int y;
//    [...]
    public void move(char dir) {
        if(dir == 'Q') {
            x -= 1;
            y -= 1;
        }        
    }
}
public class Main {
  public static void main(String[] args) {
    Mob mob1 = new Mob(12, 15);
    mob1.move('Q');
  }
}
```
- Deutlich einfachere Erweiterbarkeit als bei Arrays!



== Zugriff: Access modifiers

- public: Alle können lesen/schreiben
- private: Nur Objekt selber darf lesen/schreiben

```java
public class Mob {
    private int x;
    public int y;
    public String toString() { return "Mob at " + x + ", " + y; }
}
public class Main {
  public static void main(String[] args) {
    Mob mob1 = new Mob(12, 15);
    System.out.println(mob1);
    mob1.y = 12;
    System.out.println(mob1);
    mob1.x = 17; //Fehler!
  }
}
```



== Verwendung von Objekten

- Klassen sind "normale" Datentypen!
- Alles was mit primitiven Datentypen geht, geht auch mit Klassen

```java
public class Mob { /- [...] */ }

public class Main {
  public static void main(String[] args) {
    Mob[] mobs = new Mob {new Mob(12, 5), new Mob(7, 13) };
    for(int i=0; i<mobs.length; i++) {
        System.out.println("Before move: " + mobs[i]);
        mobs[i].move('Q');
        System.out.println("After move: " + mobs[i]);
    }
  }
}
```

== Live-Beispiel: Rezeptverwaltung

- Idee: Liste von Rezepten. Jedes Rezept hat:
    - Name
    - Kochzeit
    - Liste an Zutaten
- Jede Zutat (bspw. "395g Mehl" -> parsen über `toCharArray()`) hat:
    - Name
    - Menge
    - Einheit
- Modellierung mit Arrays? Oder lieber doch Klassen?



#section-slide("Exceptions")

#slide(title: "Die Idee")[
- Bisheriges Umgehen mit Fehlern:
    - Alle Fehlerquellen abfangen
    - Ungültigen Wert zurückgeben
- Aber das geht nicht immer
    - Oft zu viele mögliche Gründe für Fehler, um alle zu vermeiden
    - Es können alle Rückgabewerte sinnvoll sein
- Alternative: Neuer Informationskanal zusätzlich zu return

]

#slide(title: "Die Umsetzung")[
- Bei Auftreten eines Fehlers kann eine Exception geworfen werden:

  #sourcecode[```java
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
  ```]

]

#slide(title: "Regeln")[
- Wenn eine Methode eine Exception werfen kann, muss sie das mit `throws` in der Signatur ankündigen
- Wird eine Exception von einer Methode `a` geworfen, dann:
    - Ist das automatisch wie ein return an dieser Stelle
    - Wird die Exception an der Stelle, wo `a` aufgerufen wurde, sofort wieder geworfen
    - Die Kette wird erst durch ein passendes `catch` unterbrochen
- Alle Exceptions außer `RuntimeExceptions` wie `ArrayIndexOutOfBounds` müssen zwingend per `catch` gefangen werden, bevor sie aus der main-Methode fliegen können

]

#slide(title: "Live-Beispiel")[
- Generell überall sinnvoll, wo Fehler auftreten können (-> Algorithmus kann kein sinnvolles Ergebnis liefern)
- Eigene Ideen? 
- Sonst: Fibonacci-Folge berechnen, Exception bei:
  - Integer overflow
  - Negativer Eingabe

]

#section-slide("Dateien")

#slide(title: "Allgemeines")[
- Spezilalisierte Klassen für Dateioperationen:
    - Datei selber: `File`
    - Lesen: `FileReader` + `BufferedReader`
    - Schreiben: `FileWriter` + `BufferedWriter`
    - Werfen bei Fehlern (Datei existiert nicht, keine Berechtigung, Festplatte voll...) `IOException`
- Idee: `File` beschreibt Datei, `Reader`/`Writer` macht low-Level-Zugriff, `BufferedReader`/`BufferedWriter` bietet Komfort-Funktionen (z.B. zeilenweises Lesen)

]

#slide(title: "Code und Live-Beispiel")[
  #sourcecode[```java
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
  ```]

  Wie könnte man damit die Wörter in einer Datei zählen?

]

#section-slide("Nützliche Dinge")

#slide(title: "StringBuilder")[
- String hält intern ein `char[]`
    - immutable!
    - Scheinbare Veränderung = Inhalt kopieren + neuer String
- Effizienter Aufbau: `StringBuilder`
    - Erlaubt Hinzufügen von Textteilen
    - Werden am Ende mit `toString()` zusammengefügt
    - -> nur 1 Kopiervorgang

]

#slide(title: "StringBuilder")[
  #sourcecode[```java
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
  ```]

]

#slide(title: "Static-Attribute")[
Wichtig bei Attributen: Jedes Objekt hat eine eigene Kopie!

- Sinnvoll bei Eigenschaften des Objekts (ISBN des Buches)
- Aber schwierig, wenn Eigenschaft gemeinsam sein soll

Lösung: Statische Attribute:

- Markierung mittels `static`
- Alle Objekte haben gemeinsamen Wert!

]

#slide(title: "Static-Attribute")[
  #sourcecode[```java
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
  ```]

]

#slide(title: "Static-Methoden")[
- Methoden, die keinen Zugriff auf Attribute außer `static` brauchen
- Typisch:
    - Utility-Methoden, die logisch in die Klasse gehören
    - Ganze Utility-Klassen
    - Getter für statische Attribute

  #sourcecode[```java
public Class Book {
    private static int numBooks = 0;
    //...
    public static int getNumBooks() { return numBooks; } // kann static sein
}
  ```]

]

#slide(title: "Live-Beispiele für static")[
- Book - was passiert mit und ohne static?
- static als Fehlerquelle - PatientList.calculateMeanAge() mit Patient.age als static
- Singleton zum Verwalten von Einstellungen
- DateUtilities.getDay("12.07.2022") - ähnliche Logik wie Integer.parseInt("12")

]

