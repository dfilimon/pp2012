# Laboratorul 1: Introducere

## Dr. Racket
Folosim mediul [Dr. Racket](http://racket-lang.org/download/) deși în principiu puteți folosi orice Scheme vreți voi. Îl puteți găsi și compila manual și pe [Github](https://github.com/plt/racket).

## Documentația
O găsiți [online](http://docs.racket-lang.org/). Partea importantă este [limbajul de bază](http://docs.racket-lang.org/reference/index.html) (pentru scopurile noastre ignorăm o bună parte din funcționalitatea Racket specifică).

Cel mai bine ar fi ca pur și simplu să *căutați* ce vă trebuie folosind căsuța de căutare...

## În linia de comandă ([REPL](http://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop))
Dacă vreți să lansați direct `racket` din linia de comandă (pe Unix...) vă veți lovi de lipsa de suport pentru navigarea între cuvinte, home, end, săgeți pentru istoric etc.
Din fericire, există o soluție: [`rlwrap`](http://freecode.com/projects/rlwrap). Îl puteți instala cu un `apt-get` sau metoda voastră preferată!

Ca să încărcați un program în REPL, fie apăsați pe *Run*, fie folosiți `load`:

```scheme
        > (load "lab1.rkt")
```
        
