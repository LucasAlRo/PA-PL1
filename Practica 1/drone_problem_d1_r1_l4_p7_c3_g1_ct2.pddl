(define (problem drone_problem_d1_r1_l4_p7_c3_g1_ct2)
	(:domain drones)
	(:objects
		drone1 - drone
		depot - deposit
		loc1 - location
		loc2 - location
		loc3 - location
		crate1 - crate
		crate2 - crate
		crate3 - crate
		food - contents
		medicine - contents
		person1 - person
		person2 - person
		person3 - person
	)

	(:init

	(drone-in-deposit drone1 depot)
	(drone-free drone1)

	(crate-in-deposit crate1 depot)
	(crate-in-deposit crate2 depot)
	(crate-in-deposit crate3 depot)

	(person-in-location person1 loc1)
	(person-in-location person2 loc2)
	(person-in-location person3 loc3)

	(person-needs person1 food)
	(person-needs person2 food)

	(crate-content crate1 medicine)
	(crate-content crate2 food)
	(crate-content crate3 food)

	)

	(:goal (and
		(person-has-crate-with-content person1 food)
		(person-has-crate-with-content person2 food)
	))
)
