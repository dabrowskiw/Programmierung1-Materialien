#import "header.typ": *


#show: htwslides

#title-slide(
  title: "Programmierung 1",
  subtitle: "Wochen 9-10: Objektorientierte Programmierung",
  institution-name: "HTW Berlin"
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


== Lösung: Objektorientierte Programmierung

- Computer-Sicht: Lauter Werte
- Menschen-Sicht: Repräsentation von Dingen der realen Welt
- Idee der objektorientierten Programmierung:
  - Zusammenfassen logisch zusammengehöriger Daten zu Objekten
  - Bildet das menschliche Denken ab
  - Repräsentiert Dinge der realen Welt im Computer

== Klassen

Primitive Datentypen:
- Repräsentieren grundlegende Konzepte: `int`, `char`, `float` etc.
- Definieren, wie Bits interpretiert werden
- Definieren, wie viele Bytes zusammengehören

Klassen:
- Repräsentieren komplexe Dinge der echten Welt
- Definieren dafür eigenen, zusammengesetzten Datentyp:
  - Wie viele welcher anderer Datentypen beschreiben das Ding?
  - Wie viel Speicher wird dafür benötigt?
- Definieren, was das Ding kann: Kapselung der Logik

== Beispiel-Klasse: Mob

#grid(
  columns: (1.5fr, 3fr),
  gutter: 1em,
  [
    - Attribute: Variablen, die Eigenschaften beschreiben
    - Methoden: Funktionen, die Fähigkeiten beschreiben
  ],[
    #codly(
      annotations: (
        (
          start: 2, end: 5,
          content: block(
            width: 2em,
            rotate(-90deg, reflow: true,
              align(center)[Attribute]
            )
          )
        ),
        (
          start: 8, end: 22,
          content: block(
            width: 2em,
            rotate(-90deg, reflow: true,
              align(center)[Methoden]
            )
          )
        ),
      ),
    )
    ```java
    public class Mob {
      public int x;
      public int y;
      public int hp;
      public char type;


      public void sayHello() {
        System.out.print("Grr, I am a ");
        if(type == 'G') {
          System.out.print("gelatinous cube ");
        } else if(type == 'V') {
          System.out.print("vampire ");
        }
        System.out.print("and I will eat you!");
      }

      public void showHealth() {
        for(int i=0; i<hp; i++) {
          System.out.print("♥");
        }
      }
    }
    ```
  ]
)

== Randnotiz: Wrapper-Klassen

#grid(
  columns: (2.5fr, 3fr),
  gutter: 1em,
  [
    Bisher:
    - Keine Attribute
    - Alle Methoden `static`

    #sym.arrow Wrapper-Klasse
    - Beschreibt kein reales "Ding"
    - Platz für Methoden, die sonst nirgendwo hingehören

  ],[
    ```java
    public class Main {
      public static void main(String[] args) {
        System.out.println("Hallo!");
        System.out.println(getMax(2, 7));
      }

      public static int getMax(int a, int b) {
        if(a > b) {
          return a;
        }
        return b;
      }
    }
    ```
  ]
)

`static`: 
- Methode: Benötigt keinen Zugriff auf nicht-`static`-Attribute
- Attribut: Benötigt kein Objekt (später)

== Objekte

- Klasse: 
  - Beschreibt, was für Eigenschaften etwas hat ("Auto hat Farbe")
  - Eine Klasse im ganzen Programm (Konzept von "Auto")
  - Wie ein Datentyp: `int`, `float` etc.
- Objekt: 
  - Beschreibt eine konkrete Ausprägung ("Dieses Auto ist grün")
  - Beliebig viele Objekte (konkrete Autos)
  - Wie konkrete Variablen: `x` und `y` in `int x=5; int y=6;`
  - Vokabular: Objekt ist *Instanz* einer Klasse

Vergleich: Platons Ideenlehre
- Ideen: Abstrakte, perfekte, unveränderliche Urbilder ("Stuhl", "Haus")
- Gegenstände: Vergängliche, veränderliche Abbilder in der realen Welt

== Objektbeispiel

