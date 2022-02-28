;Header and description

(define (domain airports)

;remove requirements that are not needed
(:requirements :strips :numeric-fluents :typing)

(:types 
    persona avion ciudad - object
)

(:predicates ;todo: define predicates here
    (avion-en-ciudad ?a - avion ?c - ciudad)
    (persona-en-avion ?p - persona ?a - avion)
    (persona-en-ciudad ?p - persona ?c - ciudad)       
)

(:functions ;todo: define numeric functions here
    (fuel-actual ?a - avion)
    (fuel-maximo ?a - avion)
    (consumo-por-km ?a - avion)
    (fuel-consumido)
    (distancia-entre-cidudades ?co ?cd - ciudad)    
)

(:action embarcar
    :parameters (?p - persona ?a - avion ?c - ciudad)
    :precondition (and  
        (persona-en-ciudad ?p ?c) 
        (avion-en-ciudad ?a ?c))
    :effect (and 
        (not (persona-en-ciudad ?p ?c)) 
        (persona-en-avion ?p ?a))
)

(:action desembarcar
    :parameters (?p - persona ?a - avion ?c - ciudad)
    :precondition (and  
        (persona-en-avion ?p ?a) 
        (avion-en-ciudad ?a ?c))
    :effect (and 
        (persona-en-ciudad ?p ?c) 
        (not (persona-en-avion ?p ?a)))
)

(:action repostar
    :parameters (?a - avion)
    :precondition (and 
        (< (fuel-actual ?a) (fuel-maximo ?a)))
    :effect (and 
        (assign (fuel-actual ?a) (fuel-maximo ?a)))
)

(:action volar
    :parameters (?a - avion ?co ?cd - ciudad)
    :precondition (and 
        (avion-en-ciudad ?a ?co) 
        (>= (fuel-actual ?a) (* (distancia-entre-cidudades ?co ?cd) (consumo-por-km ?a)))
    )
    :effect (and 
        (not (avion-en-ciudad ?a ?co))
        (avion-en-ciudad ?a ?cd)
        (decrease (fuel-actual ?a) (* (distancia-entre-cidudades ?co ?cd) (consumo-por-km ?a)))
        (increase (fuel-consumido) (* (distancia-entre-cidudades ?co ?cd) (consumo-por-km ?a)))
    )
)

)