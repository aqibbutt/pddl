(define (problem crossing_scenario)
  (:domain junction)
  (:objects
    red_car - car
    blue_car - car
    init_pos_red - position
    init_pos_blue - position
    dest_pos_cross_red - position
    dest_pos_cross_blue - position
    dest_pos_collision - position
  )

  (:init
    (on red_car init_pos_red)
    (on blue_car init_pos_blue)
  )

  (:goal
    (crossing red_car blue_car dest_pos_cross_red dest_pos_cross_blue)
  )
)
