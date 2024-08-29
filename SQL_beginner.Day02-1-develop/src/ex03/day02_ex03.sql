WITH visit AS (SELECT pv.visit_date
                FROM person_visits pv
                WHERE (pv.person_id = 1 OR pv.person_id = 2)),
    date AS (SELECT generate_series.date AS dates FROM generate_series(date '2022-01-01', date '2022-01-10', '1 day'))
SELECT date.dates AS missing_date
FROM date 
LEFT JOIN visit ON visit.visit_date = date.dates
WHERE visit_date is NULL;

