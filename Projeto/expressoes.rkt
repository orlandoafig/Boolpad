#lang racket

(require racket/gui
         racket/class
         "letras.rkt"
         games/cards)

(provide expr1 expr1-region
         expr2 expr2-region
         expr3)

;; Definindo expressões exemplos

(define expr1 `(ou A B))
(define expr2 `(ou A (e A B)))
(define expr3 `(ou A A))

;; Estrutura das expressões

; A + B
(define expr1-region (make-region 500 300 (* 4 LARGURA-OBJETO) (+ 50 ALTURA-OBJETO) "A + B" #f))

; A + AB
(define expr2-region (make-region 500 300 (* 4 LARGURA-OBJETO) ALTURA-OBJETO "A + AB" #f))


















