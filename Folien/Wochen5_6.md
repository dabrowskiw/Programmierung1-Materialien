---
marp: true
theme: HTW
paginate: true
footer: Prof. Dr.-Ing. P. W. Dabrowski - Programmierung 1 - HTW Berlin

---

# Nochmal Allgemeines

* Skript bitte *wirklich* lesen
    * Kein Vorlesen von allen Syntax-Feinheiten in der SL
    * Weder Skript, noch SL, noch UE alleine reichen
* Feedback: Zu schneller Schritt zu komplexeren Algorithmen
    * Heute nochmal: Herangehensweise beim Programmieren
    * Zusätzlich: Arrays (für nächste Woche), Quality of Life
* Aktuelle Corona-Situation und Ausblick

---

# Arrays

* Speichern mehrerer zusammehängender Werte oft nötig
    * Verlauf von einem Wert über die Zeit (Aktie, Infektionen, Ton...)
    * Liste von Werten (HP aller Gegner, Koordinaten von Städten...)
    * Mehrdimensionale Werte (Pixel eines Bildes, )
* Es kann Arrays von jedem Datentyp geben (auch von Arrays)
* Die Länge eines Arrays ist *fest* (was würde sonst im RAM passieren?)

```java
int[] intArray = new int[5];
char[][] charMatrix = new char[7][3];
charMatrix[5][2] = (char)intArray[0]; //Zugriff auf Werte im Array über Index
```

---

# Arrays im Speicher

```java
int[] vals = {1, 6, 5, 3};
```

| Adresse | Wert | Kommentar | Adresse | Wert | Kommentar |
|---|---|---|---|---|---| 
| ... | ... | Andere Variablen|  76 | 5 | 3. Wert |
| 73 | 4 | Länge (header) | 77 | 3 | Letzter Wert| 
| 74 | 1 | 1. Wert | ... | ... | Andere Variablen| 
| 75 | 6 | 2. Wert | ... | ... | Andere Variablen|

---

# Recap: Stack

```java
public static void doSomething(int value) {
    value = 2;
}
public static void main(String[] args) {
    int value = 3;
    doSomething(value);
    System.out.println(value); // Was steht hier?
}
```

---

# Speicher: Heap und Stack

...Aber passt das alles auf den Stack?

```java
public static void doSomething(int[] values) {
    for(int i=0; i<values.length; i++) {
        System.out.println(values[i]);
    }
}
public static void main(String[] args) {   
    int[] lotsaValues = new int[10000];
    doSomething(lotsaValues);
}
```

Das wäre viel zu kopieren! -> Heap

---

# Speicher: Folgen von Heap und Stack

Was ist jetzt mit Scoping?

```java
public static void doSomethingElse(int[] values) {
    values[0] = 5;
}
public static void main(String[] args) {
    int[] vals = new int[] {0, 1, 2, 3};
    System.out.println(vals[0]); // Was steht hier?
    doSomethingElse(vals);
    System.out.println(vals[0]); // Was steht hier?
}
```

---

# Speicher: Folgen von Heap und Stack

```java
public static void doSomethingElse(int[] values) {
    values = new int[2];
    values[0] = 5;
}
public static void main(String[] args) {
    int[] vals = new int[] {0, 1, 2, 3};
    System.out.println(vals[0]); // Was steht hier?
    doSomethingElse(vals);
    System.out.println(vals[0]); // Was steht hier?
}
```

Der Scope gilt aber immer noch - aber nur für die Adresse! -> Immer beachten, was übergeben wird!

---

# Quality of Life: break

```java
public static void showFirstUneven(int from, int to, int howMany) {
    int shown = 0;
    for(int i=from; i<to; i++) {
        if(shown < howMany) {
            if(i % 2 == 1) {
                System.out.println(i);
                shown += 1;
            }
        }
    }
}
```
... ein wenig umständlich

---

# Quality of Life: break

Häufige Strategie: `while(true)`, `break`.
```java
public static void showFirstUneven(int from, int to, int howMany) {
    int shown = 0;
    while(true) {
        if(i % 2 == 1) {
            System.out.println(i);
            shown += 1;
        }
        if(shown >= howMany) {
            break;
        }
    }
}
```

---

# Quality of Life: continue

```java
public static void showSpecialCodes(char from, char to) {
    for(char toShow = from; toShow <= to; toShow++) {
        if(!(toShow >= 'a' && toShow <= 'z')) {
            if(!(toShow >= 'A' && toShow <= 'Z')) {
                System.out.println((int)toShow);
            }
        }
    }
}
```

Wird um so umständlicher, je mehr Bedingungen dazukommen.

---

# Quality of Life: continue

```java
public static void showSpecialCodes(char from, char to) {
    for(char toShow = from; toShow <= to; toShow++) {
        if(toShow >= 'a' && toShow <= 'z') {
            continue;
        }
        if(toShow >= 'A' && toShow <= 'Z') {
            continue;
        }
        System.out.println((int)toShow);
    }
}
```

---

# Quality of Life: if - else if - else

```java
public static void showSmallestDivisor(int from, int to, int d1, int d2, int d3) {
    for(int i=from; i<=to; i++) {
        if(i % d1 == 0) {
            System.out.println(i + ": " + d1);
        }
        if((i % d1 != 0) && (i % d2 == 0)) {
            System.out.println(i + ": " + d2);
        }
        if((i % d1 != 0) && (i % d2 != 0) && (i % d3 == 0)) {
            System.out.println(i + ": " + d3);
        }
        if((i % d1 != 0) && (i % d2 != 0) && (i % d3 != 0)) {
            System.out.println("No divisor found.");
        }
    }
}
```

---

# Quality of Life: if - else if - else

```java
public static void showSmallestDivisor(int from, int to, int d1, int d2, int d3) {
    for(int i=from; i<=to; i++) {
        if(i % d1 == 0) {
            System.out.println(i + ": " + d1);
        }
        else if(i % d2 == 0) {
            System.out.println(i + ": " + d2);
        }
        else if(i % d3 == 0) {
            System.out.println(i + ": " + d3);
        }
        else {
            System.out.println("No divisor found.");
        }
    }
}
```

---

# Herangehensweise zum Programmieren

`public static void showPrimes(int from, int to)`: Alle Primzahlen zwischen `from` und `to` ausgeben
* Scheinbar große Aufgabe -> erst unterteilen
    * Was ist der kleinste mögliche Schritt?
    * Implementieren, ausprobieren
    * Wiederholen, bis fertig
* Gemeinsam ausprobieren!

---

# Üben der Herangehensweise

`public static int getStepsUntil1(int start, int maxSteps, int adder)`
* Rekursiv definierte Reihe
* Nächstes Glied `X(n+1)` ist:
    * Wenn `X(n)` durch 3 Teilbar, dann `X(n)/3`
    * Sonst: `X(n)+adder`
* Funktion gibt zurück:
    * Anzahl der Schritte, bis ein Glied 1 ist
    * Falls diese Anzahl größer `maxsteps` ist, `-1`