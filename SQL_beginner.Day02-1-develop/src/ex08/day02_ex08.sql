WITH males AS (
    SELECT * FROM person p
    WHERE p.gender = 'male' AND (p.address = 'Moscow' OR p.address = 'Samara')
)
SELECT DISTINCT name FROM person_order po
JOIN males ON males.id = po.person_id
JOIN menu m ON m.id = po.menu_id
WHERE pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza'
ORDER BY 1 DESC;
