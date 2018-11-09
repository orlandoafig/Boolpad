(module letras racket

  (require racket/match
           zippers)

  (provide (all-defined-out))

  ;; Definindo regras booleanas

  ; Idempotente
  (define (idem expr)
    (match expr
      [`("ou" ,a ,a) a]
      [`("e" ,a ,a) a]))

  ; Comutativo
  (define (comm expr)
    (match expr
      [`("ou" ,a ,b) `("ou" ,b ,a)]
      [`("e" ,a ,b) `("e" ,b ,a)]))

  ; Evidência
  (define (evid expr)
    (match expr
      [`("ou" ,a ("e" ,a ,b)) `("e" ,a ("ou" 1 ,b))]))

  ; De Morgan
  (define (dmor expr)
    (match expr
      [`("not" ("ou" ,a ,b)) `("e" ("not" ,a) ("not" ,b))]
      [`("not" ("e" ,a ,b)) `("ou" ("not" ,a) ("not" ,b))]))

  ; Distributiva
  (define (dist expr)
    (match expr
      [`("e" ,a ("ou" ,b ,c)) `("ou" ("e" ,a ,b) ("e" ,a ,c))]
      [`("ou" ,a ("e" ,b ,c)) `("e" ("ou" ,a ,b) ("ou" ,a ,c))]))


  ;; Aplicação da regra
  (define (apply-rule regra expr)
    (cond
      [(= regra 'idem) (edit idem expr)]
      [(= regra 'comm) (edit comm expr)]
      [(= regra 'evid) (edit evid expr)]
      [(= regra 'dist) (edit dist expr)]
      [(= regra 'dmor) (edit dmor expr)]))









  










  )