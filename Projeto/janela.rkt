#lang racket

(require racket/gui
         racket/class
         "letras.rkt"
         "expressoes.rkt"
         games/cards)

(provide f tab)

;; Janela

(define f (new frame%
               [label "Learning Boolean Algebra"]
               [width 1366]
               [height 730]
               [alignment '(center center)]))

; Canvas para edição
(define my-canvas (new editor-canvas%
                       [parent f]
                       [style '(no-hscroll no-vscroll)]))

; Tipo de editor do canvas
(define pb (new pasteboard%))
(send my-canvas set-editor pb)

;; Impressão das expressões exemplo na tela

(define (pretty-print expr)
  (send pb insert A 400 300)
  (send pb insert ou 471 300)
  (send pb insert B 542 300))

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
                      [callback (lambda _ (pretty-print expr1))]))



;;;;;;;;;;;;;;;;;;;;;;;;;;   Usando games/cards    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Table (frame)
(define tab (make-table "Learning Boolean Algebra" 19 7))

; Menu
(define mbar (make-object menu-bar% tab))
(define exemplos-menu (new menu% [label "Exemplos"] [parent mbar]))

;; Estrutura das expressões
(define expr1-region (make-region 100 300 (* 3 LARGURA-OBJETO) ALTURA-OBJETO #f))

;; Impressão das expressões exemplo na tela
(define expr1 (send tab add-region expr1-region))

; Exemplo 1
(define exemp1-item (new menu-item%
                         [label "A + B"]
                         [parent exemplos-menu]
                         [callback (lambda _ (expr1))]))

(send tab add-card a-card 50 50)
(send tab card-face-up a-card)
















