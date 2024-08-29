CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id);

SET enable_seqscan = OFF;
EXPLAIN ANALYZE SELECT person_id FROM person_discounts;



-- 1
-- Index Only Scan using idx_person_discounts_unique on person_discounts  (cost=0.14..12.33 rows=13 width=8) (actual time=0.007..0.010 rows=13 loops=1)
-- 2
-- Heap Fetches: 13
-- 3
-- Planning Time: 0.034 ms
-- 4
-- Execution Time: 0.020 ms
