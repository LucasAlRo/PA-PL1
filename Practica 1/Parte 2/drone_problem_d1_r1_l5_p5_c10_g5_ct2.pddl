(define (problem drone_problem_d1_r1_l5_p5_c10_g5_ct2)
(:domain drones2)
(:objects
	drone1 - drone
	depot - deposit
	loc1 - location
	loc2 - location
	loc3 - location
	loc4 - location
	loc5 - location
	crate1 - crate
	crate2 - crate
	crate3 - crate
	crate4 - crate
	crate5 - crate
	crate6 - crate
	crate7 - crate
	crate8 - crate
	crate9 - crate
	crate10 - crate
	food - contents
	medicine - contents
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	carrier1 - carrier
)
(:init
	(drone-in-deposit drone1 depot)
	(drone-free drone1)

	(crate-in-deposit crate1 depot)
	(crate-content crate1 medicine)

	(crate-in-deposit crate2 depot)
	(crate-content crate2 medicine)

	(crate-in-deposit crate3 depot)
	(crate-content crate3 medicine)

	(crate-in-deposit crate4 depot)
	(crate-content crate4 medicine)

	(crate-in-deposit crate5 depot)
	(crate-content crate5 medicine)

	(crate-in-deposit crate6 depot)
	(crate-content crate6 food)

	(crate-in-deposit crate7 depot)
	(crate-content crate7 medicine)

	(crate-in-deposit crate8 depot)
	(crate-content crate8 medicine)

	(crate-in-deposit crate9 depot)
	(crate-content crate9 food)

	(crate-in-deposit crate10 depot)
	(crate-content crate10 medicine)


	(person-in-location person1 loc1)
	(person-in-location person2 loc1)
	(person-in-location person3 loc2)
	(person-in-location person4 loc4)
	(person-in-location person5 loc4)

	(person-needs person1 medicine)
	(person-needs person2 medicine)
	(person-needs person3 food)
	(person-needs person5 food)
	(person-needs person5 medicine)
	(carrier-in-deposit carrier1 depot)
	(= (carrier-capacity carrier1) 4)
)
(:goal (and

	(drone-in-deposit drone1 depot)

	(person-has-crate-with-content person1 medicine)
	(person-has-crate-with-content person2 medicine)
	(person-has-crate-with-content person3 food)
	(person-has-crate-with-content person5 food)
	(person-has-crate-with-content person5 medicine)
	))
)
