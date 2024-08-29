(SELECT pz.name, COUNT(person_id), 'visit' AS action_type 
FROM person_visits pv 
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
GROUP BY pz.name
ORDER BY 2 DESC, 1
LIMIT 3)
UNION
(SELECT pz.name, COUNT(person_id), 'order' AS action_type 
FROM person_order po 
JOIN menu m ON m.id = po.menu_id 
JOIN pizzeria pz ON m.pizzeria_id = pz.id
GROUP BY pz.name
ORDER BY 2 DESC, 1
LIMIT 3)
ORDER BY 3, 2 DESC;




