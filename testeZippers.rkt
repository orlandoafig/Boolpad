#lang racket

(require zippers
         "Projeto/regras.rkt")

(define expr (zip '("ou" "A" "B")))

(define expr2 (zip '("ou" "A" ("e" "A" "B"))))

(define operador (down/car expr))

(define (2cdr exp) (down/cdr (down/cdr exp)))