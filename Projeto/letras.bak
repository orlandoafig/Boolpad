#lang racket

(require racket/gui
         racket/class
         games/cards
         "const.rkt")

(provide A B C D ou
         print-a print-a-dois
         print-b
         print-c
         print-d
         print-ou
         a-card
         b-card
         c-card
         d-card
         ou-card)

;---------------------------------------- Usando snips --------------------------------------------;

;; Definindo as letras e operações a serem usadas

(define A (make-object image-snip% "imagens/LetraA.png" 'png))

(define A-dois (make-object image-snip% "imagens/LetraA.png" 'png))

(define B (make-object image-snip% "imagens/LetraB.png" 'png))

(define C (make-object image-snip% "imagens/LetraC.png" 'png))

(define D (make-object image-snip% "imagens/LetraD.png" 'png))

(define ou (make-object image-snip% "imagens/OperadorOR.png" 'png))

;; Print de cada letra

(define (print-a tela x) (send tela insert A x ALTURA-EXPRESSAO))
(define (print-a-dois tela x) (send tela insert A-dois x ALTURA-EXPRESSAO))

(define (print-b tela x) (send tela insert B x ALTURA-EXPRESSAO))

(define (print-c tela x) (send tela insert C x ALTURA-EXPRESSAO))

(define (print-d tela x) (send tela insert D x ALTURA-EXPRESSAO))

(define (print-ou tela x) (send tela insert ou x ALTURA-EXPRESSAO))


;------------------------------------ Usando games/cards -------------------------------------;

; Criando as letras
(define a-bit (make-object bitmap% "imagens/LetraA.png" 'png))
(define a-card (make-card a-bit #f 1 1))

(define b-bit (make-object bitmap% "imagens/LetraB.png" 'png))
(define b-card (make-card b-bit #f 1 1))

(define c-bit (make-object bitmap% "imagens/LetraC.png" 'png))
(define c-card (make-card c-bit #f 1 1))

(define d-bit (make-object bitmap% "imagens/LetraD.png" 'png))
(define d-card (make-card d-bit #f 1 1))

(define ou-bit (make-object bitmap% "imagens/OperadorOR.png" 'png))
(define ou-card (make-card ou-bit #f 1 1))

; Tirando o virar carta do duplo click
(send a-card user-can-flip #f)
(send b-card user-can-flip #f)
(send c-card user-can-flip #f)
(send d-card user-can-flip #f)
(send ou-card user-can-flip #f)


























