-- Session #1
BEGIN;
-- Session #1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Session #2
BEGIN;
-- Session #2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Session #1
SELECT * FROM pizzeria;
-- Session #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;
-- Session #1
SELECT * FROM pizzeria;
COMMIT;
SELECT * FROM pizzeria;
-- Session #2
SELECT * FROM pizzeria;