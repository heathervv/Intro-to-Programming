;; SICP Exercise 1.4
;;
;; Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; The above is setting the compound procedure a-plus-abs-b. The procedure is checking wether b is greater than 0, and returning either the primitive procedure + (if true) or the primitive procedure - if false. It then applies the +/- to both a and b.
