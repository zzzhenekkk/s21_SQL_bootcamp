SELECT pizza_name, pizzeria.name AS pizzeria_name, price
FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza'
ORDER BY 1,2;
