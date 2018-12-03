(module imprimeExpressao racket

  (require "letras.rkt"
           "const.rkt")

  (provide (all-defined-out))

  ;; Função que imprime expressão na tela
  (define (pp expr tela x y)
    (match expr
      [`("ou" ,m ,n) (let*-values ([(x1 y1) (pp m tela x y)]
                                   [(x2 y2) (print-var "ou" tela x1 y)]
                                   [(x3 y3) (pp n tela x2 y)])
                                  (values x3 (min y1 y3)))]
      [`("e" ,m ,n) (let*-values ([(x1 y1) (pp m tela x y)]
                                  [(x2 y2) (pp n tela x1 y)])
                                 (values x2 (min y1 y2)))]
      [`("not" ,m) (let*-values ([(x1 y1) (pp m tela x y)]
                                 [(x2 y2) (print-bar tela
                                                     (/ (- x1 x) LARGURA-OBJETO)
                                                     x
                                                     (- y1 ALTURA-BARRA))])
                                (values x1 y2))]
      [`("group" ,m) (let*-values ([(x1 y1) (print-var "abre-par" tela x y)]
                                   [(x2 y2) (pp m tela x1 y)]
                                   [(x3 y3) (print-var "fecha-par" tela x2 y)])
                                  (values x3 (min y1 y2 y3)))]
      [`("F" ,m) (let*-values ([(x1 y1) (pp m tela x y)]
                               [(x2 y2) (print-bar tela
                                                   (/ (- x1 x) LARGURA-OBJETO)
                                                   x
                                                   (+ y1 ALTURA-FOCO))])
                              (values x1 y))]
      [m (print-var m tela x y)]))





)