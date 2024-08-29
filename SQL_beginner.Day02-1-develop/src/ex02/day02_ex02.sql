SELECT COALESCE(p.name, '-') AS person_name, pv2.visit_date, COALESCE(pz.name, '-') AS pizzeria_name
FROM person p
FULL JOIN (SELECT * FROM person_visits pv WHERE pv.visit_date BETWEEN '2022-01-01' AND '2022-01-03') pv2 ON p.id = pv2.person_id
FULL JOIN pizzeria pz ON pz.id = pv2.pizzeria_id
ORDER BY 1,2,3;
