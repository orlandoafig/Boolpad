(module letras racket

  (require racket/gui
           racket/class
           "const.rkt")

  (provide cria-var
           print-var
           print-bar)

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

  ;; Print da letra
  (define (print-var item tela x y)
    (define var (cria-var item))
    (send tela insert var x y)
    (values (+ x LARGURA-OBJETO) y))

  ;; Print da barra de negação
  (define (print-bar tela qtd x y)
    (for ([i qtd])
      (define var (cria-var "barra"))
      (if (= i 0)
          (send tela insert var x y)
          (send tela insert var (+ x (* i LARGURA-OBJETO)) y)))
    (values (+ x (* qtd LARGURA-OBJETO)) y))

 






  

























  )