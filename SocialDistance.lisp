(setq SAFETY_TABLE
  (list
(cons 13(cons 30 30))
(cons 6(cons 30 10))
(cons 27(cons 30 50))
(cons 13(cons 15 50))
(cons 13(cons 120 10))
(cons 27(cons 120 30))
(cons 6(cons 15 30))
   )
 )

(setq derivedSafeRec
  (lambda (distance duration exhalation table)
    (cond
      (
        (null table)
        nil
       )
      (
        (and(>= distance (car(car table)))
        (and
        (<= duration (car(cdr(car table))))
        (<= exhalation (cdr(cdr(car table))))
        )
          )
        t
        
        )
      (
        t
        (progn
        (funcall derivedSafeRec distance duration exhalation (cdr table)) 
          )
          )
      
        )
      )
    )
    

(setq listDerivedSafe
  (lambda (distance duration exhalation)
    (progn
    (funcall derivedSafeRec distance duration exhalation SAFETY_TABLE)
    )
    )
  )
  