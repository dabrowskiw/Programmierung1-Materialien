# Statische Attribute und Methoden

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


# Arbeiten mit Dateien und Exceptions

Nun haben wir uns recht ausführlich angeschaut, wie man Daten im Arbeitsspeicher organisieren und verarbeiten kann. Das alles wird aber erst wirklich praktisch nützlich, wenn diese Daten nicht - wie in den bisherigen Beispielen - fest im Programmcode stehen, sondern aus Dateien gelesen und wieder in Dateien geschrieben werden können. Dafür bietet Java vorgefertigte Klassen an, die das Lesen aus und Schreiben in Dateien erleichtern. Dabei können aber diverse Fehler auftreten, wie z.B. der Versuch, eine nicht vorhandene Datei zu öffnen. Um mit solchen Fehlern umzugehen, bietet Java einen Mechanismus zur Fehlerbehandlung an (Exceptions, englisch für "Ausnahmen"). Zunächst sehen wir uns also an, was in Java eine Exception ist und wie damit umgegangen werden kann. Danach sehen wir, wie Dateien geöffnet, gelesen und wieder geschrieben werden können.

## Exceptions

Vermutich haben Sie bereits bei der Bearbeitung der Übungsaufgaben versucht, in einem Array auf einen Index zuzugreifen, der nicht in dem Array vorhanden ist oder auf eine Variable, die nicht initialisiert war, und eine ArrayIndexOutOfBoundException oder eine NullPointerException erhalten. Das ist die Art von Java, mit Fehlern, die während der Programmausführung auftreten, umzugehen: Wenn bei der Ausführung eines Java-Programms ein unerwartetes Problem auftritt, wird ein Exception-Objekt erzeugt. Dieses wird sofort - so, als wäre ein `return` erreicht worden - anstatt des eigentlichen Rückgabewertes der Funktion zurückgegeben. Wenn auf diese Art eine Exception von einem Funktionsaufruf zurückkommt, wird sie auch von der aufrufenden Funktion sofort zurückgegeben, bis die oberste Ebene (z.B. die main-Funktion) erreicht ist, bei der das Zurückgeben der Exception zur Beendigung des Programms führt. Da die Exception gewissermaßen ungehindert durch das gesamte Programm fliegt, wird das Verursachen einer Exception als `throw` (`Werfen`) bezeichnet, man spricht auch davon, dass bei einer Operation eine Exception geworfen wird oder fliegt.


## Was ist eine Exception?

Nehmen wir als Veranschaulichung ein Programm zum Berechnen des Maximalwertes eines Arrays:

```java
public class Loesung {	
  public static void showArray(int[] array, int max) {
    System.out.println("  ShowArray beginnt...");
    for(int i=0; i<=max; i++) {
      System.out.println("   " + array[i]);
    }
    System.out.println("  ShowArray fertig.");
  }
  
  public static void main(String[] args) {
    int[] data = {1, 2, 3};
    System.out.println("Starte...");
    showArray(data, 2);
    System.out.println("Fertig.");
  }
}
```

Hier gibt `showArray(int[] array, int max)` alle Werte bis zum Index `max` aus dem Array `array` aus. Wird diese Funktion wie in Zeile 13 mit dem Array `{1, 2, 3}` und dem Maximalindex 2 aufgerufen, erzeugt das Programm die folgende Ausgabe:

```text
Starte...
  ShowArray beginnt...
   1
   2
   3
  ShowArray fertig.
Fertig.      
```

Wird allerdings bei dem gleichen Array als Maximalindex ein zu großer Wert, beispielsweise 3, übergeben, fliegt durch den Zugriff auf den nicht vorhandenen Index 3 in Zeile 5 eine Exception, die resultierende Ausgabe des Programms istwie folgt:

```text
Starte...
  ShowArray beginnt...
   1
   2
   3
Exception in thread "main"
java.lang.ArrayIndexOutOfBoundsException:
Index 3 out of bounds for length 3
	at Loesung.showArray(Loesung.java:5)
	at Loesung.main(Loesung.java:13)
```

