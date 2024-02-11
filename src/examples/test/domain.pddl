(define (domain traffic)
  (:requirements :typing :fluents :equality :negative-preconditions) 
  (:types car location signal_color time_step)

  (:predicates 
    (at ?c - car ?l - location ?t - time_step)
    (signal ?l - location ?s - signal_color ?t - time_step)
    (moving ?c - car ?l - location ?t - time_step)
    (collision ?t - time_step)
  )

  (:action move
    :parameters (?c - car ?from - location ?to - location ?sc - signal_color ?t - time_step ?next_t - time_step)
    :precondition (and (at ?c ?from ?t) (signal ?from ?sc ?t) (not (moving ?c ?from ?t)))
    :effect (and 
              (not (at ?c ?from ?t)) 
              (at ?c ?to ?next_t) 
              (moving ?c ?to ?next_t)
            )
  )

  (:action detect_collision
    :parameters (?c1 - car ?c2 - car ?l - location ?t - time_step)
    :precondition (and (moving ?c1 ?l ?t) (moving ?c2 ?l ?t) (not (= ?c1 ?c2)))
    :effect (collision ?t)
  )
  (:action skip
    :parameters (?c1 - car ?c2 - car ?l - location ?t - time_step)
    :precondition (and (at ?c1 ?l ?t)  (not (= ?c1 ?c2)))
    :effect (at ?c1 ?l ?t)
  )
)
