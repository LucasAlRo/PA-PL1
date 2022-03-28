
(define (domain drones2-actions)

    (:requirements :strips :typing :action-costs)

    (:types 
        deposit drone location crate contents person carrier num - object
    )

    (:predicates 
        (person-in-location ?p - person ?l - location)
        (crate-in-deposit ?c - crate ?d - deposit)
        (crate-content ?cr - crate ?co - contents)
        (person-needs ?p - person ?c - contents)
        (person-has-crate-with-content ?p - person ?co - contents)
        (drone-in-deposit ?dr - drone ?de - deposit)
        (drone-in-location ?d - drone ?l - location)
        (drone-has-crate ?d - drone ?c - crate)
        (drone-free ?d - drone)
        (carrier-in-deposit ?c - carrier ?d - deposit)
        (crate-in-carrier ?cr - crate ?c - carrier)
        (carrier-in-location ?c - carrier ?l - location)
        (next ?n1 ?n2 - num)
        (carrier-capacity ?c - carrier ?n - num)
        
    )

    (:functions
        (total-cost)
        (fly-cost-location ?ol ?dl - location)
        (fly-cost-deposit ?d - deposit ?l - location)
        (fly-cost-deposit-deposit ?d1 ?d2 - deposit)
    )

    (:action pickup-crate
    :parameters (?dr - drone ?c - crate ?de - deposit)
    :precondition (and  
        (drone-in-deposit ?dr ?de)
        (crate-in-deposit ?c ?de)
        (drone-free ?dr)
    )
    :effect (and 
        (not (drone-free ?dr))
        (drone-has-crate ?dr ?c)
        (not (crate-in-deposit ?c ?de))
        (increase (total-cost) 1)
    ))

    (:action put-crate-in-carrier
        :parameters (?dr - drone ?cr - crate ?c - carrier ?d - deposit ?actualNum - num ?newNum - num)
        :precondition (and 
            (drone-has-crate ?dr ?cr)
            (drone-in-deposit ?dr ?d)
            (carrier-in-deposit ?c ?d)
            (carrier-capacity ?c ?actualNum)
            (next ?actualNum ?newNum)
        )
        :effect (and 
            (carrier-capacity ?c ?newNum)
            (crate-in-carrier ?cr ?c)
            (not(drone-has-crate ?dr ?cr))
            (drone-free ?dr)
            (increase (total-cost) 1)
        )
    )
    
    (:action move-carrier-from-deposit
        :parameters (?dr - drone ?c - carrier ?d - deposit ?l - location)
        :precondition (and 
            (drone-free ?dr)
            (drone-in-deposit ?dr ?d)
            (carrier-in-deposit ?c ?d)
        )
        :effect (and 
            (not (carrier-in-deposit ?c ?d))
            (not (drone-in-deposit ?dr ?d))
            (carrier-in-location ?c ?l)
            (drone-in-location ?dr ?l)
            (increase (total-cost) (fly-cost-deposit ?d ?l))
            (increase (total-cost) (fly-cost-deposit-deposit ?d ?d))
        )
    )
    
    (:action move-carrier-to-deposit
        :parameters (?dr - drone ?c - carrier ?d - deposit ?l - location)
        :precondition (and 
            (drone-free ?dr)
            (drone-in-location ?dr ?l)
            (carrier-in-location ?c ?l)
        )
        :effect (and 
            (not (drone-in-location ?dr ?l))
            (not (carrier-in-location ?c ?l))
            (drone-in-deposit ?dr ?d)
            (carrier-in-deposit ?c ?d)
            (increase (total-cost) (fly-cost-deposit ?d ?l))
        )
    )
    
    (:action move-carrier-from-location
        :parameters (?dr - drone ?c - carrier ?ol - location ?dl - location)
        :precondition (and 
            (drone-free ?dr)
            (drone-in-location ?dr ?ol)
            (carrier-in-location ?c ?ol)
        )
        :effect (and 
            (not (drone-in-location ?dr ?ol))
            (not (carrier-in-location ?c ?ol))
            (drone-in-location ?dr ?dl)
            (carrier-in-location ?c ?dl)
            (increase (total-cost) (fly-cost-location ?ol ?dl))
        )
    )
    
    (:action pick-crate-from-carrier
        :parameters (?dr - drone ?c - carrier ?cr - crate ?l - location ?actualNum - num ?newNum - num)
        :precondition (and 
            (drone-free ?dr)
            (drone-in-location ?dr ?l)
            (carrier-in-location ?c ?l)
            (crate-in-carrier ?cr ?c)
            (carrier-capacity ?c ?actualNum)
            (next ?newNum ?actualNum)
        )
        :effect (and
            (not (drone-free ?dr))
            (drone-has-crate ?dr ?cr)
            (not (crate-in-carrier ?cr ?c)) 
            (carrier-capacity ?c ?newNum)
            (increase (total-cost) 1)
        )
    )
    
    (:action handle-crate
    :parameters (?dr - drone ?c - crate ?p - person ?l - location ?co - contents)
    :precondition (and  
        (drone-has-crate ?dr ?c)
        (drone-in-location ?dr ?l)
        (person-in-location ?p ?l)
        (person-needs ?p ?co)
        (crate-content ?c ?co)
    )
    :effect (and 
        (person-has-crate-with-content ?p ?co)
        (drone-free ?dr)
        (not (drone-has-crate ?dr ?c))
        (increase (total-cost) 1)
    ))

    (:action fly-over-from-deposit
    :parameters (?dr - drone ?de - deposit ?l - location)
    :precondition (and  
        (drone-in-deposit ?dr ?de)
    )
    :effect (and 
        (not (drone-in-deposit ?dr ?de))
        (drone-in-location ?dr ?l)
        (increase (total-cost) (fly-cost-deposit ?de ?l))
        (increase (total-cost) (fly-cost-deposit-deposit ?de ?de))
    ))  

    (:action fly-over-to-deposit
    :parameters (?dr - drone ?de - deposit ?l - location)
    :precondition (and  
        (drone-in-location ?dr ?l)
    )
    :effect (and 
        (not (drone-in-location ?dr ?l))
        (drone-in-deposit ?dr ?de)
        (increase (total-cost) (fly-cost-deposit ?de ?l))
    ))

    (:action fly-over-from-location
    :parameters (?dr - drone ?ol - location ?dl - location)
    :precondition (and  
        (drone-in-location ?dr ?ol)
    )
    :effect (and 
        (not (drone-in-location ?dr ?ol))
        (drone-in-location ?dr ?dl)
        (increase (total-cost) (fly-cost-location ?ol ?dl))
    ))

)
