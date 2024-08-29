SELECT po.order_date AS date, CONCAT(
        pp.name || ' (age:' || pp.age || ')'
    ) AS person_information
FROM person_order po
    NATURAL JOIN (SELECT p.id AS person_id, p.name, p.age FROM person p) pp
ORDER BY date, person_information;
