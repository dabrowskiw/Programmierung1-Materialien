# Objektorientierung

##  Deklarieren einer Klasse

Vorsicht: Dateiname und Klassenname müssen übereinstimmen, die Klasse `KlassenName` muss also in der Datei `KlassenName.java` deklariert sein:

```java
public class KlassenName {
}
```

## Instanziieren einer Klasse:

Das Instanziieren ist das Erstellen eines Objekts vom Typ der Klasse - der Code hier darf natürlich nicht komplett in einer Datei stehen, die `UseClass` müsste in `UseClass.java` sein:

```java
public class KlassenName {
}

public class UseClass {
	public static void main(String[] args) {
		KlassenName myObj = new KlassenName();
	}
}
```

## Klassenmethoden

Deklarieren und Verwenden einer Klassenmethode (Funktion, die auf dem Objekt aufgerufen werden kann und auf seine Attribute zugreifen kann):

```java
public class KlassenName {
	public void sayHi() {
		System.out.println("Hi");
	}
}

public class UseClass {
	public static void main(String[] args) {
		KlassenName myObj = new KlassenName();
		myObj.sayHi(); //Vorsicht: Man braucht das Objekt!
		// KlassenName.sayHi() geht nicht, es muss ein 
		// konkretes Objekt (wie myObj) verwendet werden!
	}
}
```

## Klassenattribute

Deklarieren und Verwenden eines Klassenattributs (Variable, die überall in einem Objekt der Klasse verfügbar ist):

```java
public class KlassenName {
	public String name = "somebody";
	
	public void sayHi() {
		System.out.println("Hi, I am " + name + "."); //Hier wird das
		// name-Attribut des Objekts verwendet
	}
}

public class UseClass {
	public static void main(String[] args) {
		KlassenName myObj = new KlassenName();
		myObj.sayHi(); 
		myObj.name = "somebody";
		myObj.sayHi();
	}
}
```

## Constructor

Verwendung eines Constructors zum Initialisieren der Klasse (mit shadowing):

```java
public class KlassenName {
	public String name = "somebody";

	public KlassenName(String name) {
		// Vorsicht: Der Name der übergebenen Variable "name"
		// "überschattet" das Attribut "name" ("shadowing")!
		// Wenn man jetzt "name" schreibt, ist die übergebene
		// Variable gemeint, um auf das Attribut zuzugreifen
		// muss "this." davorgeschrieben werden:
		this.name = name;
	}
	
	public void sayHi() {
		System.out.println("Hi, I am " + name + "."); 
		// Hier könnte man auch "this.name" schreiben, es muss
		// aber nicht sein - da es in der Methode keine Variable
		// "name" gibt, ist eindeutig, dass "name" sich auf das
		// Attribut bezieht.
	}
}

public class UseClass {
	public static void main(String[] args) {
		KlassenName myObj = new KlassenName("your friend");
		myObj.sayHi(); 
		myObj.name = "the enemy";
		myObj.sayHi(); 
	}
}
```

## Zugriffsmodifikatoren

Verwendung eines privaten Attributs (kein Zugriff von außerhalb der Klasse, dafür spezialisierte getter- und setter-Methoden):

```java
public class KlassenName {
	private String name = "somebody";

	public KlassenName(String name) {
		this.name = name;
	}
	
	public void sayHi() {
		System.out.println("Hi, I am " + name + ".");
	}
	
	// Setter und Getter-Methoden, die public sind
	public void setName(String newName) {
		System.out.println("ATTENTION: Changing my name from " + name + " to " + newName + "!")
		name = newName;
	}
	
	public String getName() {
		return name;
	}
}

public class UseClass {
	public static void main(String[] args) {
		KlassenName myObj = new KlassenName("your friend");
		myObj.sayHi(); 
		// myObj.name = "the enemy"; geht hier nicht mehr, da name private ist
		myObj.setName("the enemy");
		myObj.sayHi(); 
		System.out.println("The object's name is " + myObj.getName());
	}
}
```