Von der ursprünglichen Ausgabe sind nur noch die ersten 5 Zeilen zu sehen: In dem Moment, in dem die Exception auftritt, wird die Ausführung von showArray beendet (die Ausgabe in Zeile 7 findet also nicht mehr statt), und da der Aufruf von showArray in Zeile 13 eine Exception zurückliefert, wird diese auch in main in Zeile 13 direkt weiter zurückgegeben (auch die Ausgabe in Zeile 14 findet also nicht mehr statt). Dieser Weg der Exception durch den Code wird auch in der Exception selber dokumentiert. In der Ausgabe steht neben der Information was für eine Exception geworfen wurde (Zeile 7, ArrayIndexOutOfBoundsException) und weshalb (Zeile 8, der Index 3 ist für ein Array der Länge 3 nicht zulässig) auch, dass die Exception ursprünglich in der Methode showArray in Zeile 5 der Datei Loesung.java geworfen wurde (Zeile 9 der Ausgabe) und dass das bei dem Aufruf dieser Methode in Zeile 13 passiert ist (Zeile 10 der Ausgabe). Diese Auflistung wird als `stack trace` bezeichnet, englisch so viel wie "Spur durch den Stack" - der Stack ist, wir erinnern uns, der Bereich im Arbeitsspeicher, in dem u.A. steht, welche Funktion gerade ausgeführt wird und von wo aus im Programm sie aufgerufen wurde. 

## Fangen von Exceptions

Nicht in allen Fällen ist es aber wünschenswert, dass ein Programm direkt abbricht, wenn eine Exception geworfen wird. Generell ist es guter Stil, Exceptions nicht dem Endanwender zu zeigen - der herzlich wenig damit anfangen kann - sondern stattdessen eine verständliche Fehlermeldung auszugeben. Zudem kann häufig bei Auftreten einer Exception das Programm trotzdem weiterlaufen, es müssen nur entsprechende Vorkehrungen getroffen werden (beispielsweise kann eine Exception fliegen, wenn versucht wird, eine nicht vorhandene Konfigurationsdatei zu öffnen - anstatt das Programm mit einer Fehlermeldung zu beenden, könnten in so einem Fall Standardeinstellungen verwendet werden).

Um das zu erreichen, können Exceptions mit dem Anweisungspaar `try` und `catch` gefangen werden: Die Anweisung (oder Anweisungen), die eine Exception verursachen könnte, wird in einen Block hinter `try` geschrieben, und direkt danach kommt ein `catch`-Block. Das `catch` verhält sich wie eine kleine Funktion, die als Argument die Exception bekommt und nur aufgerufen wird, wenn tatsächlich eine Exception geflogen ist. Hier ein Beispiel:

```java
public class Loesung {	
  public static void showArray(int[] array, int max) {
    System.out.println("  ShowArray beginnt...");
    for(int i=0; i<=max; i++) {
      try {
        System.out.println("   " + array[i]);
      } catch(Exception e) {
        break;
      }
    }
    System.out.println("  ShowArray fertig.");
  }
  
  public static void main(String[] args) {
    int[] data = {1, 2, 3};
    System.out.println("Starte...");
    showArray(data, 3);
    System.out.println("Fertig.");
  }
}      
```

Dieser Code generiert die folgende Ausgabe:

```text
Starte...
  ShowArray beginnt...
   1
   2
   3
  ShowArray fertig.
Fertig.
```

Diese Ausgabe ist identisch mit der Ausgabe, wenn alles funktioniert, da die Exception sofort, nachdem sie durch einen fehlerhaften Arrayzugriff verursacht wurde, gefangen wird und einfach die Schleife (deren Fortführung zu weiteren Exception führen würde) unterbrochen wird.

Eine andere Variante des selben Codes ist diese hier:

```java
public class Loesung {	
  public static void showArray(int[] array, int max) {
    System.out.println("  ShowArray beginnt...");
    for(int i=0; i<=max; i++) {
      System.out.println("   " + array[i]);
    }
    System.out.println("  ShowArray fertig.");
  }
  
  public static void main(String[] args) {
    int[] data = {1, 2, 3};
    System.out.println("Starte...");
    try {	
      showArray(data, 3);
    } catch(Exception e) {
      System.out.println("Ups, hab versucht, zu viel auszugeben.");
    }
    System.out.println("Fertig.");
  }
}      
```

Die dann generierte Ausgabe ist wie folgt:

