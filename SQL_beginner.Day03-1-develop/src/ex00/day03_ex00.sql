SELECT m.pizza_name, m.price, pz.name as pizzeria_name, pv.visit_date  
FROM person_visits pv
JOIN person p ON p.id = pv.person_id 
JOIN menu m ON m.pizzeria_id = pv.pizzeria_id 
JOIN pizzeria pz ON pz.id = m.pizzeria_id 
WHERE p.name = 'Kate' and m.price between 800 and 1000
ORDER BY 1,2,3;