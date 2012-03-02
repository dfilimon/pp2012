# Laboratorul 2: Funcții, recursivitate

### [Laborator pe elf.cs](http://elf.cs.pub.ro/pp/laboratoare/l2)

## Computer Science Illustrated (Berkeley) [pdf](http://www.eecs.berkeley.edu/Pubs/TechRpts/2009/EECS-2009-79.pdf)
Aici sunt câteva ilustrații de la Berkeley ca să vă ajute să
vizualizați constructorii și operațiile pe liste și paradigma
MapReduce (cu Map și Reduce ca funcționale: vedeți mai jos explicații)!

* Paginile 28-34 pentru concepte de bază
* Paginile 41-43 pentru MapReduce

Separat, ca postere:

* [Constructori de liste](http://csillustrated.berkeley.edu/PDFs/posters/list-constructors-poster.pdf)
* [Greșeli frecvente cu liste](http://csillustrated.berkeley.edu/PDFs/posters/list-mistakes-poster.pdf)
* [MapReduce simple poster](http://csillustrated.berkeley.edu/PDFs/posters/mapreduce-poster.pdf)
* [MapReduce example poster](http://csillustrated.berkeley.edu/PDFs/posters/mapreduce-example-poster.pdf)

## Evaluare în ordine aplicativă
(max 2 (+ 1 5) (min 3 1 5))
* dacă primul element *se evaluează la o procedură/funcție*, restul listei va fi *evaluat* pentru a obține *argumentele* funcției. Apoi, funcția este aplicată parametrilor.
* dacă primul element este un *special form* (define, set!, ...), comportamentul este specific acelui form

## Tiparea în Scheme este *dinamică*
Nu se fac verificări de tipuri decât la *rulare*. (nici calculul lambda nu face vreo referire la tipul parametrilor)
De aceeaa există predicate ca `number?`, `boolean?`, `list?`, ...
### Conversia între tipurile de date
`char->integer`, `string->number`, `symbol->string`

## Funcții *curried* și *uncurried*
Din punct de vedere matematic, o funcție asociază fiecărei valori
dintr-o mulțime, numită *domeniu*, o valoarea dintr-o mulțime numită
*codomeniu*.

Astfel, `f: D -> C` și unei valori `x` din `D` îi corespunde o valoare
`f(x)` din `C`.

Domeniul `D` poate fi însă și un produs cartezian. Pentru funcția
`f(x, y) = 3x + 2y + 7` cu `x` și `y` numere naturale, `f : NxN -> N`.
Funcția `f` din acest caz are *două argumente*. Dacă am scrie asta în
`C`, codul ar fi ceva de genul

```c
int f(int x, int y) {
	return 3 * x + 2 * y + 7;
}
```

și am apela funcția `f` cu ambii parametri, `f(2, 3)` de exemplu. În
`C`, expresia `f(2)` ar produce o eroare la compilare.

Totuși, din punct de vedere matematic, dacă privim evaluarea funcției
ca substituirea argumentelor în definiție, `f(2) = 3 * 2 + 2y + 7`,
adică `f(2) = 2y+ 13`. Asta poate fi altă funcție, `g(y) = 2y + 13`.

Deci, putem are sens să ne așteptăm ca atunci când dăm unei funcții cu *2 parametri*,
doar unul dintre ei, să primim ca rezultat *o funcție cu 1 parametru*. 

Corespunzător celor două perspective, există două forme, *forma curry*
și *forma uncurry* a unei funcții, denumite după logicianul Haskell
Curry.

* Funcțiile în *forma curry* își așteaptă argumentele *pe rând* și
rezultatele intermediare sunt funcții.

```scheme
(define f 
	(lambda (x)
		(lambda (y)
			(+ x y))))
```

Deci, pentru funcția de mai sus, un apel ar fi `((f 1) 2)` care dă `3`
fiindcă `(f 1)` este o funcție, `(lambda (y) (+ 1 y))`. `(f 1 2)` va
da o eroare fiindcă `f` se așteaptă să primească doar un parametru.

* Funcțiile în *forma uncurry* își așteaptă argumentele *în același
  timp*.
  
```scheme
(define g
	(lambda (x y)
		(+ x y)))
```

Acum, un apel ar fi `(g 1 2)` care dă `3` iar `(g 1)` dă o eroare.

## Recursivitate *simplă* și *prin revenire* (tail recursion)


## Legări locale funcțiilor prin *let*, *letrec*, <em>let*</em>, <em>letrec*</em>
Diferențe/asemănări:
* let, letrec evaluează expresiile legărilor înainte de a face vreo
  legare
* let\*, letrec* evaluează expresiile secvențial și legările
  anterioare vor fi vizibile după 

## Funcții de nivel superior
map, fold, filter

## Exerciții
1. Trecea între forma curried și cea uncurried
1. Exerciții cu let, let* și letrec
[Handout let](http://www.cs.vassar.edu/~cs295/handouts/let-forms.pdf)
1. Comparații între recursivitatea simplă și tail recursion: fibonacci, inversa unei liste...
1. Implementări map, fold, filter
1. Implementări map și filter ca fold
1. Pig Latin cu funcționale 
1. PigSty with AngryBirds (contestron)
