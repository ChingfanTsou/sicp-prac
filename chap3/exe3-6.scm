(define rand
  (let ((x 1) (rand-update (lambda (y) (remainder (+ 3 (* 5 y)) 10000))))
    (lambda (m)
      (cond ((eq? m `generate) ((lambda () (set! x (rand-update x)) x)))
	    ((eq? m `reset) (lambda (new-init) (set! x new-init) ()))))))

(rand `generate)  ;;8
(rand `generate)  ;;43
(rand `generate)  ;;218
((rand `reset) 1) ;;()
(rand `generate)  ;;8
