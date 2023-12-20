(define (domain junction) ; domain name

  (:requirements :typing) 
  
  (:types         
    position car - object
  )
  
  (:predicates
    (on ?car - car ?pos1 - position)
    (collision ?car1 - car ?car2 - car ?pos1 - position)
  )

  (:action move ; action name
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

  (:action skip ; action name
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
        (on ?car ?init_pos)
     )
  )

  
  (:action accident ; action name
    :parameters
     (?car1 - car
      ?car2 - car   
      ?init_pos - position
      ?init_pos2 - position
      ?col_pos - position)
    :precondition
     (and 
        (on ?car1 ?init_pos)
        (on ?car2 ?init_pos2)
      )
    :effect
     (and 
        (on ?car1 ?col_pos)
        (on ?car2 ?col_pos)
        (collision ?car1 ?car2 ?col_pos)
     )
  )
)
