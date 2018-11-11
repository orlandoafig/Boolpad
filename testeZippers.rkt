#lang racket

(require zippers
         "Projeto/regras.rkt")

(define expr (zip '("ou" "A" "B")))

(define expr2 (zip '("ou" "A" ("e" "A" "B"))))

(define operador (down/car expr))

(define (2cdr exp) (down/cdr (down/cdr exp)))

(struct orr (terms) #:transparent)

(struct variable (name) #:transparent)

(define-struct-zipper-frames orr variable)

(define exxp (zip (orr '((variable A) (variable B) (variable C)))))

(define expp (zip (variable 'A)))

(define deep (zip '("ou" ("e" "A" ("ou" "C" "D" "E")) "B" ("e" "A" "B"))))































