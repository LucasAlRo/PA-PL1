(define (problem drone_problem_d1_r0_l50_p3_c100_g4_ct2)
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
	loc11 - location
	loc12 - location
	loc13 - location
	loc14 - location
	loc15 - location
	loc16 - location
	loc17 - location
	loc18 - location
	loc19 - location
	loc20 - location
	loc21 - location
	loc22 - location
	loc23 - location
	loc24 - location
	loc25 - location
	loc26 - location
	loc27 - location
	loc28 - location
	loc29 - location
	loc30 - location
	loc31 - location
	loc32 - location
	loc33 - location
	loc34 - location
	loc35 - location
	loc36 - location
	loc37 - location
	loc38 - location
	loc39 - location
	loc40 - location
	loc41 - location
	loc42 - location
	loc43 - location
	loc44 - location
	loc45 - location
	loc46 - location
	loc47 - location
	loc48 - location
	loc49 - location
	loc50 - location
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
	crate21 - crate
	crate22 - crate
	crate23 - crate
	crate24 - crate
	crate25 - crate
	crate26 - crate
	crate27 - crate
	crate28 - crate
	crate29 - crate
	crate30 - crate
	crate31 - crate
	crate32 - crate
	crate33 - crate
	crate34 - crate
	crate35 - crate
	crate36 - crate
	crate37 - crate
	crate38 - crate
	crate39 - crate
	crate40 - crate
	crate41 - crate
	crate42 - crate
	crate43 - crate
	crate44 - crate
	crate45 - crate
	crate46 - crate
	crate47 - crate
	crate48 - crate
	crate49 - crate
	crate50 - crate
	crate51 - crate
	crate52 - crate
	crate53 - crate
	crate54 - crate
	crate55 - crate
	crate56 - crate
	crate57 - crate
	crate58 - crate
	crate59 - crate
	crate60 - crate
	crate61 - crate
	crate62 - crate
	crate63 - crate
	crate64 - crate
	crate65 - crate
	crate66 - crate
	crate67 - crate
	crate68 - crate
	crate69 - crate
	crate70 - crate
	crate71 - crate
	crate72 - crate
	crate73 - crate
	crate74 - crate
	crate75 - crate
	crate76 - crate
	crate77 - crate
	crate78 - crate
	crate79 - crate
	crate80 - crate
	crate81 - crate
	crate82 - crate
	crate83 - crate
	crate84 - crate
	crate85 - crate
	crate86 - crate
	crate87 - crate
	crate88 - crate
	crate89 - crate
	crate90 - crate
	crate91 - crate
	crate92 - crate
	crate93 - crate
	crate94 - crate
	crate95 - crate
	crate96 - crate
	crate97 - crate
	crate98 - crate
	crate99 - crate
	crate100 - crate
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
	(crate-content crate1 food)

	(crate-in-deposit crate2 depot)
	(crate-content crate2 medicine)

	(crate-in-deposit crate3 depot)
	(crate-content crate3 food)

	(crate-in-deposit crate4 depot)
	(crate-content crate4 food)

	(crate-in-deposit crate5 depot)
	(crate-content crate5 medicine)

	(crate-in-deposit crate6 depot)
	(crate-content crate6 food)

	(crate-in-deposit crate7 depot)
	(crate-content crate7 medicine)

	(crate-in-deposit crate8 depot)
	(crate-content crate8 food)

	(crate-in-deposit crate9 depot)
	(crate-content crate9 medicine)

	(crate-in-deposit crate10 depot)
	(crate-content crate10 food)

	(crate-in-deposit crate11 depot)
	(crate-content crate11 food)

	(crate-in-deposit crate12 depot)
	(crate-content crate12 medicine)

	(crate-in-deposit crate13 depot)
	(crate-content crate13 medicine)

	(crate-in-deposit crate14 depot)
	(crate-content crate14 medicine)

	(crate-in-deposit crate15 depot)
	(crate-content crate15 food)

	(crate-in-deposit crate16 depot)
	(crate-content crate16 food)

	(crate-in-deposit crate17 depot)
	(crate-content crate17 medicine)

	(crate-in-deposit crate18 depot)
	(crate-content crate18 medicine)

	(crate-in-deposit crate19 depot)
	(crate-content crate19 medicine)

	(crate-in-deposit crate20 depot)
	(crate-content crate20 medicine)

	(crate-in-deposit crate21 depot)
	(crate-content crate21 food)

	(crate-in-deposit crate22 depot)
	(crate-content crate22 food)

	(crate-in-deposit crate23 depot)
	(crate-content crate23 food)

	(crate-in-deposit crate24 depot)
	(crate-content crate24 food)

	(crate-in-deposit crate25 depot)
	(crate-content crate25 food)

	(crate-in-deposit crate26 depot)
	(crate-content crate26 food)

	(crate-in-deposit crate27 depot)
	(crate-content crate27 medicine)

	(crate-in-deposit crate28 depot)
	(crate-content crate28 medicine)

	(crate-in-deposit crate29 depot)
	(crate-content crate29 food)

	(crate-in-deposit crate30 depot)
	(crate-content crate30 food)

	(crate-in-deposit crate31 depot)
	(crate-content crate31 food)

	(crate-in-deposit crate32 depot)
	(crate-content crate32 medicine)

	(crate-in-deposit crate33 depot)
	(crate-content crate33 medicine)

	(crate-in-deposit crate34 depot)
	(crate-content crate34 medicine)

	(crate-in-deposit crate35 depot)
	(crate-content crate35 food)

	(crate-in-deposit crate36 depot)
	(crate-content crate36 medicine)

	(crate-in-deposit crate37 depot)
	(crate-content crate37 medicine)

	(crate-in-deposit crate38 depot)
	(crate-content crate38 medicine)

	(crate-in-deposit crate39 depot)
	(crate-content crate39 food)

	(crate-in-deposit crate40 depot)
	(crate-content crate40 medicine)

	(crate-in-deposit crate41 depot)
	(crate-content crate41 medicine)

	(crate-in-deposit crate42 depot)
	(crate-content crate42 food)

	(crate-in-deposit crate43 depot)
	(crate-content crate43 medicine)

	(crate-in-deposit crate44 depot)
	(crate-content crate44 medicine)

	(crate-in-deposit crate45 depot)
	(crate-content crate45 medicine)

	(crate-in-deposit crate46 depot)
	(crate-content crate46 medicine)

	(crate-in-deposit crate47 depot)
	(crate-content crate47 medicine)

	(crate-in-deposit crate48 depot)
	(crate-content crate48 medicine)

	(crate-in-deposit crate49 depot)
	(crate-content crate49 food)

	(crate-in-deposit crate50 depot)
	(crate-content crate50 medicine)

	(crate-in-deposit crate51 depot)
	(crate-content crate51 food)

	(crate-in-deposit crate52 depot)
	(crate-content crate52 food)

	(crate-in-deposit crate53 depot)
	(crate-content crate53 medicine)

	(crate-in-deposit crate54 depot)
	(crate-content crate54 medicine)

	(crate-in-deposit crate55 depot)
	(crate-content crate55 medicine)

	(crate-in-deposit crate56 depot)
	(crate-content crate56 medicine)

	(crate-in-deposit crate57 depot)
	(crate-content crate57 food)

	(crate-in-deposit crate58 depot)
	(crate-content crate58 medicine)

	(crate-in-deposit crate59 depot)
	(crate-content crate59 food)

	(crate-in-deposit crate60 depot)
	(crate-content crate60 food)

	(crate-in-deposit crate61 depot)
	(crate-content crate61 food)

	(crate-in-deposit crate62 depot)
	(crate-content crate62 food)

	(crate-in-deposit crate63 depot)
	(crate-content crate63 food)

	(crate-in-deposit crate64 depot)
	(crate-content crate64 food)

	(crate-in-deposit crate65 depot)
	(crate-content crate65 medicine)

	(crate-in-deposit crate66 depot)
	(crate-content crate66 medicine)

	(crate-in-deposit crate67 depot)
	(crate-content crate67 food)

	(crate-in-deposit crate68 depot)
	(crate-content crate68 food)

	(crate-in-deposit crate69 depot)
	(crate-content crate69 food)

	(crate-in-deposit crate70 depot)
	(crate-content crate70 medicine)

	(crate-in-deposit crate71 depot)
	(crate-content crate71 food)

	(crate-in-deposit crate72 depot)
	(crate-content crate72 food)

	(crate-in-deposit crate73 depot)
	(crate-content crate73 medicine)

	(crate-in-deposit crate74 depot)
	(crate-content crate74 medicine)

	(crate-in-deposit crate75 depot)
	(crate-content crate75 medicine)

	(crate-in-deposit crate76 depot)
	(crate-content crate76 medicine)

	(crate-in-deposit crate77 depot)
	(crate-content crate77 medicine)

	(crate-in-deposit crate78 depot)
	(crate-content crate78 medicine)

	(crate-in-deposit crate79 depot)
	(crate-content crate79 medicine)

	(crate-in-deposit crate80 depot)
	(crate-content crate80 food)

	(crate-in-deposit crate81 depot)
	(crate-content crate81 food)

	(crate-in-deposit crate82 depot)
	(crate-content crate82 medicine)

	(crate-in-deposit crate83 depot)
	(crate-content crate83 food)

	(crate-in-deposit crate84 depot)
	(crate-content crate84 food)

	(crate-in-deposit crate85 depot)
	(crate-content crate85 food)

	(crate-in-deposit crate86 depot)
	(crate-content crate86 medicine)

	(crate-in-deposit crate87 depot)
	(crate-content crate87 medicine)

	(crate-in-deposit crate88 depot)
	(crate-content crate88 food)

	(crate-in-deposit crate89 depot)
	(crate-content crate89 medicine)

	(crate-in-deposit crate90 depot)
	(crate-content crate90 medicine)

	(crate-in-deposit crate91 depot)
	(crate-content crate91 medicine)

	(crate-in-deposit crate92 depot)
	(crate-content crate92 medicine)

	(crate-in-deposit crate93 depot)
	(crate-content crate93 food)

	(crate-in-deposit crate94 depot)
	(crate-content crate94 food)

	(crate-in-deposit crate95 depot)
	(crate-content crate95 medicine)

	(crate-in-deposit crate96 depot)
	(crate-content crate96 food)

	(crate-in-deposit crate97 depot)
	(crate-content crate97 food)

	(crate-in-deposit crate98 depot)
	(crate-content crate98 food)

	(crate-in-deposit crate99 depot)
	(crate-content crate99 medicine)

	(crate-in-deposit crate100 depot)
	(crate-content crate100 medicine)


	(person-in-location person1 loc9)
	(person-in-location person2 loc48)
	(person-in-location person3 loc37)

	(person-needs person1 medicine)
	(person-needs person2 food)
	(person-needs person2 medicine)
	(person-needs person3 medicine)
)
(:goal (and

	(drone-in-deposit drone1 depot)

	(person-has-crate-with-content person1 medicine)
	(person-has-crate-with-content person2 food)
	(person-has-crate-with-content person2 medicine)
	(person-has-crate-with-content person3 medicine)
	))
)
