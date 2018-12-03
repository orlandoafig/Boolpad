(module eventos racket

  (require racket/gui
           zippers
           "funcoesFoco.rkt"
           "imprimeExpressao.rkt"
           "const.rkt")

  (provide (all-defined-out))

  ;; Função que escolhe a ação do teclado
  (define (move-in-tree expr-zip event)
    (set! expr-zip (edit retira-foco expr-zip))
    (cond
      [(equal? (send event get-key-code) 'left) (set! expr-zip (left/list expr-zip))]
      [(equal? (send event get-key-code) 'right) (set! expr-zip (right/list expr-zip))]
      [(equal? (send event get-key-code) 'up) (set! expr-zip (up expr-zip))]
      [(equal? (send event get-key-code) 'down) (set! expr-zip (right/list (down/list-first expr-zip)))])
    (edit insere-foco expr-zip))

 




  

















)