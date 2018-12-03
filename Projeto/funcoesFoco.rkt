(module funcoesFoco racket

  (provide (all-defined-out))

  (define (insere-foco expr)
    (list "F" expr))

  (define (retira-foco expr)
    (car (remove "F" expr)))





  )