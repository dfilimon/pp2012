# Laboratorul 3: Funcționale

### [Laborator pe elf.cs](http://elf.cs.pub.ro/pp/laboratoare/l3)
NU este laboratorul de pe elf! Am schimbat ordinea anul ăsta!

# Quote, quasiquote
Atunci când Scheme întâlnește o listă `(f 1 2)`, va încerca să o trateze ca și cod și să o evalueze, considerând primul element din listă funcția și următoarele elemente ca argumente pentru f.

Am văzut (lab 1?) că putem preveni evaluarea unei expresii cu `quote`: `'(1 2 3) -> (1 2 3)` sau `(quote (1 2 3)) -> (1 2 3)`.

Uneori vrem să construim o listă cu `quote`, dar am vrea ca unii termeni din interior să fie evaluați. Pentru asta, există `quasiquote`,  `unquote` și `unquote-splicing`.
Documentația detaliată e la [](http://docs.racket-lang.org/reference/quasiquote.html).

## Unquote
Permite înlocuirea în corpul `quasiquote` a expresiei din `unquote` cu rezultatul evaluării sale:

```scheme
> (quasiquote (1 (unquote (+ 3 4)) 5))
'(1 7 5)
```

## Unquote-splicing
Rezultatul unei evaluări poate fi și o listă. Dacă aplicăm `unquote` pe așa ceva, introducem o listă în corpul `quasiquote`.

```scheme
> (quasiquote (1 (unquote (list 3 4)) 5))
'(1 (3 4) 5)
```

Uneori comportamentul dorit e să adauge elementele listei la corpul `quasiquote` și nu lista în sine. Am vrea să obținem `'(1 3 4 5)`:

```scheme
> (quasiquote (1 (unquote-splicing (list 3 4)) 5))
'(1 3 4 5)
```

Și, cum funcțiile astea au nume relativ lungi, le abreviem cu:
<table>
	<tr>
		<td>Nume funcție</td>
		<td>Abreviere</td>
	</tr>
	<tr>
		<td><pre>quote</pre></td>
		<td><pre>'</pre></td>
	</tr>
	<tr>
		<td><pre>quasiquote</pre></td>
		<td><pre>`</pre></td>
	</tr>
	<tr>
		<td><pre>unquote</pre></td>
		<td><pre>,</pre></td>
	</tr>
	<tr>
		<td><pre>unquote-splicing</pre></td>
		<td><pre>,@</pre></td>
	</tr>
</table>

## Exerciții
1. Angry Birds e un joc în care se lansează păsări care devastează zone de raze diferite cu scopul de a aplatiza totul dintr-un nivel :)

    Noi vrem să aplatizăm doar niște țarcuri de porci, descrise printr-o listă (de simboluri):
	
	`'(pig pig - - - pig - - pig)`
	
	1    2  3 4 5  6   7 8  9
		
	Țarcurile goale sunt reprezentate prin simbolul `'-` iar cele cu un porc cu simbolul `'pig`.	
	
	O pasăre e descrisă de raza ei de acțiune, `r` și aruncătura de poziția în care cade, `p`. Toți porcii din raza de acțiune a unei păsări (adică cu poziții între p - r și p + r) explodează și țarcurile se golesc. Un țarc gol nu e afectat.
	
	Scrieți o funcție `(launch-angry-bird sty bird-range pos)` care întoarce lista țarcurilor după ce a fost lansată pasărea. `sty` e lista de țarcuri, `bird-range` e raza și `pos` e poziția în care aterizează.
	Funcția trebuie să aibă acest prototip. Dacă aveți nevoie de variabile suplimentare, puneți-le în interior cu un `letrec`.		

1. [Pig Latin](http://en.wikipedia.org/wiki/Pig_Latin) e un joc englezesc de cuvinte ale cărui reguli sunt descrise pe Wikipedia. Noi vom folosi următoarea variantă simplificată:

   1. toate consoanele de la începutul cuvântului (până la prima vocală) sunt mutate la final (spaghetti -> paghetti s -> aghetti sp -> aghettisp) și se adaugă sufixul -ay (aghettispay).
   1. presupunem că toate cuvintele sunt liste de simboluri: '(s p a g h e t t i)
     
	 Scrieți funcția care transformă un cunvânt în Pig Latin și o funcție care transformă o propozițe întreagă. Pentru un bonus, folosiți [string-uri](http://docs.racket-lang.org/reference/strings.html) și eventual `string->symbol` și `symbol->string`.
	 
1. E o zi fierbinte de vară și ai ajuns în fața unui stand de înghețată. Știind că sunt:

	* 3 mărimi, '(small medium large)
	* 4 arome, '((velvety vanilla) (decadent chocolate) (rum raisin) (gross ginger))
	* poți cumpăra înghețata în con sau într-o cupă '(cone cup)

	Și că-ți place să știi exact ce variante ai, scrie o funcție care generează toate posibilitățile pentru acest meniu (meniul e lista cu categoriile de mai sus). Ar trebui să meargă pentru *orice* meniu.	
	
1. Generează toate combinările de `k` ale unei liste `l`.	

1. Implementați `foldl` și `foldr` (uitați-vă la articolul de la labul trecut).

1. Implementați `map` și `filter` folosind `fold`.
