---
marp: true
theme: default
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

## Live-Beispiel: Rezeptverwaltung

* Idee: Liste von Rezepten. Jedes Rezept hat:
    * Name
    * Kochzeit
    * Liste an Zutaten
* Jede Zutat (bspw. "395g Mehl" -> parsen über `toCharArray()`) hat:
    * Name
    * Menge
    * Einheit
* Modellierung mit Arrays? Oder lieber doch Klassen?

---

<!--
_class: lead
-->

# Exkurs: Evaluation

TL;DR: Bitte ausfüllen, vor allem für SL, damit es genug Antworten gibt

