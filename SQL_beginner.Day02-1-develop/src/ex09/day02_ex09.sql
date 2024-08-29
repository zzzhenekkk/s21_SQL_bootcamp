SELECT name FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
WHERE p.gender = 'female' and pizza_name = 'pepperoni pizza' 
INTERSECT 
SELECT name FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
WHERE p.gender = 'female' and pizza_name = 'cheese pizza'
ORDER BY 1;