```text
Starte...
  ShowArray beginnt...
   1
   2
   3
Ups, hab versucht, zu viel auszugeben.
Fertig.
```

Bei dieser Variante in Abbildung fehlt in der Ausgabe das "ShowArray fertig." aus Zeile 7, da die Exception in Zeile 5 auftritt und ungefangen aus showArray rausfliegt (wodurch die Ausgabe in Zeile 7 nicht mehr stattfinden kann) und erst in main in Zeile 15 gefangen wird.

Es ist auch möglich, Exceptions spezifisch zu fangen (also z.B. an einer Stelle, an der sowohl eine `NullPointerException` als auch eine `ArrayIndexOutOfBoundsException` fliegen könnte, nur die `NullPointerException` zu fangen), eigene Exceptions mittels `throw new Exception()` zu werfen und eigene Exception-Klassen zu schreiben. Das setzt allerdings eine Auseinandersetzung mit der Vererbung von Klassen voraus und wird entsprechend im nächsten Semester tiefer behandelt.

## Lesen von Dateien

Java bietet mehrere Klassen, um mit Dateien zu arbeiten. Auf den ersten Blick sieht das unnötig komplex aus, aber diese Komplexität bietet in Zusammenhang mit Vererbung (ich muss wieder auf das nächste Semester verweisen) viel Flexibilität.

Nehmen wir als Beispiel das Einlesen der folgenden Datei "test.txt":

```text
10,r
98,d
32,r
55
```

Ein Programm, das diese Datei einliest, analysiert und ausgibt, könnte wie folgt aussehen:

```java
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

public class Loesung {	
  public static void main(String[] args) {
    File infile = new File("test.txt");
    FileReader filereader = null;
    try {
      filereader = new FileReader(infile);
    } catch(Exception e) {
      System.out.println("Datei nicht gefunden.");
      System.exit(1);
    }
    BufferedReader reader = new BufferedReader(filereader);
    try {
      while(reader.ready()) {
        String line = reader.readLine();
        String[] parts = line.split(",");
        double age = Double.parseDouble(parts[0]);
        char status = parts[1].charAt(0);
        System.out.println("Age: " + age + ", status: " + status);
      }
    } catch(Exception e) {
      System.out.println("Fehler beim Lesen der Datei.");
      e.printStackTrace();
    }
    try {
      reader.close();
    } catch(Exception e) {
      System.out.println("Fehler beim Schließen der Datei");
    }
  }
}
```

