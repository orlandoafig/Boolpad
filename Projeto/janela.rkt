#lang racket

(require racket/gui
         racket/class
         "letras.rkt"
         "expressoes.rkt"
         games/cards
         "const.rkt")

(provide f tab expr-atual)

;; Janela

(define f (new frame%
               [label "Learning Boolean Algebra"]
               [width LARGURA-JANELA]
               [height ALTURA-JANELA]
               [alignment '(center center)]))

; Canvas para edição
(define my-canvas (new editor-canvas%
                       [parent f]
                       [style '(no-hscroll no-vscroll)]))

; Tipo de editor do canvas
(define pb (new pasteboard%))
(send my-canvas set-editor pb)

;; Impressão das expressões exemplo na tela

(define expr-atual null)

(define (expressao item)
  (cond
    [(= item 1) (print-a pb 400)
                (print-ou pb 471)
                (print-b pb 542)
                (set! expr-atual expr1)]
    [(= item 2) (print-a pb 400)
                (print-ou pb 471)
                (print-a-dois pb 542)
                (print-b pb 613)
                (set! expr-atual expr2)]))

;; Menus

; Barra de menu
(define mb (new menu-bar% [parent f]))

; Menu exemplos
(define m-exemplos (new menu% [label "Exemplos"] [parent mb]))

; Exemplo 1
(define exemplo1 (new menu-item%
                      [label "A + B"]
                      [parent m-exemplos]
                      [callback (lambda _ (expressao 1))]))

; Exemplo 2
(define exemplo2 (new menu-item%
                      [label "A + AB"]
                      [parent m-exemplos]
                      [callback (lambda _ (expressao 2))]))



;;;;;;;;;;;;;;;;;;;;;;;;;;   Usando games/cards    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Table (frame)
(define tab (make-table "Learning Boolean Algebra" 19 7))

; Menu
(define mbar (make-object menu-bar% tab))
(define exemplos-menu (new menu% [label "Exemplos"] [parent mbar]))

;; Impressão das expressões exemplo na tela
(define (express num-item)
  (cond
    [(= num-item 1) (send tab add-region expr1-region)
                    (send tab add-cards-to-region (list b-card ou-card a-card) expr1-region)
                    ; Mantendo na regiao
                    (send a-card home-region expr1-region)
                    (send b-card home-region expr1-region)
                    (send ou-card home-region expr1-region)]
    [(= num-item 2) (send tab add-region expr2-region)
                    (send tab add-cards-to-region (list b-card a-card ou-card a-card) expr1-region)
                    ; Mantendo na regiao
                    (send a-card home-region expr2-region)
                    (send b-card home-region expr2-region)
                    (send ou-card home-region expr2-region)]))

; Exemplo 1
(define exemp1-item (new menu-item%
                         [label "A + B"]
                         [parent exemplos-menu]
                         [callback (lambda _ (express 1))]))

; Exemplo 2
(define exemp2-item (new menu-item%
                         [label "A + AB"]
                         [parent exemplos-menu]
                         [callback (lambda _ (express 2))]))

(send tab card-face-up a-card)
(send tab card-face-up b-card)
(send tab card-face-up c-card)
(send tab card-face-up d-card)
(send tab card-face-up ou-card)
















