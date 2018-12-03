(module expressoes racket
  
  (provide (all-defined-out))
  
  ;; Expressões exemplos
  (define expr1 '("ou" "A" "A"))
  (define expr2 '("ou" "A" ("not" "A")))
  (define expr3 '("ou" "A" ("e" "A" "B")))
  (define expr4 '("ou" "A" ("e" ("not" "A") "B")))
  (define expr5 '("ou" ("e" "A" "B") ("e" ("not" "A") "B")))
  (define expr6 '("not" ("ou" "A" "B")))

  

















  


















  )