Zunächst muss ein `File`-Objekt erstellt werden, das die Datei repräsentiert (Zeile 7). An dieser Stelle ist es noch egal, ob die Datei existiert oder nicht, es handelt sich um eine rein abstrakte Repräsentation einer Datei (die auch mit vollem Pfad angegeben werden kann, wobei statt "\" immer "/" verwendet werden sollte, z.B. "C:/temp/test.txt" - in diesem Beispiel wird aber davon ausgegangen, dass die Datei sich im gleichen Verzeichnis wie das Programm befindet). `File` besitzt auch Methoden, um die repräsentierte Datei, falls sie noch nicht existiert, zu erstellen.

In Zeilen 8-14 wird ein `FileReader` erstellt, der genutzt werden kann, um aus dem `File` zu lesen. Dabei kann, falls die von File beschriebene Datei nicht existiert, in Zeile 10 eine Exception fliegen - aus einer Datei, die nicht existiert, kann man nicht lesen. Bei dieser Exception handelt es sich um eine sogenannte "checked exception" - das ist eine Exception, die, im Gegensatz zu einer `ArrayIndexOutOfBoundsException`, zwingendermaßen behandelt werden muss: Ein Methodenaufruf, bei dem eine checked exception fliegen kann, muss zwingendermaßen in einem try-catch-Block stattfinden. In diesem Fall wird das Programm, falls die Exception fliegt, in Zeile 14 mittels `System.exit()` beendet, da eine weitere Ausführung keinen Sinn ergeben würde. 

Der FileReader bietet allerdings nur sehr rudimentären Lesezugriff: Es können einzelne Byte aus der Datei gelesen werden. Während das bei der effizienten Arbeit mit binären Dateien durchaus ausreichend sein kann, ist es für die Arbeit mit Textdateien unbequem. Daher wird in Zeile 15 ein `BufferedReader` erstellt, der unter interner Verwendung des `FileReader` weitere Funktionalität anbietet - insbesondere die Methode `readLine()`, die eine ganze Zeile aus der Datei liest.

Der reader wird in Zeilen 17-22 zum Lesen des Dateiinhalts verwendet. Dabei wird immer wieder in Zeile 18 eine Zeile aus der Datei mittels `readLine()` gelesen, solange aus der Datei weiter gelesen werden kann. Diese Information wird von der Methode `ready()` des BufferedReader bereitgestellt: Solange sich Zeichen in der Datei befinden, die noch nicht gelesen wurden, gibt `ready()` `true` zurück, erst wenn die Datei vollständig gelesen wurde (und ein erneutes Lesen, z.B. mittels `readLine()`, fehlschlagen würde) gibt es `false` zurück.

Da die einzelnen Zeilen der Datei unterschiedliche Informationen mit Kommata getrennt - in diesem Fall Alter und Status von Patienten - enthalten, wird nach dem Einlesen jeder Zeile diese in ein Array von Strings geteilt, die jeweils die durch "," voneinander getrennten Zeilenbestandteile enthalten (Zeile 19). Aus diesen Informationen wird dann das Alter (mittels der statischen parseDouble-Methode der Double-Klasse - jeder numerische boxed type besitzt eine entsprechende parse-Methode, um die von einem String repräsentierte Zahl zu rekonstruieren) und der Status extrahiert und ausgegeben.

Da beim Aufruf von `readLine()` wieder eine checked exception fliegen kann (z.B. wenn die Datei während sie gelesen wird von einem anderen Programm gelöscht wird und der Zugriff plötzlich nicht mehr möglich ist), muss auch dieser ganze Block in einem try-catch-Block stattfinden. Allerdings kann eine Exception in diesem Block auch andere Ursachen haben - beispielsweise kann eine Zeile nicht das erwartete Format haben, wodurch das Extrahieren der Information fehlschlägt (im Fall von Zeile 4 in der Beispiel-Textdatei schlägt Zeile 21 des Codes fehl, da kein "," in der Zeile steht und entsprechend `parts` keinen Index 1 hat). Um mehr Informationen über den Fehler zu bekommen, als die generische Ausgabe "Fehler beim Lesen der Datei" wird in Zeile 26 noch der stack trace mit der Methode `printStackTrace()` von `Exception` ausgegeben.

Letztendlich ist es guter Programmierstil, am Ende den reader und damit die Datei wieder zu schließen (Zeile 29), auch wenn das automatisch beim Beenden des Programms getan wird. Das nicht zu tun kann bei der Arbeit mit vielen Dateien zu Speicherlecks oder zu anderen unterwarteten Fehlern führen, z.B. durch Erreichen der betriebssystemspezifischen Maximalanzahl gleichzeitig offener Dateien. 

## Schreiben von Dateien

Das Schreiben von Dateien funktioniert genau so, wie das Lesen - nur, dass anstatt von Readern entsprechende Writer verwendet werden, wie hier beispielhaft gezeigt:

```java
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class Loesung {	
  public static void main(String[] args) {
    int[] ages = {10, 98, 32, 55};
    char[] stati = {'r', 'd', 'r', 'd'};
    File outfile = new File("outtest.txt");
    FileWriter outwriter = null;
    try {
      outwriter = new FileWriter(outfile);
    } catch(Exception e) {
      System.out.println("Datei konnte nicht erstellt werden.");
      System.exit(1);
    }
    BufferedWriter writer = new BufferedWriter(outwriter);  
    try {
      for(int i=0; i<ages.length; i++) {
        writer.write(ages[i] + "," + stati[i] + "\n");
      }
    } catch (IOException e) {
      System.out.println("Fehler beim Schreiben.");
      e.printStackTrace();
    }
    try {
      writer.close();
    } catch(Exception e) {
      System.out.println("Fehler beim Schließen der Datei");
    }
  }
}    
```

Die einzige Besonderheit in diesem Beispiel ist, dass der BufferedWriter keine Methode `writeln` besitzt, um eine komplette Zeile zu schreiben, entsprechend muss in Zeile 21 das Zeilenende explizit mit geschrieben werden (das "\n" am Ende wird als "neue Zeile" interpretiert).
