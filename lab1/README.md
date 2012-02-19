# Laboratorul 1: Introducere

## Dr. Racket
Folosim mediul [Dr. Racket](http://racket-lang.org/download/) deși în principiu puteți folosi orice Scheme vreți voi. Îl puteți găsi și compila manual și pe [Github](https://github.com/plt/racket).

## Documentația
O găsiți [online](http://docs.racket-lang.org/). Partea importantă este [limbajul de bază](http://docs.racket-lang.org/reference/index.html) (pentru scopurile noastre ignorăm o bună parte din funcționalitatea Racket specifică).

Cel mai bine ar fi ca pur și simplu să *căutați* ce vă trebuie folosind căsuța de căutare...

## În linia de comandă ([REPL](http://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop))
Dacă vreți să lansați direct `racket` din linia de comandă (pe Unix...) vă veți lovi de lipsa de suport pentru navigarea între cuvinte, home, end, săgeți pentru istoric etc.
Din fericire, există o soluție: [`rlwrap`](http://freecode.com/projects/rlwrap). Îl puteți instala cu un `apt-get` sau metoda voastră preferată!
Apoi, porniți `racket` cu `rlwrap racket` și totul va merge bine :)

Ca să încărcați un program în REPL, fie apăsați pe *Run*, fie folosiți `load`:

```scheme
> (load "lab1.rkt")
```

Dacă aveți nevoie de ajutor pentru o formă, folosiți `help`:

```scheme
> (help cons)
```

și va încărcă în browserul implicit documentația online pentru subiectul cerut.
        
## Idei importante
* Programele Scheme sunt expresii simbolice (S-expresii)
* Expresii rezultate din parcurgerea pre-ordine al arborelui expresiei
* Expresiile sunt liste de liste (codificarea noastră pentru arbori)
* Scheme este homoiconic: cod = date (expresii reprezentate ca liste) dar nu
  toate listele sunt programe valide ((1 2 3) nu poate fi evaluat fiindcă 1 nu este
  o funcție)
  
## Cuvinte cheie
* `define`, `quote`
* `list`, `cons`, `car`, `cdr`
* predicate: `list?`, `number?`, `real?`, `empty?` 

## Temă (pentru bonus)
1. Funcție pentru *ultimul element* dintr-o listă
1. Ce face (cons 1 2)? Ar trebui ca (list 1 2) să fie egal cu (cons 1 2)? De ce?
1. Folosind funcția factorial definită în lab1.rkt, calculați (factorial 1000). Ce observați? Ce s-ar întâmpla dacă am traduce codul în C și am executa factorial(1000)?
1. Funcție pentru inversarea unei liste. Amintiți-vă de AA.
1. Funcție pentru verificarea primalității unui număr. Întoarceți #t sau #f. (Generați mai întâi lista posibililor divizori)
1. Funcție pentru *aplatizarea* unei liste (flatten '((1 2) 2 3 (3 4) 5)) => '(1 2 2 3 3 4 5) 

