WITH WomenVisits AS (
    SELECT pv.pizzeria_id, COUNT(*) AS visits
    FROM person_visits pv
    JOIN person p ON pv.person_id = p.id
    WHERE p.gender = 'female'
    GROUP BY pv.pizzeria_id
),
MenVisits AS (
    SELECT pv.pizzeria_id, COUNT(*) AS visits
    FROM person_visits pv
    JOIN person p ON pv.person_id = p.id
    WHERE p.gender = 'male'
    GROUP BY pv.pizzeria_id
),
Gotovo AS (
    SELECT pz.name AS pizzeria_name, 'Women' AS more_visited_by
    FROM WomenVisits wv
    JOIN pizzeria pz ON wv.pizzeria_id = pz.id
    LEFT JOIN MenVisits mv ON wv.pizzeria_id = mv.pizzeria_id
    WHERE wv.visits > COALESCE(mv.visits, 0)
    UNION ALL
    SELECT pz.name, 'Men'
    FROM MenVisits mv
    JOIN pizzeria pz ON mv.pizzeria_id = pz.id
    LEFT JOIN WomenVisits wv ON mv.pizzeria_id = wv.pizzeria_id
    WHERE mv.visits > COALESCE(wv.visits, 0)
)
SELECT pizzeria_name FROM Gotovo
ORDER BY 1;

