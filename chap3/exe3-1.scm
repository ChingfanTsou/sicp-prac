(define (make-accumulator n)
  (lambda (x)
    (set! n (+ n x))
    n))

(define A (make-accumulator 5))

(A 10) ;;15

(A 10) ;;25
