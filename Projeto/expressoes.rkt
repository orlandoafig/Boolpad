#lang racket

(require racket/gui
         racket/class
         "letras.rkt")

(provide expr1
         expr2
         expr3)

;; Definindo expressões exemplos

(define expr1 `(ou A B))
(define expr2 `(ou A (e A B)))
(define expr3 `(ou A A))