---
marp: true
theme: HTW
paginate: true
footer: Prof. Dr.-Ing. P. W. Dabrowski - Programmierung 1 - HTW Berlin

---

## Komplexe Daten mit Arrays

* Mehrdimensionales Array: Wie Tabelle
* Beispiel: Mob in Spiel

| x | y | hp | type |
|---|---|----|---|
| 9 | 2 | 15 | G |
| 7 | 5 |  3 | V |

```java
int[] xpos = new int[]{9, 7};
int[] ypos = new int[]{2, 5};
int[] hp = new int[]{15, 3};
char[] type = new char[]{'G', 'V'};
```

---

## Komplexe Daten mit Arrays - Verwendung

* Wenn etwas getan werden soll, notwendige Arrays übergeben
* Zusammenhang über Index (wie in Übung/Hausaufgabe)

```java
public static void moveMob(int num, int[] x, int[] y, char dir) {
    if(dir=='Q') {
      x[num] -=1;
      y[num] -= 1;
    }
}

int[] xpos = new int[]{9, 7};
int[] ypos = new int[]{2, 5};
int[] hp = new int[]{15, 3};
```

---

## Komplexe Daten mit Arrays - Verwendung 2

```java
public static void moveMob(int num, int[] x, int[] y, int[] hp, char[] type, char dir) {
    if(dir=='Q') {
      x[num] -=1;
      y[num] -= 1;
    }
    if(type[num] == 'G') {
        hp[num] -= 1;
    }
}

int[] xpos = new int[]{9, 7};
int[] ypos = new int[]{2, 5};
int[] hp = new int[]{15, 3};
char[] type = new char[]{'G', 'O'}; // G=Gelatinous Cube
```
-> Je mehr Daten zusammenhängen, um so schwieriger

---

## Lösung: Objekte

* Dinge, die konzeptionell zusammengehören verbinden
* Gemeinsame Speicherung (Heap! Wie Array mit mehr Datentypen)

```java
public class Mob {
    public int x;
    public int y;
    public int hp;
    public char type;
}
Mob mob1 = new Mob();
mob1.x = 9;
mob1.y = 2;
mob1.hp = 15;
mob1.type = 'G';
```

---

## Objekt initialisieren: Constructor

```java
public class Mob {
    public int x;
    public int y;
    public Mob(int newx, int newy) {
        x = newx;
        y = newy;
    }
}
Mob mob1 = new Mob(9, 2);
Mob mob2 = new Mob(7, 5);
```

* x: Attribut, newx: Variable
* Mob(): Constructor + Methode
* Mob: Klasse, mob1+mob2: Objekte

---

## Scoping

```java
public class Mob { /* [...] */ }

public void changeX(Mob mob, int diff) {
    mob.x += diff;
}
public void replaceMob(Mob mob, int x, int y) {
    mob = new Mob(x, y);
}
Mob mob1 = new Mob(12, 15);
System.out.println(mob1.x + ", " + mob1.y); // "12, 15"
changeX(mob1, 7);
System.out.println(mob1.x + ", " + mob1.y); // "Mob at ?, ?"
replaceMob(mob1, 8, 9);
System.out.println(mob1.x + ", " + mob1.y); // "Mob at ?, ?"
```

---

## Auflösung von Variablen/Attributen

Wenn auf etwas mit dem Namen `varname` zugegriffen wird:
* Falls es Varialbe `varname` gibt, die verwenden
* Falls nein, schauen ob es Attribut `varname` gibt

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

---

## Methoden

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
Mob mob1 = new Mob(12, 15);
mob1.move('Q');
```
* Deutlich einfachere Erweiterbarkeit als bei Arrays!

---

## Spezielle Methode: toString()

```java
public class Mob {
    public int x;
    public int y;

    public String toString() {
        return "Mob at " + x + ", " + y;
    }
}
Mob mob1 = new Mob(12, 15);
System.out.println(mob1);
```

Standard-`toString()`: Speicheradresse (wie bei Array)

---

## Live-Beispiel: Rezeptverwaltung

* Idee: Liste von Rezepten. Jedes Rezept hat:
    * Name
    * Kochzeit
    * Liste an Zutaten
* Jede Zutat hat:
    * Name
    * Menge
    * Einheit
* Modellierung mit Arrays? Oder lieber doch Klassen?

---

## Live-Beispiel: Rezeptverwaltung++

* Kalorienverwaltung hinzufügen?
* Idee: Zutat erweitern:
    * Menge
    * Zutaten-Typ:
        * Name
        * Einheit
        * kcal/1xMenge
        
-> Refactoring

---

## Zugriff: Access modifiers

* public: Alle können lesen/schreiben
* private: Nur Objekt selber darf lesen/schreiben

```java
public class Mob {
    private int x;
    public int y;
    public String toString() { return "Mob at " + x + ", " + y; }
}
Mob mob1 = new Mob(12, 15);
System.out.println(mob1);
mob1.y = 12;
System.out.println(mob1);
mob1.x = 17; //Fehler!
```

---

## Zugriff auf private: Getter, Setter

```java
public class Mob {
    private int x;
    // [...]
    public void setX(int newValue) {
        x = newValue;
    }
    public int getX() {
        return x;
    }
}
Mob mob1 = new Mob(12, 15);
System.out.println(mob1);
mob1.setX(50);
System.out.println(mob1);
```

---

## Setter: Einhaltung von Logik sicherstellen

```java
public class Mob {
    private int x;
    private int maxSpeed;
    // [...]
    public void setX(int newValue) {
        if(Math.abs(x-newValue) <= maxSpeed) {}
            x = newValue;
        }
    }
}
```

* Es muss nicht für jeden Wert einen setter geben!

---

## Verwendung von Objekten

* Klassen sind "normale" Datentypen!
* Alles was mit primitiven Datentypen geht, geht auch mit Klassen

```java
public class Mob { /* [...] */ }

