(module expressoes racket

(require racket/gui
         "letras.rkt"
         games/cards
         "const.rkt")

(provide expr1 expr1-region
         expr2 expr2-region
         expr3)

;; Definindo expressões exemplos

(define expr1 `(ou A B))
(define expr2 `(ou A (e A B)))
(define expr3 `(ou A A))

;------------------------------------------------games/cards---------------------------------;

;; Estrutura das expressões com region

; A + B
(define expr1-region (make-region 500 300 (* 3 LARGURA-OBJETO) ALTURA-OBJETO #f #f))

; A + AB
(define expr2-region (make-region 500 300 (* 5 LARGURA-OBJETO) ALTURA-OBJETO #f #f))


















)