SELECT name, SUM(count) FROM 
((SELECT name, COUNT(person_id), 'visit' AS action_type
FROM person_visits
INNER JOIN pizzeria p ON p.id = person_visits.pizzeria_id
GROUP BY name
ORDER BY 2 DESC)
UNION
(SELECT p2.name, COUNT(person_id), 'order' AS action_type FROM person_order
INNER JOIN menu m ON m.id = person_order.menu_id
INNER JOIN pizzeria p2 ON p2.id = m.pizzeria_id
GROUP BY p2.name
ORDER BY 2 DESC)
ORDER BY action_type, 2 DESC) AS vo
GROUP BY name
ORDER BY 2 DESC, 1;

