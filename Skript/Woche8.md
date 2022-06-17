# Getter und Setter

Der in der vorigen Woche verwendeten Überlegung, dass `calculateBMI` nur von der Patient-Klasse selber genutzt werden muss, liegt die Annahme zugrunde, dass sich das Gewicht von Patienten niemals ändert. Sollte dies nicht der Fall sein, müsste der BMI bei einer Änderung des Gewichts neu berechnet werden. In diesem Fall könnte `calculateBMI` public gemacht werden, und man müsste im Programm jedes Mal, wenn man das Gewicht verändert, auch den BMI neu berechnen. Allerdings treten solche Abhängigkeiten sehr häufig auf, und man kann sich nicht alle davon merken. Entsprechend würde eine solche Herangehensweise schnell zu Fehlern aufgrund von Inkonsistenzen führen, die entstehen, wenn man vergisst, nach einer Änderung eines Attributs alle nötigen Neuberechnungen auf dem Objekt durchzuführen.

Um das zu vermeiden, sollten alle Attribute in einer Klasse private sein - so wird vermieden, dass sie geändert werden, ohne eventuelle Abhängigkeiten zu beachten. Stattdessen wird der Zugriff über getter- und setter-Methoden geregelt: Methoden, deren Namen jeweils mit get oder set beginnen und mit dem Namen eines Attributs enden (z.B. `getWeight` und `setWeight` für das Gewicht). Die getter-Methode gibt dabei einfach nur den Wert des Attributs zurück, die setter-Methode setzt das Attribut auf den ihr übergebenen neuen Wert - und führt bei Bedarf eventuelle Neuberechnungen durch, um sicherzustellen, dass alle Werte in dem Objekt immer konsistent bleiben.

Ein Beispiel für nötigen Veränderungen in der Klasse `Patient`, um `weight` über getter und setter zu Verwalten, ist hier zu sehen:

```java
public class Patient {
//...
  private double weight = 70.0;
//...
  public void setWeight(double weight) {
    this.weight = weight;
    calculateBMI();
  }
  
  public double getWeight() {
    return weight;
  }
}

public class Loesung {
  public static void main(String[] args) {
    Patient p = new Patient(0, 25, 80, 180, "Andreas");
    p.setWeight(85.3);
    p.printData();
  }
}

```

Die für die Verwendung von gettern und settern nötige lästige Tipparbeit kann von IDEs übernommen werden. Beispielsweise kann in Eclipse über "Source->Generate Getters and Setters..." für jedes Attribut der Klasse ausgewählt werden, ob jeweils ein getter und/oder ein setter generiert werden soll, und der Code für die entsprechenden Methoden wird automatisch in die Klasse eingefügt (natürlich nur für das reine Zurückgeben oder Setzen der Attributwerte - eventuell notwendige Neuberechnungen anderer Attribute muss man selber dazuschreiben).

## Häufig verwendete Klassen

