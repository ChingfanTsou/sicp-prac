(define (make-monitored f)
  (define n 0)
  (define (mf x)
    (cond ((eq? x 'how-many-calls?) n)
	  ((eq? x 'reset-count) (set! n 0))
	  (else (set! n (+ n 1)) (f x))))
  mf)

(define s (make-monitored sqrt))

(s 'how-many-calls?)

(s 10)

(s 'how-many-calls?) ;;1

(s 'reset-count)

(s 'how-many-calls?) ;;0
