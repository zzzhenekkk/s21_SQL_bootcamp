SELECT name, count_of_visits FROM (SELECT pv.person_id, COUNT(*) AS count_of_visits FROM person_visits pv GROUP BY pv.person_id) AS count_visit
JOIN person p ON p.id = count_visit.person_id
ORDER BY 2 DESC, 1
LIMIT 4;


SELECT name, COUNT(person_id) AS count_of_visits FROM person_visits pv
JOIN person p ON p.id = pv.person_id
GROUP BY p.name 
ORDER BY 2 DESC, 1
LIMIT 4;;
