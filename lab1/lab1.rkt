; Decomentați linia de mai jos dacă folosiți Dr. Racket
#lang racket

; Câteva expresii simple
(+ 2 3 5 6)
(* (+ 1 4) (- 4 3))

; Define
(define r 10)
(* pi r r)

; Asta nu funcționează, r a fost legat și nu mai poate fi redefinit
; Nu este o variabiliă
; (define r 5)
; (* pi r r)

(define t 'text-oarecare:p)


; Definirea unor funcții
(define (square x) (* x x))

(define (disc-area r) 
  (* pi (square r)))

; Definirea unor funcții folosind lambda
(define ring-area ; aria unui disc cu rază exterioară r1 și interioară r2
  (lambda (r1 r2) 
    (- (disc-area r1) 
       (disc-area r2))))

; Prima funcție recursivă 
(define (factorial n)
  (if (= n 0) 1
      (* n (factorial (- n 1)))))

; Liste
'( 1 2 3)
(cons 1 (cons 2 (cons 3 '())))
(list 1 2 3)
(equal? (list 1 2 3) '(1 2 3))
'() ; constructor nular
(cons 1 '(2 3)) ; cons
(car '(1 2 3)) ; head
(cdr '(1 2 3)) ; tail

; Al n-lea element al unei liste
(define (nth l n)
  (if (= n 1) 
    (car l)
    (nth (cdr l) (- n 1))))

; Ce-ar face (nth '(1 2 3) 23) ?

; Afișează fiecare element dintr-o listă pe câte o linie 
(define (display-list l)
  (if (empty? (cdr l))
    (printf "~a~n" (car l))
    (begin
      (printf "~a~n" (car l))
      (display-list (cdr l)))))

