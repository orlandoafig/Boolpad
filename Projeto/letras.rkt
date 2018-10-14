(module letras racket

  (require racket/gui
           racket/class)

  (provide cria-var)

  ;---------------------------------------- Usando snips --------------------------------------------;

  ;; Definindo as letras e operações a serem usadas

  (define (cria-var simbolo)
    (cond
      [(equal? simbolo "A") (make-object image-snip% "imagens/LetraA.png" 'png)]
      [(equal? simbolo "B") (make-object image-snip% "imagens/LetraB.png" 'png)]
      [(equal? simbolo "C") (make-object image-snip% "imagens/LetraC.png" 'png)]
      [(equal? simbolo "D") (make-object image-snip% "imagens/LetraD.png" 'png)]
      [(equal? simbolo "ou") (make-object image-snip% "imagens/OperadorOR.png" 'png)]
      [(equal? simbolo "abre-par") (make-object image-snip% "imagens/AbreParenteses.png" 'png)]
      [(equal? simbolo "fecha-par") (make-object image-snip% "imagens/FechaParenteses.png" 'png)]
      [(equal? simbolo "barra") (make-object image-snip% "imagens/Barra.png" 'png)]))

 






  

























  )