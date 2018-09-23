;; SICP Exercise 1.7
;;
; The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

; defined sqrt procedure (with good-enough?):
(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(display (sqrt 3))

; 1. explain why this test is ineffective for small numbers
; For very small numbers, the hardcoded difference of 0.001 would be too large to get an accurate result.

; 2. explain why this test is ineffective for very large numbers
; For very large numbers, the hardcoded difference of 0.001 would be too small and cause the procedure to take way too long, or possibly never even result in the correct answer.

; 3. design a square root procedure that uses the strategy "watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess"
(define (good-enough? guess x)
    (< (abs (- guess (/ x guess)))
       (/ guess 1000000)) )
