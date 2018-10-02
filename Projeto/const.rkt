#lang racket

(provide ALTURA-JANELA LARGURA-JANELA
         ALTURA-OBJETO LARGURA-OBJETO
         ALTURA-EXPRESSAO)

;---------------------------------- Constantes ---------------------------------;

;; Dimensões da janela
(define ALTURA-JANELA 730)
(define LARGURA-JANELA 1366)


; Dimensoes das imagens
(define ALTURA-OBJETO 96)
(define LARGURA-OBJETO 71)


;; Altura da expressão na tela
(define ALTURA-EXPRESSAO (/ ALTURA-JANELA 3))