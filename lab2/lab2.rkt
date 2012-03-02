(define (reverse-list-acc l a)
  (if (empty? l) a
      (reverse-list-acc (cdr l) (cons (car l) a))))

(define (reverse-list l)
  (reverse-list-acc l '()))

(define (quicksort l p)
  (if (or (empty? l) (empty? (cdr l))) l
      (let* ((pivot (car l))
	     (rest (cdr l))
	     (greater (quicksort (filter (lambda (x) (p pivot x)) rest) p))
	     (smaller (quicksort (filter (lambda (x) (not (p pivot x))) rest) p)))
	(append smaller (list pivot) greater))))