(define (big-two-square-sum a b c)
  (if (and (< c a) (< c b))
      (+ (* a a) (* b b))
      (if (and (< b a) (< b c))
	  (+ (* a a) (* c c))
	  (+ (* b b) (* c c)))))

