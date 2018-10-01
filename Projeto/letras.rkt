#lang racket

(require racket/gui
         racket/class
         games/cards)

(provide A B C D ou
         a-card
         b-card
         c-card
         d-card
         ou-card
         ALTURA-OBJETO
         LARGURA-OBJETO)

;---------------------------------------- Usando snips --------------------------------------------;

;; Definindo as letras e operações a serem usadas

(define A (make-object image-snip% "imagens/LetraA.png" 'png))

(define B (make-object image-snip% "imagens/LetraB.png" 'png))

(define C (make-object image-snip% "imagens/LetraC.png" 'png))

(define D (make-object image-snip% "imagens/LetraD.png" 'png))

(define ou (make-object image-snip% "imagens/OperadorOR.png" 'png))


;------------------------------------ Usando games/cards -------------------------------------;

; Criando as letras
(define a-bit (make-object bitmap% "imagens/LetraA.png" 'png))
(define a-card (make-card a-bit #f 1 1))

(define b-bit (make-object bitmap% "imagens/LetraB.png" 'png))
(define b-card (make-card b-bit #f 1 1))

(define c-bit (make-object bitmap% "imagens/LetraC.png" 'png))
(define c-card (make-card b-bit #f 1 1))

(define d-bit (make-object bitmap% "imagens/LetraD.png" 'png))
(define d-card (make-card b-bit #f 1 1))

(define ou-bit (make-object bitmap% "imagens/OperadorOR.png" 'png))
(define ou-card (make-card b-bit #f 1 1))

; Dimensoes das imagens
(define ALTURA-OBJETO 96)
(define LARGURA-OBJETO 71)

; Tirando o virar carta do duplo click
(send a-card user-can-flip #f)
(send b-card user-can-flip #f)
(send c-card user-can-flip #f)
(send d-card user-can-flip #f)
(send ou-card user-can-flip #f)


























