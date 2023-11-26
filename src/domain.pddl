(define (domain letseat) ;domain name
  
  ; (:requirements :typing) 
  
  (:types         
    location locatable - object
		bot cupcake - locatable
    robot - bot
  )
  
  (:predicates
    ; predicate ON with 2 parameter with type Locatable and location. true if Obj is on location
		(on ?obj - locatable ?loc - location)
		; predicate Holding with 2 parameter with type Locatable and locatable. true if arm is holding the cupcake
		(holding ?arm - locatable ?cupcake - locatable)
		; arm not holding anything
    (arm-empty)
    ; predicate name path with 2 params. true if path between two paths exist
    (path ?location1 - location ?location2 - location)
  )


  (:action pick-up ; action name
    :parameters
     (?arm - bot
      ?cupcake - locatable
      ?loc - location)
    :precondition
     (and 
        (on ?arm ?loc) ; arm must be on loc
        (on ?cupcake ?loc) ; cupcake must be on loc
        (arm-empty) ; arm must be empty
      )
    :effect
     (and 
        (not (on ?cupcake ?loc)) ; cupcake is no longer on the location
        (holding ?arm ?cupcake) ; arm is holding the cupcale
        (not (arm-empty)) ; arm is not empty
     )
  )

  (:action drop
    :parameters
     (?arm - bot
      ?cupcake - locatable
      ?loc - location)
    :precondition
     (and 
        (on ?arm ?loc)  ; arm is on given location
        (holding ?arm ?cupcake) ; arm is holding the cake
      )
    :effect
     (and 
        (on ?cupcake ?loc) ; cupcake on the loc
        (arm-empty) ; arm is empty now
        (not (holding ?arm ?cupcake)) ; arm is not holding anything
     )
  )

  (:action move
    :parameters
     (?arm - bot
      ?from - location
      ?to - location)
    :precondition
     (and 
      (on ?arm ?from) 
      (path ?from ?to)
     )
    :effect
     (and 
      (not (on ?arm ?from))
      (on ?arm ?to)
     )
  )
)