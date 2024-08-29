SELECT p2.name AS person_name1, p.name AS person_name2, p.address AS common_address FROM person p
JOIN person p2 on p2.address = p.address AND p.id < p2.id
WHERE p.name != p2.name
ORDER BY 1, 2, 3;