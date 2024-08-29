CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson VARCHAR DEFAULT 'Dmitriy',
    pprice NUMERIC DEFAULT 500,
    pdate DATE DEFAULT '2022-01-08'
)
RETURNS TABLE(pizzeria_name VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT DISTINCT pz.name
    FROM person_visits pv
    JOIN person p ON pv.person_id = p.id
    JOIN menu m ON pv.pizzeria_id = m.pizzeria_id
    JOIN pizzeria pz ON pz.id = m.pizzeria_id
    WHERE p.name = pperson
    AND m.price < pprice
    AND pv.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
