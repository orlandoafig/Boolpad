(module janela racket

  (require racket/gui
           racket/class
           zippers
           "letras.rkt"
           "expressoes.rkt"
           "const.rkt"
           "regras.rkt"
           "eventos.rkt")
  
  (provide (all-defined-out))

  ;; Expressão atual
  (define expr-atual null)
  (define expr-atual-zip null)

  ;; Janela
  (define f (new frame%
                 [label "Learning Boolean Algebra"]
                 [width LARGURA-JANELA]
                 [height ALTURA-JANELA]
                 [alignment '(center center)]))

  ; Canvas para edição
  (define my-canvas%
    (class editor-canvas%
      (define/override (on-char key-event)
        (cond
          [(equal? key-event left-list) (left/list expr-atual-zip)]
          [(equal? key-event right-list) (right/list expr-atual-zip)]
          [(equal? key-event up-tree) (up expr-atual-zip)]
          [(equal? key-event down-tree) (down/list-first expr-atual-zip)]))
      (super-new)))
  
  (define canv (new my-canvas%
                    [parent f]
                    [style '(no-hscroll no-vscroll)]))

  ; Tipo de editor do canvas (pasteboard para uso de snip)
  (define pb (new pasteboard%))
  (send canv set-editor pb)
  
  ;; Escolha das expressões exemplos e definição da expressão atual zipper
  (define (exemplo item)
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
         (set! expr-atual expr6)])
    (set! expr-atual-zip (zip expr-atual)))

  ;; Menus

  ; Barra de menu
  (define mb (new menu-bar% [parent f]))

  ; Menu exemplos
  (define m-exemplos (new menu% [label "Exemplos"] [parent mb]))

  ; Menu regras
  (define m-regras (new menu% [label "Regras"] [parent mb]))

  ; Exemplo 1
  (define ex1 (new menu-item%
                        [label "A + B"]
                        [parent m-exemplos]
                        [callback (lambda _ (exemplo 1))]))

  ; Exemplo 2
  (define ex2 (new menu-item%
                        [label "A + AB"]
                        [parent m-exemplos]
                        [callback (lambda _ (exemplo 2))]))

  ; Exemplo 3
  (define ex3 (new menu-item%
                        [label "A + A"]
                        [parent m-exemplos]
                        [callback (lambda _ (exemplo 3))]))

  ; Exemplo 4
  (define ex4 (new menu-item%
                        [label "(A + B)"]
                        [parent m-exemplos]
                        [callback (lambda _ (exemplo 4))]))

  ; Exemplo 5
  (define ex5 (new menu-item%
                        [label "'('A)"]
                        [parent m-exemplos]
                        [callback (lambda _ (exemplo 5))]))

  ; Exemplo 6
  (define ex6 (new menu-item%
                        [label "'(AB) + A"]
                        [parent m-exemplos]
                        [callback (lambda _ (exemplo 6))]))

  ; Idempotente
  (define m-idem (new menu-item%
                      [label "Idempotente"]
                      [parent m-regras]
                      [callback (lambda _ (apply-rule 'idem expr-atual-zip))]))
  ; Comutativa
  (define m-comm (new menu-item%
                      [label "Comutativa"]
                      [parent m-regras]
                      [callback (lambda _ (apply-rule 'comm expr-atual-zip))]))

  ; Evidência
  (define m-evid (new menu-item%
                      [label "Evidência"]
                      [parent m-regras]
                      [callback (lambda _ (apply-rule 'evid expr-atual-zip))]))

  ; Distributiva
  (define m-dist (new menu-item%
                      [label "Distributiva"]
                      [parent m-regras]
                      [callback (lambda _ (apply-rule 'dist expr-atual-zip))]))

  ; De Morgan
  (define m-dmor (new menu-item%
                      [label "De Morgan"]
                      [parent m-regras]
                      [callback (lambda _ (apply-rule 'dmor expr-atual-zip))]))


  



  
















  )