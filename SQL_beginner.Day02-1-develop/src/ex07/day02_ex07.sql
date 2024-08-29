WITH pvp AS (
    SELECT * 
    FROM person_visits pv
    JOIN person p ON pv.person_id = p.id
    WHERE pv.visit_date = '2022-01-08' AND p.name = 'Dmitriy'
)
SELECT pz.name AS pizzeria_name, m.pizza_name 
FROM pvp
JOIN menu m ON m.pizzeria_id = pvp.pizzeria_id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
WHERE m.price < 800;
