(define (make-account balance pswd)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define times 0)
  (define (check-times no-use)
    (set! times (+ times 1))
    (display "Incorrect password")
    (if (= 7 times) (call-the-cops) ()))
  (define (call-the-cops)
    (error "Too many times of incorrect password"))
  (define (dispatch pass m)
    (if (eq? pass pswd)
	(begin
	  (set! times 0)
	  (cond ((eq? m 'withdraw) withdraw)
		((eq? m 'deposit) deposit)
		(else (error "Unknown request -- MAKE-ACCOUNT"
			     m))))
	check-times))
  dispatch)

(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40) ;;60

((acc 'some-other-password 'deposit) 50) ;;Incorrect password
;;;call-the-cops was evaluated at the 7th time

((acc 'secret-password 'deposit) 40) ;;100
