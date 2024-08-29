CREATE INDEX idx_1 ON menu(pizzeria_id, pizza_name);

EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;




-- BEFORE
-- 1
-- Sort  (cost=3.51..3.55 rows=18 width=53) (actual time=0.161..0.163 rows=18 loops=1)
-- 2
--   Sort Key: m.pizza_name, (max(pz.rating) OVER (?))
-- 3
--   Sort Method: quicksort  Memory: 26kB
-- 4
--   ->  WindowAgg  (cost=2.77..3.13 rows=18 width=53) (actual time=0.087..0.099 rows=18 loops=1)
-- 5
--         ->  Sort  (cost=2.77..2.82 rows=18 width=21) (actual time=0.067..0.069 rows=18 loops=1)
-- 6
--               Sort Key: pz.rating
-- 7
--               Sort Method: quicksort  Memory: 26kB
-- 8
--               ->  Hash Join  (cost=1.14..2.40 rows=18 width=21) (actual time=0.018..0.037 rows=18 loops=1)
-- 9
--                     Hash Cond: (m.pizzeria_id = pz.id)
-- 10
-- 11
--                     ->  Hash  (cost=1.06..1.06 rows=6 width=15) (actual time=0.007..0.007 rows=6 loops=1)
-- 12
--                           Buckets: 1024  Batches: 1  Memory Usage: 9kB
-- 13
--                           ->  Seq Scan on pizzeria pz  (cost=0.00..1.06 rows=6 width=15) (actual time=0.003..0.004 rows=6 loops=1)
-- 14
-- Planning Time: 0.195 ms
-- 15
-- Execution Time: 0.189 ms


--  AFTER
-- 1
-- Sort  (cost=3.51..3.55 rows=18 width=53) (actual time=0.099..0.101 rows=18 loops=1)
-- 2
--   Sort Key: m.pizza_name, (max(pz.rating) OVER (?))
-- 3
--   Sort Method: quicksort  Memory: 26kB
-- 4
--   ->  WindowAgg  (cost=2.77..3.13 rows=18 width=53) (actual time=0.041..0.052 rows=18 loops=1)
-- 5
--         ->  Sort  (cost=2.77..2.82 rows=18 width=21) (actual time=0.028..0.030 rows=18 loops=1)
-- 6
--               Sort Key: pz.rating
-- 7
--               Sort Method: quicksort  Memory: 26kB
-- 8
--               ->  Hash Join  (cost=1.14..2.40 rows=18 width=21) (actual time=0.014..0.020 rows=18 loops=1)
-- 9
--                     Hash Cond: (m.pizzeria_id = pz.id)
-- 10
--                     ->  Seq Scan on menu m  (cost=0.00..1.18 rows=18 width=22) (actual time=0.004..0.006 rows=18 loops=1)
-- 11
--                     ->  Hash  (cost=1.06..1.06 rows=6 width=15) (actual time=0.007..0.007 rows=6 loops=1)
-- 12
--                           Buckets: 1024  Batches: 1  Memory Usage: 9kB
-- 13
--                           ->  Seq Scan on pizzeria pz  (cost=0.00..1.06 rows=6 width=15) (actual time=0.002..0.003 rows=6 loops=1)
-- 14
-- Planning Time: 0.125 ms
-- 15
-- Execution Time: 0.125 ms

