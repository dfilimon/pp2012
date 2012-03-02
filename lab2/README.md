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
Am spus că în Scheme recursivitatea este vitală. Nu există (teoretic)
bucle `for`, `while` și traversarea structurilor se face numai
recursiv.

În mod normal, în C de exemplu, fiecare apel recursiv corespunde unui
nou *cadru pe stivă*. De-asta, recursivitatea este de "evitat" în
multe limbaje de programare imperative.

Să considerăm cea mai simplă funcție recursivă, *factorial* în Scheme.

```scheme
(define (fact n)
	(if (= n 0) 1
		(* n (fact (- n 1)))))
```

Pentru un apel, de genul `(fact 4)`, se construiește un nou cadru pe
stivă pentru execuția funcției cu 4 drept argument al lui
`n`. Evaluând corpul obținem:

`(fact 4) -> (* 4 (fact 3)) -> (* 4 (* 3 (fact 2))) -> (* 4 (* 3 (* 2
(fact 1)))) -> (* 4 (* 3 (* 2 (* 1 (fact 0))))) -> (* 4 (* 3 (* 2 (* 1
1))))`

Fiecare apel al lui `fact`, construiește un alt cadru pe stivă,
oprindu-ne la `n = 0` și întorcându-ne ca să putem face calculele din
apel în apel.

Deși exprimă definiția matematică foarte clar, pentru `n` în general,
spațiul ocupat crește liniar.

În C, nu facem așa de obicei. De obicei scriem o buclă de genul:

```c
int a = 1;
for (int i = n; i > 0; --i)
	a *= n;
```

Esențială este variabila `a`, *acumulatorul*. Putem reformula
funcția factorial de mai devreme cu un acumulator.

```scheme
(define (fact n a)
	(if (= n 0) a
		(fact (- n 1) (* n a))))
```

De data asta, când începem calculul pentru 4!, avem:

`(fact 4 1) -> (fact 3 4) -> (fact 2 12) -> (fact 1 24) -> (fact 0 24)
-> 24`

Am avea aparent tot `n` cadre pe stivă, dar, la *întoarcere*, de data
asta nu mai procesăm rezultatul funcției apelate. Îl întoarcem
direct.
De-asta optimizarea pe care Scheme o face este de a *nu mai crea un
cadru pentru fiecare apel* ci *înlocuiește cadrul existent pe stivă*,
fiindcă rezultatul trebuie direct întors și nu va mai fi folosit în
vreo expresie. Optimizarea se numește *tail call optimization*.

*Tail*-ul vine din faptul că apelul recursiv este plasat la finalul
 corpului funcției. Adică, în expresia corpului, `(if (= n 0) a (fact
 (- n 1) (* n a)))`, ultimul element al listei este apelul recursiv.
 
 Acest fapt face optimizarea posibilă fiindcă înseamnă că rezultatul
 apelului recursiv trebuie întors direct la apelant, nu mai trebuie
 făcut vreun calcul cu el (cum se întâmpla în primul caz în care se
 înmulțea cu `(* n (fact (- n 1)))`). Ca optimizarea să poată fi
 făcută, apelul trebuie să fie în *tail position*, adică să fie
 ultimul element din expresia corpului, ce-am descris mai sus.
 
 Optimizarea e vitală fiindcă spațiul pe stivă e limitat și ar fi
 folosit inutil. E de remarcat că deși Scheme face asta automat (e o
 constrângere a standardului), C sau chiar alte dialecte de Lisp nu
 (deși ar fi posibil).
 
 În plus, de obicei cum forma asta mai necesită apariția unei
 variabile în plus în definiție, forma tail-recursive se pune într-un
 `letrec` și este îmbrăcată de un apel al funcției fără acumulator.

## Legări locale funcțiilor prin *let*, *letrec*, <em>let*</em>
În cazul funcțiilor mai mari, există probabil expresii care se
repetă. Un caz simplu ar fi o funcție care întoarce rădăcinile unei
expresii de gradul 2, `ax^2 + bx + c = 0`. Cele două soluții, `x1` și
`x2` diferă doar printr-un `-` la numărător.
În C, am îmbunătăți lizibilitatea codului folosind variabile
temporare. În Scheme, putem lega nume la expresii pe care le folosim
mai des.

Aceste construcții care fac legările se numesc *let-uri*. Există *3
tipuri*  de let-uri (let, let*, letrec) care au aceeași sintaxă, dar diferă din punctul de
vedere al ordinii în care evaluează expresiile și fac legările efective.

Sintaxa pentru toate cele 3 forme este (am pus `kwd` în loc de numele
let-ului):

```scheme
(kwd 
	( (nume1 expr1)
	  (nume2 expr2)
	  ...
	  (numen exprn) )
	 corp)
```

Spre exemplu, ar putea fi:

```scheme
(let*
	( (bsq (* b b))
	  (fac (* 4 a c))
	  (delta (- bsq fac)) )
	(/ (+ (- b) (sqrt delta)) (* 2 a)))
```

* *let*

    Toate expresiile, de la *expr1*  .. *exprn* sunt mai întâi evaluate
  și apoi legate la *nume1* .. *numen*.
  
* <em>let*</em>

    Expresiile sunt evaluate și legate la numele care le corespunde una
  câte una. În exemplul de mai sus, pot folosi `bsq` în definiția lui
  `delta` fiindcă `bsq` a fost legat la expresiia corespunzătoare
  înainte. Cu un `let`, `bsq` nu ar fi fost legat în momentul
  evaluării expresiei pentru `delta` și ar fi dat o eroare. 
  
* *letrec*

    Dacă vreau să definesc o funcție recursivă într-un *let* ca să
  îmbrac spre exemplu o funcție tail recursive și să-i ascund
  acumulatorul, folosind `let` sau `let*`, numele nu va fi legat încă
  în momentul evaluării expresiei producând astfel o eroare.
  
    `letrec` leagă inițial toate numele la `undefined` și apoi evaluează
  expresiile și face legările corecte.
  Astfel, funcționează și în cazul definiției unei funcții recursive.
  
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
