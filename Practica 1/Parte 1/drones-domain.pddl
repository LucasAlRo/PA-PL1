
(define (domain drones)

    (:requirements :strips :fluents :typing)

    (:types 
        deposit drone location crate contents person - object
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
    )


    (:functions 
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
