(define (domain junction)
  (:requirements :strips)
  (:predicates
    (at-junction ?car)
    (crossed ?car)
    (collision)
  )
  
  (:action cross
    :parameters (?car)
    :precondition (at-junction ?car)
    :effect (and (crossed ?car) (not (at-junction ?car)))
  )
  
  (:action wait
    :parameters (?car)
    :precondition (at-junction ?car)
    :effect (not (at-junction ?car))
  )
)