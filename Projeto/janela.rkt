(module janela racket

  (require racket/gui
           racket/class
           "letras.rkt"
           "expressoes.rkt"
           "const.rkt")

  (provide f expr-atual)

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

  ; Tipo de editor do canvas (pasteboard para uso de snip)
  (define pb (new pasteboard%))
  (send my-canvas set-editor pb)

  ;; Escolha das expressões exemplos e definição da expressão atual
  (define expr-atual null)

  (define (expressao item)
    (send pb erase)
    (cond
      [(= item 1)
         (pp expr1 pb 400 ALTURA-EXPRESSAO)
         (set! expr-atual expr1)]
      [(= item 2)
         (pp expr2 pb 400 ALTURA-EXPRESSAO)
         (set! expr-atual expr2)]
      [(= item 3)
         (pp expr3 pb 400 ALTURA-EXPRESSAO)
         (set! expr-atual expr3)]
      [(= item 4)
         (pp expr4 pb 400 ALTURA-EXPRESSAO)
         (set! expr-atual expr4)]
      [(= item 5)
         (pp expr5 pb 400 ALTURA-EXPRESSAO)
         (set! expr-atual expr5)]
      [(= item 6)
         (pp expr6 pb 400 ALTURA-EXPRESSAO)
         (set! expr-atual expr6)]))

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

  ; Exemplo 3
  (define exemplo3 (new menu-item%
                        [label "A + A"]
                        [parent m-exemplos]
                        [callback (lambda _ (expressao 3))]))

  ; Exemplo 4
  (define exemplo4 (new menu-item%
                        [label "(A + B)"]
                        [parent m-exemplos]
                        [callback (lambda _ (expressao 4))]))

  ; Exemplo 5
  (define exemplo5 (new menu-item%
                        [label "'('A)"]
                        [parent m-exemplos]
                        [callback (lambda _ (expressao 5))]))

  ; Exemplo 6
  (define exemplo6 (new menu-item%
                        [label "'(AB) + A"]
                        [parent m-exemplos]
                        [callback (lambda _ (expressao 6))]))






  
















  )