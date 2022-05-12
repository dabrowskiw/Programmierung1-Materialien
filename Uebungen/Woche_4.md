Geben Sie bitte alle Übungsaufgaben über VPL als Aufgabe 4 ab. Implementieren Sie dazu in der dort vorgegebenen Klasse `Loesung` für jede Übungsaufgabe die jeweils vorgegebene Methode. Sie können natürlich auch weitere Hilfsmethoden implementieren oder zum eigenen Testen eine `public static void main(String[] args)` in der Klasse haben, aber diese werden von den automatischen Tests ignoriert. Achten Sie bitte darauf, dass Ihre Lösungs-Methoden alle public sind (also in der Signatur z.B. `public int getMax(int a, int b, int c)` steht, und nicht einfach nur `int getMax(int a, int b, int c)`). Zu den Gründen dafür kommen wir in einer der nächsten Wochen, jetzt sei nur so viel gesagt, dass die Tests sonst nicht auf Ihre Lösungs-Methoden zugreifen können und entsprechend die jeweiligen Aufgaben als "nicht funktionierend" bewerten.

Bitte achten Sie auch darauf, die vorgegebenen Datentypen zu verwenden. Auch wenn Sie schon Erfahrung mit Java haben: Wenn da steht, die Methode nimmt einen int, dann verwenden Sie bitte auch einen int und nicht z.B. einen Integer. Zum Einen bringen Abweichungen die automatischen Tests potentiell durcheinander, zum Anderen sollten Sie sich daran gewöhnen, sich exakt an solche Vorgaben zu halten. Wenn Sie in einem großen Team arbeiten und für eine Schnittstelle zuständig sind, müssen sich die Anderen darauf verlassen können, dass Sie tatsächlich genau die besprochene Schnittstelle implementieren, und nicht nur grob etwas was Sie für ausreichend ähnlich halten. 

Nutzen Sie gerne, wie schon in der letzten Woche, die Möglichkeit, Ihre Lösung in VPL zu evaluieren, bevor Sie sie abgeben, und achten Sie dabei auf eventuelle Fehlermeldungen. Diese können Ihnen Hinweise darauf geben, was in Ihrer Lösung nicht wie erwartet funktioniert.

# Aufgabe 1: Maximum von drei Zeilen

Implementieren Sie eine Methode `getMax`, die drei int als Argumente nimmt und den größten der drei Werte als int zurückgibt.

# Aufgabe 2: Klein zu groß


Implementieren Sie eine Methode `uppercaseChar`, die einen char als Argument nimmt und wieder einen char zurückgibt. Dabei sollte das Ergebnis:

* Der Großbuchstabe zu dem übergebenen Buchstaben sein, wenn das übergebene Argument ein Buchstabe zwischen a und z ist
* Der übergebene Buchstabe sein, wenn das übergebene Argument ein Buchstabe zwischen A und Z ist
* In allen anderen Fällen 0 sein (Vorsicht: Der Wert 0, nicht das Zeichen "0")

Beispiele:

* `uppercaseChar('g');` gibt 'G' zurück.
* `uppercaseChar('K');` gibt 'K' zurück.
* `uppercaseChar('@');` gibt 0 zurück.

Bedenken Sie dabei, dass der durch einen char repräsentierte Buchstabe im ASCII-Code definiert ist. Eine Tabelle finden Sie z.B. auf der [Wikipedia-Seite zur ASCII-Tabelle](https://de.wikipedia.org/wiki/American_Standard_Code_for_Information_Interchange). Verwenden Sie dabei mathematische Operationen auf dem char - schreiben Sie auf keinen Fall 48 if-Anweisungen, die jeden möglichen Buchstaben abfragen! Das ist viel zu viel Arbeit, Sie können diese Aufgabe in wenigen Zeilen lösen.

# Aufgabe 3: Fibonacci

Implementieren Sie eine Methode `fibonacci`, die einen int n als Argument bekommt und einen int zurückgibt, der das n-te Element der Fibonacci-Folge ist(beginnend bei 1, die ersten 5 Elemente sind also 1, 1, 2, 3, 5). Falls n so groß ist, dass das n-te Element nicht in einem int gespeichert werden kann, geben Sie den Wert -1 zurück. Tip: Überprüfen Sie, ob ein overflow stattgefunden hat - wenn Sie bei der Berechnung die letzte berechnete Zahl aus der Folge mit der vergleichen, die Sie gerade berechnet haben, können Sie feststellen, ob ein Overflow stattgefunden hat (überlegen Sie, was bei einem Overflow genau passiert, und denken Sie dabei daran, dass Sie einen `int` und keinen `undigned int` zurückgeben sollen).
