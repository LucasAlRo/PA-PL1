
(define (domain drones3)

    (:requirements :strips :typing :durative-actions)

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

    (:durative-action pickup-crate
    :parameters (?dr - drone ?c - crate ?de - deposit)
    :duration (= ?duration 1)
    :condition (and
        (at start (and
            (crate-in-deposit ?c ?de)
            (drone-free ?dr)
        )) 
        (over all (and
            (drone-in-deposit ?dr ?de)
        )) 
        
    )
    :effect (and
        (at start (and
            (not (drone-free ?dr))
            (not (crate-in-deposit ?c ?de))
        )) 
        (at end (and
            (drone-has-crate ?dr ?c)
        ))
        
    ))

    (:durative-action put-crate-in-carrier
        :parameters (?dr - drone ?cr - crate ?c - carrier ?d - deposit ?actualNum - num ?newNum - num)
        :duration (= ?duration 1)
        :condition (and 
            (at start (and
                (drone-has-crate ?dr ?cr)
                (next ?actualNum ?newNum)
                (carrier-capacity ?c ?actualNum)
            ))
            
            (over all (and
                (drone-in-deposit ?dr ?d)
                (carrier-in-deposit ?c ?d)   
            ))     
        )
        :effect (and

            (at end (and
                (carrier-capacity ?c ?newNum)
                (crate-in-carrier ?cr ?c)
                (not(drone-has-crate ?dr ?cr))
                (drone-free ?dr)
            ))       
        )
    )
    
    (:durative-action move-carrier-from-deposit
        :parameters (?dr - drone ?c - carrier ?d - deposit ?l - location)
        :duration (= ?duration (fly-cost-deposit ?d ?l))
        :condition (and
            (at start (and
                (drone-free ?dr)
                (drone-in-deposit ?dr ?d)
                (carrier-in-deposit ?c ?d)
            ))      
        )
        :effect (and

            (at start (and
                (not (carrier-in-deposit ?c ?d))
                (not (drone-in-deposit ?dr ?d))
            )) 
            (at end (and
                (carrier-in-location ?c ?l)
                (drone-in-location ?dr ?l)
                (increase (total-cost) (fly-cost-deposit ?d ?l))
            ))
            
        )
    )
    
    (:durative-action move-carrier-to-deposit
        :parameters (?dr - drone ?c - carrier ?d - deposit ?l - location)
        :duration (= ?duration (fly-cost-deposit ?d ?l))
        :condition (and
            (at start (and
                (drone-free ?dr)
                (drone-in-location ?dr ?l)
                (carrier-in-location ?c ?l)
            ))      
        )
        :effect (and

            (at start (and
                (not (drone-in-location ?dr ?l))
                (not (carrier-in-location ?c ?l))
            )) 
            (at end (and
                (drone-in-deposit ?dr ?d)
                (carrier-in-deposit ?c ?d)
                (increase (total-cost) (fly-cost-deposit ?d ?l))
            ))    
        )
    )
    
    (:durative-action move-carrier-from-location
        :parameters (?dr - drone ?c - carrier ?ol - location ?dl - location)
        :duration (= ?duration (fly-cost-location ?ol ?dl))
        :condition (and 
            (at start (and
                (drone-free ?dr)
                (drone-in-location ?dr ?ol)
                (carrier-in-location ?c ?ol)
            ))   
        )
        :effect (and 

            (at start (and
                (not (drone-in-location ?dr ?ol))
                (not (carrier-in-location ?c ?ol))
            ))
            (at end (and
                (drone-in-location ?dr ?dl)
                (carrier-in-location ?c ?dl)
                (increase (total-cost) (fly-cost-location ?ol ?dl))
            ))  
        )
    )
    
    (:durative-action pick-crate-from-carrier
        :parameters (?dr - drone ?c - carrier ?cr - crate ?l - location ?actualNum - num ?newNum - num)
        :duration (= ?duration 1)
        :condition (and
            (at start (and
                (drone-free ?dr)
                (crate-in-carrier ?cr ?c)
                (carrier-capacity ?c ?actualNum)
                (next ?newNum ?actualNum)
            )) 
            
            (over all (and
                (drone-in-location ?dr ?l)
            (carrier-in-location ?c ?l)
            ))
               
        )
        :effect (and

            (at start (and
                (carrier-capacity ?c ?newNum)
            ))

            (at end (and
                (not (drone-free ?dr))
                (drone-has-crate ?dr ?cr)
                (not (crate-in-carrier ?cr ?c)) 
            ))
            
        )
    )
    
    (:durative-action handle-crate
    :parameters (?dr - drone ?c - crate ?p - person ?l - location ?co - contents)
    :duration (= ?duration 1)
    :condition (and 

        (at start (and
            (drone-has-crate ?dr ?c)
        ))
        
        (over all (and
            (drone-in-location ?dr ?l)
            (person-in-location ?p ?l)
            (person-needs ?p ?co)
            (crate-content ?c ?co)
        ))
        
    )
    :effect (and 

        (at end (and
            (person-has-crate-with-content ?p ?co)
            (drone-free ?dr)
            (not (drone-has-crate ?dr ?c))
        ))
    ))

    (:durative-action fly-over-from-deposit
    :parameters (?dr - drone ?de - deposit ?l - location)
    :duration (= ?duration (fly-cost-deposit ?de ?l))
    :condition (and
        (at start (and
            (drone-in-deposit ?dr ?de)
        ))  
        
    )
    :effect (and

        (at start (and
            (not (drone-in-deposit ?dr ?de))
        )) 

        (at end (and
            (drone-in-location ?dr ?l)
            (increase (total-cost) (fly-cost-deposit ?de ?l))
        ))    
    ))  

    (:durative-action fly-over-to-deposit
    :parameters (?dr - drone ?de - deposit ?l - location)
    :duration (= ?duration (fly-cost-deposit ?de ?l))
    :condition (and 
        (at start (and
            (drone-in-location ?dr ?l)
        )) 
        
    )
    :effect (and
        (at start (and
            (not (drone-in-location ?dr ?l))
        )) 
        (at end (and
            (drone-in-deposit ?dr ?de)
            (increase (total-cost) (fly-cost-deposit ?de ?l))
        ))     
    ))

    (:durative-action fly-over-from-location
    :parameters (?dr - drone ?ol - location ?dl - location)
    :duration (= ?duration (fly-cost-location ?ol ?dl))
    :condition (and
        (at start (and
            (drone-in-location ?dr ?ol)
        ))     
    )
    :effect (and 

        (at start (and
            (not (drone-in-location ?dr ?ol))
        ))
        (at end (and
            (drone-in-location ?dr ?dl)
            (increase (total-cost) (fly-cost-location ?ol ?dl))
        ))
        
    ))

)