#grid(
  columns: (2.5fr, 3fr),
  gutter: 1em,
  [
    ```java
    public class Main {
      public static void main(
              String[] args) {
        Mob mob1 = new Mob();
        mob1.hp = 2;
        mob1.type = 'G';
        Mob mob2 = new Mob();
        mob1.hp = 10;
        mob1.type = 'V';
        mob1.sayHello();
        mob1.showHealth();
        mob2.sayHello();
        mob2.showHealth();
      }
    }```

    `Mob`: Klasse keine Werte (`hp`, `type`)
    
    `mob1`, `mob2`: Objekte mit Werten 
  ],[
    ```java
    public class Mob {
      public int x;
      public int y;
      public int hp;
      public char type;

      public void sayHello() {
        System.out.print("Grr, I am a ");
        if(type == 'G') {
          System.out.print("cube ");
        } else if(type == 'V') {
          System.out.print("vampire ");
        }
        System.out.print(", I will eat you!");
      }

      public void showHealth() {
        for(int i=0; i<hp; i++) {
          System.out.print("♥");
        }
      }
    }
    ```
  ]
)

== Spezielle Methode: Constructor

#grid(
  columns: (2fr, 3fr),
  gutter: 1em,
  [
    Constructor: Methode zum Initialisieren eines Objekts
    - Kein return-Datentyp
    - Name = Klassenname
    - Beliebige Argumente

    Hier:
    - `newhp`, `newtype`: Variablen
    - `hp`, `type`: Attribute
  ],[
    ```java
    public class Mob {
      public int hp;
      public char type;

      public Mob(int newhp, char newtype) {
        hp = newhp;
        type = newtype;
      }
    }

    public class Main {
      public static void main(String[] args) {
        Mob mob1 = new Mob(5, 'G');
        Mob mob2 = new Mob(10, 'V');
        mob1.sayHello();
        mob1.showHealth();
        mob2.sayHello();
        mob2.showHealth();
      }
    }
    ```
  ]
)

== Methoden-Beispiel

#grid(
  columns: (3fr, 3fr),
  gutter: 1em,
  [
    #codly(highlighted-lines: (17,))
    ```java
    public static void moveMob(
      int num, int[] x, int[] y, int[] hp, char[] type, char dir) {
        if(dir=='Q') {
          x[num] -=1;
          y[num] -= 1;
        }
        if(type[num] == 'G') {
            hp[num] -= 1;
        }
    }
    public class Main {
      public static void main(String[] a) {
        int[] xpos = new int[]{9, 7};
        int[] ypos = new int[]{2, 5};
        int[] hp = new int[]{5, 10};
        char[] t = new char[]{'G', 'V'}; 
        moveMob(0, xpos, ypos, hp, t, 'Q');
      }
    }
    ```
  ],[
    #codly(highlighted-lines: (20,))
    ```java
    public class Mob {
      public int x, y, hp;
      public char type;
      public Mob(int x,int y,char t,int h) 
      { /*...*/ }
      public void move(char dir) {
        if(dir == 'Q') {
          x -= 1;
          y -= 1;
        }
        if(type == 'G') {
          hp -= 1;
        }
      }
    }
    public class Main {
      public static void main(String[] a) {
        Mob mob1 = new Mob(9, 2, 'G', 5);
        Mob mob2 = new Mob(7, 5, 'V', 10);
        mob1.move('Q');
      }
    }
    ```
  ]
)


== Scoping

Was sagt uns das `new` über Heap und Stack?

```java
public class Mob { /* [...] */ }

public class Main {
  public void changeHP(Mob mob, int diff) {
      mob.hp += diff;
  }
  public void replaceMob(Mob mob, int hp, char type) {
      mob = new Mob(hp, type);
  }
  public static void main(String[] args) {
    Mob mob1 = new Mob(5, 'G');
    System.out.println(mob1.hp); // ?
    changeX(mob1, 7);
    System.out.println(mob1.hp); // ?
    replaceMob(mob1, 10, 'V');
    System.out.println(mob1.hp); // ?
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

== Best practice: Getter, Setter

#grid(
  columns: (3fr, 3fr),
  gutter: 1em,
  [
    - Attribute sollten immer `private` (oder `protected`) sein
    - Zugriffe: Getter, Setter
      - Abfrage: `getAttributname()`
      - Veränderung: `setAttributename()`
      - Intern auch verwenden!
    - Vorteile:
      - Datenkonsistenz
      - Zentrale Logik
  ],[
    ```java
    public class Square {
      private float sidelength;
      private float area;
      public Square(float l) {
        setSidelength(l);
      }
      public void setSidelength(float l) {
        sidelength = l;
        area = l*l;
      }
      public float getSidelength() {
        return sidelength;
      }
      public float getArea() {
        return area;
      }
    }
    ```
  ]
)
    - Warum kein `setArea()`?
    - Warum nicht `sidelength=l` im Constructor?


== Verwendung von Objekten

- Klassen sind "normale" Datentypen!
- Alles was mit primitiven Datentypen geht, geht auch mit Klassen

```java
public class Mob { /* [...] */ }

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

