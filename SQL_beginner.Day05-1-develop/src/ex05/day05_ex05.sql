CREATE UNIQUE INDEX idx_person_order_order_date ON person_order (person_id, menu_id) WHERE order_date = '2022-01-01';

EXPLAIN ANALYSE
SELECT person_id, menu_id FROM person_order WHERE order_date = '2022-01-01';



-- 1
-- Index Only Scan using idx_person_order_order_date on person_order  (cost=0.13..12.21 rows=5 width=16) (actual time=0.009..0.010 rows=5 loops=1)
-- 2
--   Heap Fetches: 5
-- 3
-- Planning Time: 0.102 ms
-- 4
-- Execution Time: 0.018 ms
