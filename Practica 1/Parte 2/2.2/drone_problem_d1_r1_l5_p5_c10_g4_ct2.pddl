(define (problem drone_problem_d1_r1_l5_p5_c10_g4_ct2)
(:domain drones2-actions)
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
	n0 - num
	n1 - num
	n2 - num
	n3 - num
	n4 - num
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
	(crate-content crate4 food)

	(crate-in-deposit crate5 depot)
	(crate-content crate5 food)

	(crate-in-deposit crate6 depot)
	(crate-content crate6 medicine)

	(crate-in-deposit crate7 depot)
	(crate-content crate7 food)

	(crate-in-deposit crate8 depot)
	(crate-content crate8 medicine)

	(crate-in-deposit crate9 depot)
	(crate-content crate9 food)

	(crate-in-deposit crate10 depot)
	(crate-content crate10 food)


	(person-in-location person1 loc2)
	(person-in-location person2 loc2)
	(person-in-location person3 loc4)
	(person-in-location person4 loc1)
	(person-in-location person5 loc5)

	(person-needs person2 food)
	(person-needs person3 medicine)
	(person-needs person4 food)
	(person-needs person5 food)
	(carrier-in-deposit carrier1 depot)

	(next n0 n1)
	(next n1 n2)
	(next n2 n3)
	(next n3 n4)

	(carrier-capacity carrier1 n0)

	(= (fly-cost-deposit-deposit depot depot) 0)
	(= (fly-cost-deposit depot loc1) 185)
	(= (fly-cost-deposit depot loc2) 113)
	(= (fly-cost-deposit depot loc3) 238)
	(= (fly-cost-deposit depot loc4) 183)
	(= (fly-cost-deposit depot loc5) 168)
	(= (fly-cost-location loc1 loc1) 1)
	(= (fly-cost-location loc1 loc2) 83)
	(= (fly-cost-location loc1 loc3) 53)
	(= (fly-cost-location loc1 loc4) 155)
	(= (fly-cost-location loc1 loc5) 92)
	(= (fly-cost-location loc2 loc1) 83)
	(= (fly-cost-location loc2 loc2) 1)
	(= (fly-cost-location loc2 loc3) 133)
	(= (fly-cost-location loc2 loc4) 171)
	(= (fly-cost-location loc2 loc5) 120)
	(= (fly-cost-location loc3 loc1) 53)
	(= (fly-cost-location loc3 loc2) 133)
	(= (fly-cost-location loc3 loc3) 1)
	(= (fly-cost-location loc3 loc4) 184)
	(= (fly-cost-location loc3 loc5) 124)
	(= (fly-cost-location loc4 loc1) 155)
	(= (fly-cost-location loc4 loc2) 171)
	(= (fly-cost-location loc4 loc3) 184)
	(= (fly-cost-location loc4 loc4) 1)
	(= (fly-cost-location loc4 loc5) 64)
	(= (fly-cost-location loc5 loc1) 92)
	(= (fly-cost-location loc5 loc2) 120)
	(= (fly-cost-location loc5 loc3) 124)
	(= (fly-cost-location loc5 loc4) 64)
	(= (fly-cost-location loc5 loc5) 1)
)
(:goal (and

	(drone-in-deposit drone1 depot)

	(person-has-crate-with-content person2 food)
	(person-has-crate-with-content person3 medicine)
	(person-has-crate-with-content person4 food)
	(person-has-crate-with-content person5 food)
	))
)
