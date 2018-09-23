;; SICP Exercise 1.6
;;
; Alyssa P. Hacker doesn't see why if needs to be provided as a special form. ``Why can't I just define it as an ordinary procedure in terms of cond?'' she asks. Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; Eva demonstrates the program for Alyssa:

(new-if (= 2 3) 0 5)
5

(new-if (= 1 1) 0 5)
0

; Delighted, Alyssa uses new-if to rewrite the square-root program:

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

; What happens when Alyssa attempts to use this to compute square roots? Explain.

; If is a special form - it doesn't use applicative-order to evaluate, it uses normal-order. cond uses applicative-order, which means it will evaluate the predicate functions for each clause to determine which consequent expression to evaluate and return. TLDR applicative-order evaluates subexpressions. This means that by using cond instead of if, the procedure will be stuck in a recursive loop and result in a stack overflow. if, using normal-order (aka lazy evaluation) only initiates recursion if the predicate returns false.
