(define (domain responsibility-attribution)
  (:requirements :equality :negative-preconditions :typing)
  (:types agent table time action - object)

  (:predicates 
      (lifted ?o - table) 
      (at ?a - agent ?o - table)
      (do ?a - agent ?act - action ?t - time)      
      )

   (:action lift
    :parameters (?a - agent ?o - table ?act - action ?t - time)
    :precondition (and (not (lifted ?o)) (at ?a ?o))
    :effect (and (lifted ?o) (do ?a ?act ?t))
  )

    (:action skip
    :parameters (?a - agent ?o - table)
    :precondition (not (lifted ?o))
    :effect (not (lifted ?o))
    )
)