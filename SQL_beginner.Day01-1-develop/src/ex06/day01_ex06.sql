SELECT DISTINCT po.order_date AS action_date, (SELECT person.name FROM person WHERE person.id = po.person_id) AS person_name
FROM person_order po
INNER JOIN person_visits pv ON po.order_date = pv.visit_date
ORDER BY action_date ASC, person_name DESC;
