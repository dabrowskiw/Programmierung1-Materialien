
---


![bg left:44%  h:700](Bilder/versioncontrol.png)

# Versionskontrolle

* Ziel: Kontrolle!
    * 1972: [SCCS](https://en.wikipedia.org/wiki/Source_Code_Control_System), single user
* Bonus: Zusammenarbeit
    * 1986: [CVS](https://en.wikipedia.org/wiki/Concurrent_Versions_System) (central)
    * 2005: [git](https://en.wikipedia.org/wiki/Git) (distributed)
    * In the meantime: [SVN](https://en.wikipedia.org/wiki/Apache_Subversion), [TFVC](https://en.wikipedia.org/wiki/Azure_DevOps_Server#TFVC), [BitKeeper](https://en.wikipedia.org/wiki/BitKeeper), [Mercurial](https://en.wikipedia.org/wiki/Mercurial) etc.
* Alles, was textbasiert ist (code, LaTeX, Markdown etc.)

]

#slide(title: "Grundidee von git")[]

![w:1000 center](Bilder/gitdiagram.png)

]

#slide(title: "Dateien im repo im Zeitverlauf

![w:1000 center](Bilder/gitdiagram2.png)

]

#slide(title: "Wichtige Befehle

![bg right:39% h:700](Bilder/xkcd_git1.png)

* Überblick: [NeSI reference sheet](https://support.nesi.org.nz/hc/en-gb/articles/360001508515-Git-Reference-Sheet)
* Erst `git clone https://repo.git`
* Typischer Workflow danach:
    * `git add file1 file2 ...`
    * `git status`
    * `git commit -m "Habe fertig!"`
    * `git push`
* In case of fire: [Oh Shit, Git!?!](https://ohshitgit.com/)

]

#slide(title: "Frisches Repository

![h:400 background:blue](Bilder/head-to-master-1.png)

]

#slide(title: "Repository nach einem commit

![h:400 background:blue](Bilder/head-to-master-2.png)

]

#slide(title: "Repository nach zwei commits

![h:400 background:blue](Bilder/head-to-master.png)


]

#slide(title: "Programmcode im Speicher

Der Computer kann aber keinen Code, nur Zahlen...?

| Befehl | Wert | Argumente | Kommentar |
|---|---|---|---|
| print | 1 | 1 | Auszugebende Adresse |
| jeq | 2 | 3 | 2 Adressen verlgeichen, 3: Sprungziel |
| add | 3 | 2 | 1: Adresse, 2: Zu addierender Wert |
| jmp | 4 | 1 | Sprung-Adresse |
| put | 5 | 2 | 1: Adresse, 2: Wert |


]

#slide(title: "Programmcode -> Bytecode
```java
for(int i=0; i<10; i++) {
  System.out.print(i);
}
```

```asm
90: put 69 0          
93: put 68 10
96: jeq 69 68 107
100: print i
102: add i 1
105: jmp 96
107: Programmende (0)
```

* Programm: `90: 5 69 0 5 68 10 2 69 68 107 1 69 3 69 1 4 96 0`

]

#slide(title: "Verständnisübung 

| Befehl | Wert | Argumente | Kommentar |
|---|---|---|---|
| print | 1 | 1 | Auszugebende Adresse |
| jeq | 2 | 3 | 2 Adressen verlgeichen, 3: Sprungziel |
| add | 3 | 2 | 1: Adresse, 2: Zu addierender Wert |
| jmp | 4 | 1 | Sprung-Adresse |
| put | 5 | 2 | 1: Adresse, 2: Wert |

`90: 5 60 0 5 59 2 5 58 100 2 60 58 120 1 60 5 57 0 2 57 59 99 3 60 1 3 57 1 4 108 0`


<!--
90: put 60 0 # i
93: put 59 2 # diff
96: put 58 100 # max
99: jeq 60 58 120
103: print 60
105: put 57 0
108: jeq 57 59 99
112: add 60 1
115: add 57 1
118: jmp 108
120: Programmende
-->

