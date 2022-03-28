(define (problem drone_problem_d1_r0_l10_p10_c20_g10_ct2)
(:domain drones)
(:objects
	drone1 - drone
	depot - deposit
	loc1 - location
	loc2 - location
	loc3 - location
	loc4 - location
	loc5 - location
	loc6 - location
	loc7 - location
	loc8 - location
	loc9 - location
	loc10 - location
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
	crate11 - crate
	crate12 - crate
	crate13 - crate
	crate14 - crate
	crate15 - crate
	crate16 - crate
	crate17 - crate
	crate18 - crate
	crate19 - crate
	crate20 - crate
	food - contents
	medicine - contents
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	person6 - person
	person7 - person
	person8 - person
	person9 - person
	person10 - person
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
	(crate-content crate7 food)

	(crate-in-deposit crate8 depot)
	(crate-content crate8 food)

	(crate-in-deposit crate9 depot)
	(crate-content crate9 food)

	(crate-in-deposit crate10 depot)
	(crate-content crate10 food)

	(crate-in-deposit crate11 depot)
	(crate-content crate11 food)

	(crate-in-deposit crate12 depot)
	(crate-content crate12 food)

	(crate-in-deposit crate13 depot)
	(crate-content crate13 food)

	(crate-in-deposit crate14 depot)
	(crate-content crate14 food)

	(crate-in-deposit crate15 depot)
	(crate-content crate15 food)

	(crate-in-deposit crate16 depot)
	(crate-content crate16 medicine)

	(crate-in-deposit crate17 depot)
	(crate-content crate17 medicine)

	(crate-in-deposit crate18 depot)
	(crate-content crate18 medicine)

	(crate-in-deposit crate19 depot)
	(crate-content crate19 food)

	(crate-in-deposit crate20 depot)
	(crate-content crate20 medicine)


	(person-in-location person1 loc2)
	(person-in-location person2 loc8)
	(person-in-location person3 loc6)
	(person-in-location person4 loc2)
	(person-in-location person5 loc9)
	(person-in-location person6 loc2)
	(person-in-location person7 loc5)
	(person-in-location person8 loc1)
	(person-in-location person9 loc10)
	(person-in-location person10 loc4)

	(person-needs person1 food)
	(person-needs person1 medicine)
	(person-needs person2 food)
	(person-needs person3 food)
	(person-needs person5 food)
	(person-needs person6 food)
	(person-needs person7 food)
	(person-needs person8 medicine)
	(person-needs person10 food)
	(person-needs person10 medicine)
)
(:goal (and

	(drone-in-deposit drone1 depot)

	(person-has-crate-with-content person1 food)
	(person-has-crate-with-content person1 medicine)
	(person-has-crate-with-content person2 food)
	(person-has-crate-with-content person3 food)
	(person-has-crate-with-content person5 food)
	(person-has-crate-with-content person6 food)
	(person-has-crate-with-content person7 food)
	(person-has-crate-with-content person8 medicine)
	(person-has-crate-with-content person10 food)
	(person-has-crate-with-content person10 medicine)
	))
)
