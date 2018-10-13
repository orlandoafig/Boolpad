(module expressoes racket

  (require racket/gui
           "letras.rkt"
           "const.rkt")

  (provide expr1 expr2 expr3
           print-var
           pp)

  ;; Print da letra
  (define (print-var item tela x)
    (send tela insert item x ALTURA-EXPRESSAO)
    (+ x LARGURA-OBJETO))

  ;; Definindo expressões exemplos

  (define expr1 `(ou A B))
  (define expr2 `(ou A (e A-dois B)))
  (define expr3 `(ou A A-dois))

  ;; Imprimir expressão na tela
  (define (pp expr tela x)
    (match expr
      [m (print-var m tela x)]
      [`(ou ,m ,n) (let* ([x1 (pp m tela x)]
                          [x2 (print-var ou tela x1)]
                          [x3 (pp n tela x2)])
                     x3)]
      [`(e ,m ,n) (let* ([x1 (pp m tela x)]
                         [x2 (pp n tela x1)])
                    x2)]))













  


















  )