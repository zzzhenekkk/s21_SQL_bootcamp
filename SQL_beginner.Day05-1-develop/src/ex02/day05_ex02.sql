CREATE INDEX idx_person_name ON person (UPPER(name));

SET enable_seqscan = OFF;

ANALYZE;

EXPLAIN ANALYZE SELECT * FROM person WHERE UPPER(name) = 'ANNA';

-- 1
-- Index Scan using idx_person_name on person  (cost=0.14..8.15 rows=1 width=33) (actual time=0.055..0.055 rows=1 loops=1)
-- 2
--   Index Cond: (upper((name)::text) = 'ANNA'::text)
-- 3
-- Planning Time: 0.086 ms
-- 4
-- Execution Time: 0.064 ms
