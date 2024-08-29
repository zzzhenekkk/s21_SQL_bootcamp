WITH MaleVisits AS (
    SELECT pz.name
    FROM person_order po 
    JOIN menu m ON m.id = po.menu_id 
    JOIN pizzeria pz ON pz.id = m.pizzeria_id
    JOIN person p ON po.person_id = p.id 
    WHERE p.gender = 'male'
),
FemaleVisits AS (
    SELECT pz.name
    FROM person_order po 
    JOIN menu m ON m.id = po.menu_id 
    JOIN pizzeria pz ON pz.id = m.pizzeria_id
    JOIN person p ON po.person_id = p.id 
    WHERE p.gender = 'female'
),
excFemale AS (
    SELECT * 
    FROM FemaleVisits 
    EXCEPT 
    SELECT * FROM MaleVisits
), 
excMale AS (
    SELECT * 
    FROM MaleVisits 
    EXCEPT 
    SELECT * FROM FemaleVisits
) 
SELECT name AS pizzeria_name FROM excFemale 
UNION  
SELECT name FROM excMale;
