(module janela racket

  (require racket/gui
           racket/class
           zippers
           "expressoes.rkt"
           "const.rkt"
           "regras.rkt"
           "eventos.rkt"
           "funcoesFoco.rkt"
           "imprimeExpressao.rkt")
  
  (provide (all-defined-out))

  ;; Expressão atual
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
        (send pb erase)
        (set! expr-atual-zip (move-in-tree expr-atual-zip key-event))
        (pp (rebuild expr-atual-zip) pb POSICAO-INICIAL ALTURA-EXPRESSAO))
      (super-new)))
  
  (define canv (new my-canvas%
                    [parent f]
                    [style '(no-hscroll no-vscroll)]))

  ; Tipo de editor do canvas (pasteboard para uso de snip)
  (define pb (new pasteboard%))
  (send canv set-editor pb)

  (define (print-example item)
    (define expr-atual null)
    (send pb erase)
    (cond
      [(= item 1)
         (set! expr-atual expr1)]
      [(= item 2)
         (set! expr-atual expr2)]
      [(= item 3)
         (set! expr-atual expr3)]
      [(= item 4)
         (set! expr-atual expr4)]
      [(= item 5)
         (set! expr-atual expr5)]
      [(= item 6)
         (set! expr-atual expr6)])
    (set! expr-atual (insere-foco expr-atual))
    (set! expr-atual-zip (zip expr-atual))
    (pp expr-atual pb POSICAO-INICIAL ALTURA-EXPRESSAO))

  ;; Menus

  ; Barra de menu
  (define mb (new menu-bar% [parent f]))

  ; Menu exemplos
  (define m-exemplos (new menu% [label "Exemplos"] [parent mb]))

  ; Menu regras
  (define m-regras (new menu% [label "Regras"] [parent mb]))

  ; Exemplo 1
  (define ex1 (new menu-item%
                        [label "A + A"]
                        [parent m-exemplos]
                        [callback (lambda _ (print-example 1))]))

  ; Exemplo 2
  (define ex2 (new menu-item%
                        [label "A + 'A"]
                        [parent m-exemplos]
                        [callback (lambda _ (print-example 2))]))

  ; Exemplo 3
  (define ex3 (new menu-item%
                        [label "A + AB"]
                        [parent m-exemplos]
                        [callback (lambda _ (print-example 3))]))

  ; Exemplo 4
  (define ex4 (new menu-item%
                        [label "A + 'AB"]
                        [parent m-exemplos]
                        [callback (lambda _ (print-example 4))]))

  ; Exemplo 5
  (define ex5 (new menu-item%
                        [label "AB + 'AB"]
                        [parent m-exemplos]
                        [callback (lambda _ (print-example 5))]))

  ; Exemplo 6
  (define ex6 (new menu-item%
                        [label "'(A + B)"]
                        [parent m-exemplos]
                        [callback (lambda _ (print-example 6))]))

  ; Identidade
  (define m-iden (new menu-item%
                      [label "Identidade"]
                      [parent m-regras]
                      [callback (lambda _
                                  (send pb erase)
                                  (set! expr-atual-zip (apply-rule 'iden expr-atual-zip))
                                  (pp (rebuild expr-atual-zip) pb POSICAO-INICIAL ALTURA-EXPRESSAO))]))

  ; Absorção
  (define m-absor (new menu-item%
                      [label "Absorção"]
                      [parent m-regras]
                      [callback (lambda _
                                  (send pb erase)
                                  (set! expr-atual-zip (apply-rule 'absor expr-atual-zip))
                                  (pp (rebuild expr-atual-zip) pb POSICAO-INICIAL ALTURA-EXPRESSAO))]))

  ; Idempotente
  (define m-idem (new menu-item%
                      [label "Idempotente"]
                      [parent m-regras]
                      [callback (lambda _
                                  (send pb erase)
                                  (set! expr-atual-zip (apply-rule 'idem expr-atual-zip))
                                  (pp (rebuild expr-atual-zip) pb POSICAO-INICIAL ALTURA-EXPRESSAO))]))
  ; Comutativa
  (define m-comm (new menu-item%
                      [label "Comutativa"]
                      [parent m-regras]
                      [callback (lambda _
                                  (send pb erase)
                                  (set! expr-atual-zip (apply-rule 'comm expr-atual-zip))
                                  (pp (rebuild expr-atual-zip) pb POSICAO-INICIAL ALTURA-EXPRESSAO))]))

  ; Evidência
  (define m-evid (new menu-item%
                      [label "Evidência"]
                      [parent m-regras]
                      [callback (lambda _
                                  (send pb erase)
                                  (set! expr-atual-zip (apply-rule 'evid expr-atual-zip))
                                  (pp (rebuild expr-atual-zip) pb POSICAO-INICIAL ALTURA-EXPRESSAO))]))

  ; Distributiva
  (define m-dist (new menu-item%
                      [label "Distributiva"]
                      [parent m-regras]
                      [callback (lambda _
                                  (send pb erase)
                                  (set! expr-atual-zip (apply-rule 'dist expr-atual-zip))
                                  (pp (rebuild expr-atual-zip) pb POSICAO-INICIAL ALTURA-EXPRESSAO))]))

  ; De Morgan
  (define m-dmor (new menu-item%
                      [label "De Morgan"]
                      [parent m-regras]
                      [callback (lambda _
                                  (send pb erase)
                                  (set! expr-atual-zip (apply-rule 'dmor expr-atual-zip))
                                  (pp (rebuild expr-atual-zip) pb POSICAO-INICIAL ALTURA-EXPRESSAO))]))


  



  
















  )