Mob[] mobs = new Mob {new Mob(12, 5), new Mob(7, 13) };
for(int i=0; i<mobs.length; i++) {
    System.out.println("Before move: " + mobs[i]);
    mobs[i].move('Q');
    System.out.println("After move: " + mobs[i]);
}
```

---

## Besondere Klassen: String

* Speichert Text
* Bietet convenience-Funktionen wie `.toLowerCase()`
* Vorsicht, Objekt! `==` -> Adressvergleich, `.equals` für Inhalt!

```java
String text = "Te";
text += "xt";
System.out.println(text == "Text"); // false! Warum?
System.out.println(text.equals("Text")); // true
```

---

## Besondere Klassen: StringBuilder

* String hält intern ein `char[]`
    * immutable!
    * Scheinbare Veränderung = Inhalt kopieren + neuer String
* Effizienter Aufbau: `StringBuilder`
    * Erlaubt Hinzufügen von Textteilen
    * Werden am Ende mit `toString()` zusammengefügt
    * -> nur 1 Kopiervorgang

---

# Zeiteffekt von StringBuilder

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

---

## Besondere Klassen: LinkedList/ArrayList

* Nachteil von Arrays: Feste Länge
* Alternative: Dynamisch verwaltete Listen von Objekten (->typisiert)
* Hinzufügen (`.add(V value)`) und Entfernen (`.remove(int index)`)
* `LinkedList<V>`: Jedes Element enthält Adressen der Nachbarelemente
    * Hinzufügen/Entfernen sehr schnell
    * Random access langsam ("Durchhangeln" durch alle Elemente)
* `ArrayList<V>`: Intern Array, wächst bei Bedarf
    * Entfernen sehr langsam, Hinzufügen meist schnell (Reserve-Platz)
    * Random access sehr schnell (wie bei Array)

---

## LinkedList vs. ArrayList

* Theorie: LinkedList oder ArrayList je nach Verwendung
    * LinkedList wenn viel Veränderung und meist Iterieren ohne random access
    * ArrayList wenn wenig Veränderung und meist random access
* Praxis: ArrayList meist effizienter
    * Array-Verwaltung in modernen Architekturen hochoptimiert
    * Overhead durch Speicheradressen in LinkedList
* Aber: ArrayList braucht zusammenhängenden Speicher -> eventuell unvorhersagbares Verhalten bei hoher Speicherauslastung

---

## Besondere Klassen: HashMap

* Array und ArrayList/LinkedList: Nur Adressierung über Position
* Adressierung über Key-Wert: `HashMap<K, V>`, Zuordnung Key->Value
    * Intern Array von Values
    * Position im Array wird aus Hash des Keys berechnet
 
```java
HashMap<String, String> blumenFarben = new HashMap<>();
blumenFarben.put("Rose", "rot");
blumenFarben.put("Veilchen", "blau");
String keyValue = "Rose";
if(blumenFarben.containsKey(keyValue)) {
    System.out.println("Farbe von " + keyValue + blumenFarben.get(keyValue));
}
```
---


<!--
_class: lead
-->

# Exkurs: Evaluation

TL;DR: Bitte ausfüllen, vor allem für SL, damit es genug Antworten gibt

---


## Live-Beispiel: Refactoring Rezeptverwaltung

* `ZutatenListe`: `HashMap<String, ZutatenTyp>` statt neuer Variablen für jeden `ZutatenTyp`
* `Zutat`, `ZutatenTyp`: Alles `private`, mit gettern
* `Zutat`: `getKcal` (statt Berechnung in `Rezept`)
* `Rezept`: `LinkedList<Zutat>` statt `Zutat[]`
    * `Zutat[]` in Constructor optional (2 Constructoren)
    * `addZutat(Zutat)` zum Hinzufügen
    * `removeZutat(String name)` zum Entfernen