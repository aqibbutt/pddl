(define (problem traffic_scenario) (:domain traffic)
  (:objects 
    red_car blue_car - car
    loc1 loc2 loc3 - location
    red green - signal_color
    t0 t1 t2 t3 - time_step
  )

  (:init 
    (at red_car loc1 t0)
    (at blue_car loc2 t0)
    (signal loc2 green t0)
    (signal loc1 red t0)
  )

  (:goal 
    (and 
      (at red_car loc3 t2) 
      (at blue_car loc3 t2)
      (collision t2)
    )
  )
)
