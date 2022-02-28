(define (problem airports-problem1) (:domain airports)
(:objects 
    a1 a2 - avion
    c1 c2 c3 - ciudad
    p1 p2 p3 p4 p5 - persona
)

(:init
    (avion-en-ciudad a1 c1)
    (avion-en-ciudad a2 c2)
    (persona-en-ciudad p1 c1)
    (persona-en-ciudad p2 c2)
    (persona-en-ciudad p3 c2)
    (persona-en-ciudad p4 c3)
    (persona-en-ciudad p5 c3)
    (= (fuel-maximo a1) 100)
    (= (fuel-maximo a2) 50)
    (= (fuel-actual a1) 0)
    (= (fuel-actual a2) 50)
    (= (fuel-consumido) 0)
    (= (distancia-entre-cidudades c1 c2) 50)
    (= (distancia-entre-cidudades c1 c3) 200)    
    (= (distancia-entre-cidudades c2 c1) 30)
    (= (distancia-entre-cidudades c2 c3) 80)
    (= (distancia-entre-cidudades c3 c1) 5)
    (= (distancia-entre-cidudades c3 c2) 20)
    (= (consumo-por-km a1) 0.5)
    (= (consumo-por-km a2) 1)
)

(:goal (and
    (persona-en-ciudad p1 c3)
    (persona-en-ciudad p2 c1)
    (persona-en-ciudad p3 c2)
    (persona-en-ciudad p4 c1)
    (persona-en-ciudad p5 c2)
))

;un-comment the following line if metric is needed
(:metric minimize (fuel-consumido))
)