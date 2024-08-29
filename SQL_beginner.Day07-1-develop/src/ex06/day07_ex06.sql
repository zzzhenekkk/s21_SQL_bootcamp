

Пожалуйста, напишите инструкцию SQL, которая возвращает количество заказов, с
реднюю цену, максимальную цену и минимальную цену пиццы, продаваемой каждым 
рестораном-пиццерией. Результат должен быть отсортирован по названию пиццерии. 
Смотрите примерные данные ниже. Округлите среднюю цену до 2 плавающих чисел.




Please write a SQL statement that returns the number of orders, 
the average price, the maximum price and the minimum price for pizzas sold
by each pizzeria restaurant. The result should be sorted by pizzeria name. 
See the sample data below. Round the average price to 2 floating numbers.

name	count_of_orders	average_price	max_price	min_price
Best Pizza	5	780	850	700




SELECT name,
       COUNT(name) AS count_of_orders,
       ROUND(AVG(price), 2) AS average_price,
       MAX(price) AS max_price,
       MIN(price) AS min_price
FROM person_order po
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY name
ORDER BY 1;