SELECT generate_series.date AS missing_date
FROM generate_series(date '2022-01-01', date '2022-01-10', '1 day')
LEFT JOIN person_visits pv ON pv.visit_date = generate_series.date AND (pv.person_id = 1 or pv.person_id = 2)
WHERE pv.person_id is NULL;
