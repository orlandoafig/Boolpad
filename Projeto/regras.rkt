(module letras racket

  (require racket/match
           zippers
           "funcoesFoco.rkt")

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
      [`("ou" ,a ("e" ,a ,b)) `("e" ,a ("ou" "1" ,b))]))

  ; De Morgan
  (define (dmor expr)
    (match expr
      [`("not" ("ou" ,a ,b)) `("e" ("not" ,a) ("not" ,b))]
      [`("not" ("e" ,a ,b)) `("ou" ("not" ,a) ("not" ,b))]))

  ; Distributiva
  (define (dist expr)
    (match expr
      [`("e" ,a ("ou" ,b ,c)) `("ou" ("e" ,a ,b) ("e" ,a ,c))]
      [`("ou" ,a ("e" ,b ,c)) `("e" ("group" ("ou" ,a ,b)) ("group" ("ou" ,a ,c)))]))


  ;; Aplicação da regra
  (define (apply-rule regra expr-zip)
    (set! expr-zip (edit retira-foco expr-zip))
    (cond
      [(equal? regra 'idem) (edit insere-foco (edit idem expr-zip))]
      [(equal? regra 'comm) (edit insere-foco (edit comm expr-zip))]
      [(equal? regra 'evid) (edit insere-foco (edit evid expr-zip))]
      [(equal? regra 'dist) (edit insere-foco (edit dist expr-zip))]
      [(equal? regra 'dmor) (edit insere-foco (edit dmor expr-zip))]
      [else (edit insere-foco expr-zip)]))









  










  )