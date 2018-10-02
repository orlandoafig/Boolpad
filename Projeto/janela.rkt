#lang racket

(require racket/gui
         racket/class
         "letras.rkt"
         "expressoes.rkt"
         games/cards
         "const.rkt")

(provide f tab)

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

(define (express item)
  (cond
    [(= item 1) (send pb insert A 400 ALTURA-EXPRESSAO)
                (send pb insert ou 471 ALTURA-EXPRESSAO)
                (send pb insert B 542 ALTURA-EXPRESSAO)]
    [(= item 2) (send pb insert A 400 ALTURA-EXPRESSAO)
                (send pb insert ou 471 ALTURA-EXPRESSAO)
                (send pb insert A 542 ALTURA-EXPRESSAO)
                (send pb insert B 614 ALTURA-EXPRESSAO)]))

;; Menus

; Barra de menu
(define mb (new menu-bar% [parent f]))

; Menu controlador de evento
;(define mc (new control-event% [event-type 'menu]))

; Menu exemplos
(define m-exemplos (new menu% [label "Exemplos"] [parent mb]))

; Exemplo 1
(define exemplo1 (new menu-item%
                      [label "A + B"]
                      [parent m-exemplos]
                      [callback (lambda _ (express 1))]))

; Exemplo 2
(define exemplo2 (new menu-item%
                      [label "A + AB"]
                      [parent m-exemplos]
                      [callback (lambda _ (express 2))]))



;;;;;;;;;;;;;;;;;;;;;;;;;;   Usando games/cards    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Table (frame)
(define tab (make-table "Learning Boolean Algebra" 19 7))

; Menu
(define mbar (make-object menu-bar% tab))
(define exemplos-menu (new menu% [label "Exemplos"] [parent mbar]))

;; Impressão das expressões exemplo na tela
(define (expressao num-item)
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
                         [callback (lambda _ (expressao 1))]))

; Exemplo 2
(define exemp2-item (new menu-item%
                         [label "A + AB"]
                         [parent exemplos-menu]
                         [callback (lambda _ (expressao 2))]))

(send tab card-face-up a-card)
(send tab card-face-up b-card)
(send tab card-face-up c-card)
(send tab card-face-up d-card)
(send tab card-face-up ou-card)
















