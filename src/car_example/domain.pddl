(define (domain junction)
  (:requirements :typing)
  
  (:types
    position car - object
  )
  
  (:predicates
    (on ?car - car ?pos - position)
    (crossing ?car1 - car ?car2 - car ?pos1 - position ?pos2 - position)
    (accident ?car1 - car ?car2 - car ?pos - position)
  )

  (:action move
    :parameters
      (?car - car
       ?init_pos - position
       ?dest_pos - position)
    :precondition
      (and 
        (on ?car ?init_pos)
      )
    :effect
      (and 
        (on ?car ?dest_pos)
      )
  )

  (:action cross
    :parameters
      (?car1 - car
       ?car2 - car
       ?pos1 - position
       ?pos2 - position
       ?pos_1_dest - position
       ?pos_2_dest - position
      )
    :precondition
      (and 
        (on ?car1 ?pos1)
        (on ?car2 ?pos2)
      )
    :effect
      (and 
        (crossing ?car1 ?car2 ?pos_1_dest ?pos_2_dest)
      )
  )

  (:action collide
    :parameters
      (?car1 - car
       ?car2 - car
       ?pos - position)
    :precondition
      (and 
        (on ?car1 ?pos)
        (on ?car2 ?pos)
      )
    :effect
      (and 
        (accident ?car1 ?car2 ?pos)
      )
  )
)
