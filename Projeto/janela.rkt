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
         (pp expr1 pb 400)
         (set! expr-atual expr1)]
      [(= item 2)
         (print-var A pb 400)
         (print-var ou pb 471)
         (print-var A-dois pb 542)
         (print-var B pb 613)
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






  
















  )