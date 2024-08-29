SELECT p.address, pz.name, COUNT(p.id) FROM person p 
JOIN person_order po ON po.person_id = p.id
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON pz.id = m.pizzeria_id 
GROUP BY pz.name, p.address 
ORDER BY 1, 2, 3;
