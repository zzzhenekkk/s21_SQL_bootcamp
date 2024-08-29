SELECT pz.name
FROM pizzeria pz
WHERE pz.id NOT IN (SELECT pizzeria_id FROM person_visits);

SELECT pz.name
FROM pizzeria pz
WHERE NOT EXISTS (SELECT pv.pizzeria_id FROM person_visits pv WHERE pz.id = pv.pizzeria_id);