Einige Klassen werden besonders häufig verwendet, entsprechend lohnt es sich, deren Funktionalität etwas genauer zu betrachten. Grundsätzlich ist die Funktionalität jeder Standard-Java-Klasse in der [JavaDoc](https://docs.oracle.com/javase/10/docs/api/overview-summary.html) nachzulesen. 

### String

Hier sehen wir uns zunächst genauer die [String-Klasse](https://docs.oracle.com/javase/10/docs/api/java/lang/String.html) an. Diese hält Zeichenketten, also Texte, vor. Einige praktische Funktionenalitäten sind dabei:

* Doppelte Hochkommata werden als String-Constructor verstanden - man muss nicht immer explizit den String-Constructor aufrufen sondern kann z.B. direkt schreiben: `String text = "Das ist der Inhalt";`
* Mit dem Constructor `String(char[] letters)` kann auch einem Array von charactern direkt ein String erstellt werden, und mit der Methode `toCharArray()` kann wieder das Array von char mit den einzelnen Buchstaben des String zurückgegeben werden.
* Mittels `charAt(int index)` kann das Zeichen an der angegebenen Position des Strings als char geholt werden.
* `split(String regex)` sucht nach Vorkommen der übergebenen regular expression in dem String, schneidet an jeder übereinstimmenden Stelle den String auf, und gibt ihn als Array von Strings zurück. Ein Beispiel ist:

```java
public static void printWords(String text) {
  String[] words = text.split(" "); // text nach Leerzeichen aufteilen
  for(int num = 0; num < words.length; num++) {
    System.out.println("Wort " + num + ": " + words[num]);
  }
}
```

### ArrayList und LinkedList

Zwei weitere sehr häufig verwendete Klassen sind LinkedList und ArrayList. Diese bieten ähnliche Funktionalität wie Arrays, aber mit einigen deutlichen Erleichterungen in der Verwendung. Insbesondere muss bei diesen beiden Klassen nicht angegeben werden, wie lang die Liste sein soll - die Listen können bei Bedarf erweitert oder gekürzt werden. Die Verwendung einer ArrayList und einer LinkedList ist beispielhaft hier gezeigt:

```java
import java.util.ArrayList;
import java.util.LinkedList;

public class Loesung {	
  public static void main(String[] args) {
    ArrayList<Integer> intlist = new ArrayList<Integer>();
    intlist.add(2);
    intlist.add(7);
    LinkedList<Integer> secondlist = new LinkedList<Integer>();
    secondlist.add(32);
    secondlist.addAll(intlist);
    for(Integer value : secondlist) {
      System.out.println(value);
    }
    secondlist.removeLast();
    for(int i=0; i<secondlist.size(); i++) {
      int value = secondlist.get(i);
      System.out.println(value);
    }
  }
}
```

In diesem Code sind einige Besonderheiten zu sehen. Zunächst stehen in Zeilen 1 und 2 import-statements. Diese instruieren den Compiler, die angegebenen Java-Module zu importieren und den Code daraus mit in dem aktuellen Programm zu verwenden. Hintergrund ist, dass Java eine riesige Menge an Funktionalität besitzt, von der in den meisten Programmen nur ein Bruchteil benötigt wird. Entsprechend braucht ein Großteil der Java-Funktionalität in den meisten Programmen nicht eingebaut werden. Wird doch spezielle Funktionalität benötigt, so muss deren Verwendung explizit über import-statements (wie in diesem Fall die Verwendung der Klassen ArrayList und LinkedList) angefordert werden.

Zudem ist in Zeilen 6 und 9 jeweils ein `<Integer>` hinter  `ArrayList` bzw. `LinkedList` zu sehen. Das liegt daran, dass es sich bei ArrayList und LinkedList um generische Klassen (wie man solche Klassen entwickelt, lernen Sie im nächsten Semester) handelt - sie sind auf eine Art programmiert, die es ihnen erlaubt, theoretisch Objekte beliebiger Klassen zu halten. Erst bei der Instanziierung muss konkretisiert werden, was für Objekte in dieser konkreten Instanz verwaltet werden sollen. Das `<Integer>` ist genau diese Angabe - es gibt an, dass diese beiden Listen Objekte der Klasse `Integer` enthalten werden, stattdessen kann hier auch jede andere Klasse verwendet werden. In der Dokumentation von generischen Datentypen wird an dieser Stelle `<T>` geschrieben, um zu beschreiben, wenn es sich um ein Objekt des bei Instanziierung zu konkretisierenden Typs handelt.

Eine letzte Auffälligkeit ist, dass die Listen zwar `Integer` enthalten sollen, aber in Zeilen 7, 8 und 9 einfach Zahlenwerte (also z.B. `2` statt `new Integer(2)`) den Listen hinzugefügt werden und in Zeile 17 aus der Liste ein `int` statt eines `Integer` entnommen wird. Das liegt daran, dass aus technischen Gründen Listen keine primitiven Datentypen enthalten können, sondern nur Objekte. `Integer` ist dabei eine Klasse, deren Hauptaufgabe es ist, den Wert eines int zu speichern - es ist der sogenannte `Boxed type` (auf Englisch soviel wie `verpackter Typ`) zum primitiven Datentyp `int`. Zu jedem primitiven Datentyp gibt es einen solchen boxed type, immer jeweils groß und ausgeschrieben (z.B. `Double` für `double`, `Character` für `char` etc.). Das Erstellen eines neuen boxed-Objektes für Wert in einem primitiven Datentyp wird als `Boxing`, der umgekehrte Prozess als `Unboxing` bezeichnet und wird bei Bedarf automatisch von Java durchgeführt. In Zeilen 7, 8 und 9 sehen Sie also automatisches Boxing (für die Werte 2, 7 und 32 werden automatisch neue Integer-Objekte mit diesen Werten erstellt), in Zeile 17 automatisches Unboxing (`secondlist.get(i)` gibt einen Integer zurück, die Zuweisung des Wertes, der eigentlich über `.getValue()` geholt werden müsste, an den `int value` geschieht automatisch).

Einige nützliche Methoden von ArrayList und LinkedList sind:

* `size()`: Gibt die Anzahl der Elemente in der Liste zurück
* `add(<T> value)` Hinten in der Liste den Wert value hinzufügen.
* `addFirst(<T> value)` Vorne in der Liste den Wert value hinzufügen.
* `addAll(List<T> list)` Fügt alle Elemente der Liste list hinten in die aktuelle Liste ein
* `removeLast()` Letzten Wert aus der Liste entfernen
* `removeFirst()` Ersten Wert aus der Liste entfernen
* `getFirst()` Gibt das erste Element aus der Liste zurück
* `getLast()` Gibt das letzte Element aus der Liste zurück
* `get(int index)` Gibt das Element an der Position `index` aus der Liste zurück
* `contains(<T> element)` Gibt `true` zurück, wenn das Element in der Liste vorhanden ist, sonst `false`

Der Unterschied zwischen ArrayList und LinkedList ist die interne Datenhaltung. Implementationsdetails lernen Sie in den kommenden Semestern kennen, als grobe Orientierungshilfe für die Verwendung kann aber dienen: In ArrayLists ist die Operation `get(int index)` besonders schnell (während sie in einer LinkedList mit steigendem index immer langsamer wird), in LinkedLists ist das Hinzufügen von Elementen besonders schnell.

Aufgrund der höheren Bequemlichkeit der Verwendung werden LinkedList und ArrayList in Java-Programmen viel häufiger verwendet, als einfache Arrays.
