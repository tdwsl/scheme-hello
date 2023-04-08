; scheme test

(define (pow n x)
  (letrec ([f
    (lambda (o n x)
      (if (> x 1) (f o (* n o) (- x 1)) n))])
    (f n n x)))

(define (multiples m)
  (letrec ([f
    (lambda (i)
      (display (* m i)) (display " ")
      (if (< i 10) (f (+ i 1))))])
    (f 1))
  (newline))

(define (prime? n)
  (if (= n 1) #f
    (letrec ([f
      (lambda (i)
        (if (>= i n) #t
          (if (= (mod n i) 0) #f
            (f (+ i 1)))))])
      (f 2))))

(display "2^16 = ") (display (pow 2 16)) (newline)
(display "7*(1..10) = ") (multiples 7)

(newline) (display "Primes from 1..100:") (newline)
(letrec ([t 0] [primes
  (lambda (i)
    (if (prime? i) (begin
      (display i) (display " ")
      (set! t (+ t 1))
      (if (zero? (mod t 7)) (newline))))
    (if (< i 100) (primes (+ i 1))))])
  (primes 1)) (newline)

(exit)
