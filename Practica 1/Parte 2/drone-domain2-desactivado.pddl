
(define (domain drones2-desactivado)

    (:requirements :strips :fluents :typing)

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
    ))

)
