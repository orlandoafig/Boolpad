(module expressoes racket

  (require racket/gui
           "letras.rkt"
           "const.rkt")

  (provide expr1 expr2 expr3 expr4
           print-var
           pp)
  
  ;; Definindo expressões exemplos
  (define expr1 `("ou" "A" "B"))
  (define expr2 `("ou" "A" ("e" "A" "B")))
  (define expr3 `("ou" "A" "A"))
  (define expr4 `("group" ("ou" "A" "B")))

  ;; Print da letra
  (define (print-var item tela x)
    (define var (cria-var item))
    (send tela insert var x ALTURA-EXPRESSAO)
    (+ x LARGURA-OBJETO))

  ;; Print da barra de negação
  (define (print-bar tela qtd x y)
    (for ([i qtd])
      (define var (cria-var "barra"))
      (send tela insert var x y)
      (+ x )))

  ;; Imprimir expressão na tela
  (define (pp expr tela x)
    (match expr
      [`("ou" ,m ,n) (let* ([x1 (pp m tela x)]
                            [x2 (print-var "ou" tela x1)]
                            [x3 (pp n tela x2)])
                       x3)]
      [`("e" ,m ,n) (let* ([x1 (pp m tela x)]
                           [x2 (pp n tela x1)])
                      x2)]
      [`("not" ,m) (let* ([x1 (pp m x)]
                          [x2 (print-bar tela )])
                     x1)]
      [`("group" ,m) (let* ([x1 (print-var "abre-par" tela x)]
                            [x2 (pp m tela x1)]
                            [x3 (print-var "fecha-par" tela x2)])
                       x3)]
      [m (print-var m tela x)]))













  


















  )