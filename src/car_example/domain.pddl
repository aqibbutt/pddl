(define (domain junction)
  (:requirements :typing :strips :preferences :constraints  :universal-preconditions :equality :conditional-effects)
  
  (:types
    position car - object
  )
  
  (:predicates
    (on ?car - car ?pos - position)
    ; (crossing ?car1 - car ?car2 - car ?pos1 - position ?pos2 - position)
    (accident ?car1 - car ?car2 - car ?pos - position)
    (parked ?car1 - car ?pos - position)
  )


    (:constraints
      (and
        (distinct ?car1 ?car2))
      )
    )
  ; (when
  ;     ;Antecedent
  ;     (and (has-hot-chocolate ?p ?c) (has-marshmallows ?c))
  ;     ;Consequence
  ;     (and (person-is-happy ?p))
  ; )
  ; (:action both-crossed
  ;   :parameters
  ;     (?car1 - car
  ;      ?car2 - car
  ;      ?pos1 - position
  ;      ?pos2 - position
  ;      ?pos_1_dest - position
  ;      ?pos_2_dest - position
  ;     )
  ;   :precondition
  ;     (and 
  ;       (on ?car1 ?pos1)
  ;       (on ?car2 ?pos2)
  ;       (not (= ?car1 ?car2)) 
  ;       (not (= ?pos1 ?pos2)) 
  ;       (not (= ?pos_1_dest ?pos_2_dest)) 
  ;     )
  ;   :effect
  ;     (and 
  ;       (on ?car1 ?pos_1_dest)
  ;       (on ?car2 ?pos_2_dest)
  ;       ; (crossing ?car1 ?car2 ?pos_1_dest ?pos_2_dest)
  ;     )
  ; )

   (:action Stop
    :parameters
      (?car1 - car
       ?pos1 - position
       ?pos_1_dest - position
      )
    :precondition
      (and 
        (on ?car1 ?pos1)
        ; (= ?pos1 ?pos_1_dest) 
      )
    :effect
      (and 
        (not (on ?car1 ?pos1))
        (on ?car1 ?pos_1_dest)
      )
  )
     
    
  (:action collide
    :parameters
      (?car1 - car
       ?car2 - car
       ?pos_init_1 - position
       ?pos_init_2 - position
       ?pos_dest_col - position
      )
    :precondition
      (and 
        (on ?car1 ?pos_init_1)
        (on ?car2 ?pos_init_2)
        (not (= ?car1 ?car2)) 
        (not (= ?pos_init_1 ?pos_init_2)) 
        (not (= ?pos_init_1 ?pos_dest_col)) 
        (not (= ?pos_init_2 ?pos_dest_col)) 
      )
    :effect
      (and 
        (on ?car1 ?pos_dest_col)
        (on ?car2 ?pos_dest_col)
        (not (on ?car1 ?car2 ?pos_dest_col))
        (accident ?car1 ?car2 ?pos_dest_col)
      )
  )
  
    (:action move
    :parameters (?car - car ?from - location ?to - location)
    :precondition (and (on ?car ?from))
    :effect (and (not (on ?car ?from))
                 (on ?car ?to))
  )
    
    (:action park
    :parameters (?car - car ?to - location)
    :precondition (and (on ?car ?to))
    :effect (and (on ?car ?to))
  )
)
