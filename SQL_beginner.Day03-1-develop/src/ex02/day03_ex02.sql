WITH id_no_ord AS (SELECT id AS menu_id FROM menu m
					EXCEPT
					SELECT po.menu_id FROM person_order po)
SELECT m2.pizza_name, m2.price, pz.name FROM id_no_ord
JOIN menu m2 ON m2.id = id_no_ord.menu_id
JOIN pizzeria pz ON pz.id = m2.pizzeria_id
ORDER BY 1, 2;