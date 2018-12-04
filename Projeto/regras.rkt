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

  ; Identidade
  (define (iden expr)
    (match expr
      [`("ou" ,a "0") a]
      [`("ou" "0" ,a) a]
      [`("e" ,a "1") a]
      [`("e" "1" ,a) a]))

  ; Absorção
  (define (absor expr)
    (match expr
      [`("ou" ,a "1") "1"]
      [`("ou" "1" ,a) "1"]
      [`("e" ,a "0") "0"]
      [`("e" "0" ,a) "0"]))
  
  ; Comutativo
  (define (comm expr)
    (match expr
      [`("ou" ,a ,b) `("ou" ,b ,a)]
      [`("e" ,a ,b) `("e" ,b ,a)]))

  ; Evidência
  (define (evid expr)
    (match expr
      [`("ou" ,a ("e" ,a ,b)) `("e" ,a ("group" ("ou" "1" ,b)))]
      [`("ou" ("e" ,a ,b) ,a) `("e" ("group" ("ou" "1" ,b)) ,a)]))

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
      [(equal? regra 'iden) (edit insere-foco (edit iden expr-zip))]
      [(equal? regra 'absor) (edit insere-foco (edit absor expr-zip))]
      [(equal? regra 'idem) (edit insere-foco (edit idem expr-zip))]
      [(equal? regra 'comm) (edit insere-foco (edit comm expr-zip))]
      [(equal? regra 'evid) (edit insere-foco (edit evid expr-zip))]
      [(equal? regra 'dist) (edit insere-foco (edit dist expr-zip))]
      [(equal? regra 'dmor) (edit insere-foco (edit dmor expr-zip))]
      [else (edit insere-foco expr-zip)]))









  










  )