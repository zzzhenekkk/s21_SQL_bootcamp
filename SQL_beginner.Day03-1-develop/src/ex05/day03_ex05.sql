WITH AndreyVisited AS (
    SELECT pv.pizzeria_id
    FROM person_visits pv
    JOIN person p ON p.id = pv.person_id 
    WHERE p.name = 'Andrey'
    GROUP BY pv.pizzeria_id
), 
AndreyOrdered AS (
    SELECT m.pizzeria_id
    FROM person_order po 
    JOIN person p ON p.id = po.person_id
    JOIN menu m ON m.id = po.menu_id
    WHERE p.name = 'Andrey'
    GROUP BY m.pizzeria_id
), 
ExceptVisitedOrdered AS (
    SELECT pizzeria_id FROM AndreyVisited 
    EXCEPT 
    SELECT pizzeria_id FROM AndreyOrdered
) 
SELECT pz.name AS pizzeria_name 
FROM ExceptVisitedOrdered
JOIN pizzeria pz ON pz.id = ExceptVisitedOrdered.pizzeria_id;
