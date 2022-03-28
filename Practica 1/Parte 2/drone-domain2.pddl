
(define (domain drones2)

    (:requirements :strips :fluents :typing)

    (:types 
        deposit drone location crate contents person carrier - object
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
        (drone-has-carrier ?d - drone ?c - carrier)
        (carrier-in-deposit ?c - carrier ?d - deposit)
        (crate-in-carrier ?cr - crate ?c - carrier)
    )


    (:functions 
        (carrier-capacity ?c - carrier)
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
        :parameters (?dr - drone ?cr - crate ?c - carrier ?d - deposit)
        :precondition (and 
            (drone-has-crate ?dr ?cr)
            (drone-in-deposit ?dr ?d)
            (carrier-in-deposit ?c ?d)
            (> (carrier-capacity ?c) 0)
        )
        :effect (and 
            (decrease (carrier-capacity ?c) 1)
            (crate-in-carrier ?cr ?c)
            (not(drone-has-crate ?dr ?cr))
            (drone-free ?dr)
        )
    )
    
    (:action take-carrier
        :parameters (?dr - drone ?c - carrier ?d - deposit)
        :precondition (and 
            (drone-free ?dr)
            (drone-in-deposit ?dr ?d)
            (carrier-in-deposit ?c ?d)
        )
        :effect (and 
            (not (drone-free ?dr))
            (not (carrier-in-deposit ?c ?d))
            (drone-has-carrier ?dr ?c)
        )
    )
    

    (:action release-carrier
        :parameters (?dr - drone ?c - carrier ?d - deposit)
        :precondition (and 
            (drone-has-carrier ?dr ?c)
            (drone-in-deposit ?dr ?d)
        )
        :effect (and 
            (not(drone-has-carrier ?dr ?c))
            (carrier-in-deposit ?c ?d)
        )
    )
    
    (:action handle-crate
    :parameters (?dr - drone ?cr - crate ?p - person ?l - location ?co - contents ?c - carrier)
    :precondition (and  
        (drone-has-carrier ?dr ?c)
        (crate-in-carrier ?cr ?c)
        (drone-in-location ?dr ?l)
        (person-in-location ?p ?l)
        (person-needs ?p ?co)
        (crate-content ?cr ?co)
    )
    :effect (and 
        (person-has-crate-with-content ?p ?co)
        (increase (carrier-capacity ?c) 1)
        (not(crate-in-carrier ?cr ?c))
    ))
    
    (:action fly-over-from-deposit
    :parameters (?dr - drone ?de - deposit ?l - location)
    :precondition (and  
        (drone-in-deposit ?dr ?de)
    )
    :effect (and 
        (not (drone-in-deposit ?dr ?de))
        (drone-in-location ?dr ?l)
    ))  

    (:action fly-over-to-deposit
    :parameters (?dr - drone ?de - deposit ?l - location)
    :precondition (and  
        (drone-in-location ?dr ?l)
    )
    :effect (and 
        (not (drone-in-location ?dr ?l))
        (drone-in-deposit ?dr ?de)
    ))

    (:action fly-over-from-location
    :parameters (?dr - drone ?ol - location ?dl - location)
    :precondition (and  
        (drone-in-location ?dr ?ol)
    )
    :effect (and 
        (not (drone-in-location ?dr ?ol))
        (drone-in-location ?dr ?dl)
    ))   

)
