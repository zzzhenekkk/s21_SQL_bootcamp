CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

SET enable_seqscan = OFF;

ANALYSE;

EXPLAIN ANALYZE
SELECT * FROM menu 
WHERE pizza_name = 'cheese pizza' AND pizzeria_id = 1;



-- 1
-- Index Scan using idx_menu_unique on menu  (cost=0.14..8.16 rows=1 width=35) (actual time=0.040..0.041 rows=1 loops=1)
-- 2
--   Index Cond: ((pizzeria_id = 1) AND ((pizza_name)::text = 'cheese pizza'::text))
-- 3
-- Planning Time: 0.250 ms
-- 4
-- Execution Time: 0.052 ms
