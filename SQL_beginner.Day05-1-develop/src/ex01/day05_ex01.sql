EXPLAIN ANALYZE
SELECT m.pizza_name, pz.name as pizzeria_name from menu m JOIN pizzeria pz ON pz.id = m.pizzeria_id;


-- 1
-- Hash Join  (cost=28.23..47.70 rows=750 width=64) (actual time=0.018..0.024 rows=18 loops=1)
-- 2
--   Hash Cond: (m.pizzeria_id = pz.id)
-- 3
--   ->  Seq Scan on menu m  (cost=0.00..17.50 rows=750 width=40) (actual time=0.006..0.007 rows=18 loops=1)
-- 4
--   ->  Hash  (cost=18.10..18.10 rows=810 width=40) (actual time=0.008..0.008 rows=6 loops=1)
-- 5
--         Buckets: 1024  Batches: 1  Memory Usage: 9kB
-- 6
--         ->  Seq Scan on pizzeria pz  (cost=0.00..18.10 rows=810 width=40) (actual time=0.004..0.005 rows=6 loops=1)
-- 7
-- Planning Time: 0.254 ms
-- 8
-- Execution Time: 0.045 ms
