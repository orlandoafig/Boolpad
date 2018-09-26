#lang racket

(require racket/gui
         racket/class
         games/cards)

(provide A B C D ou a-card)

;---------------------------------------- Usando snips --------------------------------------------;

;; Definindo as letras e operações a serem usadas

(define A (make-object image-snip% "imagens/LetraA.png" 'png))

(define B (make-object image-snip% "imagens/LetraB.png" 'png))

(define C (make-object image-snip% "imagens/LetraC.png" 'png))

(define D (make-object image-snip% "imagens/LetraD.png" 'png))

(define ou (make-object image-snip% "imagens/OperadorOR.png" 'png))


;------------------------------------ Usando games/cards -------------------------------------;

(define a-bit (make-object bitmap% "imagens/LetraA.png" 'png))
(define a-card (make-card a-bit #f 1 1))

(define b-bit (make-object bitmap% "imagens/LetraB.png" 'png))
(define b-card (make-card b-bit #f 1 1))
















