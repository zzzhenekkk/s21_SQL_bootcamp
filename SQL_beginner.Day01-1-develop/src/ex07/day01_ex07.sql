SELECT po.order_date AS date, CONCAT(
        p.name || ' (age:' || p.age || ')'
    ) AS person_information
FROM person_order po
    JOIN person p ON po.person_id = p.id
ORDER BY date, person_information;