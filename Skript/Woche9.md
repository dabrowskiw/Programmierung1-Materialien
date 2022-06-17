## Statische Attribute und Methoden

Nicht alle Informationen, die in einer Klasse gehalten werden, sind für jedes Objekt spezifisch - manchmal müssen Informationen über alle Objekte einer Klasse hinweg identisch sein oder sie gehören zwar konzeptionell zu einer Klasse, sind aber nicht von einer konkreten Ausprägung abhängig. Solche Attribute und Methoden können als `static` markiert werden. Für statische Attribute wird direkt bei Programmstart gesondert Speicher reserviert und sie können unabhängig von Objekten mit der Syntax `Klassenname.Attributname` (statt `Objektname.Attributname`) verwendet werden. Genauso können statische Methoden über `Klassenname.Methodenname()` aufgerufen werden. Da eine statische Methode auf diese Art aufgerufen werden kann, ohne, dass eine Beziehung zu einem konkreten Objekt besteht, kann innerhalb von statischen Methoden auch nur auf statische Attribute sowie andere statische Methoden zugegriffen werden - nicht-statische Attribute existieren ja nur innerhalb eines konkreten Objektes.

Ein Beispiel für die Verwendung eines statischen Attributs wäre, wenn die IDs von Patienten nicht im Constructor übergeben werden, sondern automatisch die nächsthöhere ID vergeben wird. Den entsprechenden Code können Sie hier sehen:

```java
public class Patient {
  private static int nextID = 0;
  private int ID;
  
  public Patient() {
    ID = nextID;
    nextID += 1;
  }
  
  public int getID() {
    return ID;
  }
  
  public static int getNextID() {
    return nextID;
  }
}

public class Loesung {
  public static void main(String[] args) {
    System.out.println("Nächste ID: " + Patient.getNextID());
    Patient p1 = new Patient();
    System.out.println("Nächste ID: " + Patient.getNextID());
    Patient p2 = new Patient();
    System.out.println("p1: ID=" + p1.getID() + ", p2: ID=" + p2.getID());
  }
}
```

Es wird in Zeile 2 der Klasse `Patient` ein statisches Attribut nextID angelegt, welches in einem von konkreten Objekten unabhängigen Speicherbereich abgelegt ist und entsprechend nur ein Mal, zu Beginn der Programmausführung, auf den angegebenen Wert 0 initialisiert wird. Im Constructor wird in Zeile 6 die ID des konkreten Objekts, welches vom Constructor initialisiert wird, auf den aktuellen Wert von nextID gesetzt, und der Wert von nextID wird um eins erhöht. Somit ist sichergestellt, dass keine zwei Patienten die gleiche ID bekommen. Die Veränderung des Wertes von nextID wird in `main` nachvollzogen - beachten Sie den Zugriff auf das statische `getNextID()` direkt über die Klasse `Patient`, ohne die Referenzierung eines konkreten Objektes (im Gegensatz zum Zugriff auf `getID()` in Zeile 7, wo die nicht-statische ID eines konkreten Objektes abgefragt wird).
