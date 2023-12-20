(define (problem car_collision)
	(:domain junction)
	(:objects
	red_car - car
	blue_car - car
	pos_r_1 - position
	pos_r_2 - position
	pos_b_1 - position
	pos_b_2 - position
	pos_collision - position
	)

	(:init
		(on red_car pos_r_1)
		(on blue_car pos_b_1)
	)
	(:goal 
		(collision red_car blue_car pos_collision)
	)
)