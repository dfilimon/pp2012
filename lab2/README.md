# Laboratorul 2: Funcții, recursivitate

### [Laborator pe elf.cs](http://elf.cs.pub.ro/pp/laboratoare/l2)

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

## Legările locale funcțiilor prin *let*, *letrec*, *let\**
