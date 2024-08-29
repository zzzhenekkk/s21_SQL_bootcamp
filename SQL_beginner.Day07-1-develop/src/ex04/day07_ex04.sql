SELECT p.name, COUNT(p.name) AS count_of_visits FROM person_visits pv
JOIN person p ON pv.person_id = p.id
GROUP BY p.name
HAVING COUNT(p.name) > 3;