== Vergleiche von Objekten



#grid(
  columns: (3fr, 3fr),
  gutter: 1em,
  [
    #only(1)[
      ```java
      public class Main {
        public static void main(String[] a) {
          String s1 = "Hello!"; 
          String s2 = "Hello";
          if(s1 == s2) {
            System.out.println(s1+"="+s2);
          } else {
            System.out.println(s1+"!="+s2);
          }
          s2 = s2 + "!";
          if(s1 == s2) {
            System.out.println(s1+"="+s2);
          } else {
            System.out.println(s1+"!="+s2);
          }
        }
      }
      ```
      Welche Ausgaben?
    ]
    #only(2)[
      #codly(highlighted-lines: (3, 4))
      ```java
      public class Main {
        public static void main(String[] a) {
          String s1 = new String("Hello!"); 
          String s2 = new String("Hello");
          if(s1 == s2) {
            System.out.println(s1+"="+s2);
          } else {
            System.out.println(s1+"!="+s2);
          }
          s2 = s2 + "!";
          if(s1 == s2) {
            System.out.println(s1+"="+s2);
          } else {
            System.out.println(s1+"!="+s2);
          }
        }
      }
      ```
      Welche Ausgaben?
       \ Erinnerung: Was macht `new`?
     ]
    #only(3)[
      #codly(highlighted-lines: (5, 11))
      ```java
      public class Main {
        public static void main(String[] a) {
          String s1 = new String("Hello!"); 
          String s2 = new String("Hello");
          if(s1.equals(s2)) {
            System.out.println(s1+"="+s2);
          } else {
            System.out.println(s1+"!="+s2);
          }
          s2 = s2 + "!";
          if(s1.equals(s2)) {
            System.out.println(s1+"="+s2);
          } else {
            System.out.println(s1+"!="+s2);
          }
        }
      }
      ```
    ]
  ],[
    #only(2)[
      ```java
      public class Point {
        private int x;
        private int y;
        public Point(int x, int y) {
          setX(x);
          setY(y);
        }
        public void setX(int x) {
          this.x = x;
        }
      }
      public class Main {
        public static void main(String[] a) {
          Point p1 = new Point(2, 3);
          Point p2 = new Point(3, 3);
          // p1==p2?
          p1.setX(3);
          // p1==p2?
        }
      }
      ```
    ]
    #only(3)[
      #codly(highlighted-lines: (3, 4, 5, 6, 7, 8, 9, 15, 17))
      ```java
      public class Point {
        //...
        public boolean equals(Object o) {
          Point p2 = (Point)o;
          if(p2.getX() == get() &&
             p2.getY() == getY())
             return true;
          return false;
        }
      }
      public class Main {
        public static void main(String[] a) {
          Point p1 = new Point(2, 3);
          Point p2 = new Point(3, 3);
          // p1==p2? p2.equals(p2)?
          p2.setX(3);
          // p1==p2? p2.equals(p2)?
        }
      }
      ```
    ]
  ]
)

== ArrayList, LinkedList

#grid(
  columns: (3fr, 3fr),
  gutter: 1em,
  [
  Nützliche Klassen: Listen!
- Verwendung wie Arrays, aber dynamische Länge
- Können nur Objekte verwalten, keine primitiven Datentypen
  - Wrapper-Klassen
  - Automatische Umwandlung
- Unterschiede:
  - Speicherverwaltung
  - Effizienz von:
    - `add()` `pop()`, `remove()`
    - `get()`

],
  [
    #codly(highlights: (
      (line: 1, start: 1, end: none),
      (line: 5, start: 16, end: 22)
    ))
    ```java
    import java.util.LinkedList;

    public class Main {
      static void main() {
        LinkedList<Integer> vals 
                    = new LinkedList<>();
        vals.add(5);
        vals.add(7);
        System.out.println(
            "# values: " + vals.size());
        for(int val : vals) {
          System.out.println(val);
        }
        System.out.println(vals.get(1));
      }
    }
    ```
    - Identisch für `ArrayList`
    - Vorsicht: Import!
  ]
)

