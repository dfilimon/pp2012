# Laboratorul 2: Funcții, recursivitate

### [Laborator pe elf.cs](http://elf.cs.pub.ro/pp/laboratoare/l2)

## Computer Science Illustrated (Berkeley) [pdf](http://www.eecs.berkeley.edu/Pubs/TechRpts/2009/EECS-2009-79.pdf)
* Paginile 28-34 pentru concepte de bază
* Paginile 41-43 pentru MapReduce
Separat ca postere:
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
