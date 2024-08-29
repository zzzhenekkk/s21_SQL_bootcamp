CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE(fibonacci INTEGER) AS $$
DECLARE
    a INTEGER := 0;
    b INTEGER := 1;
    next INTEGER;
BEGIN
    IF a < pstop THEN
        fibonacci := a;
        RETURN NEXT;
    END IF;
    LOOP
        next := a + b;
        EXIT WHEN next >= pstop;
        fibonacci := next;
        RETURN NEXT;
        a := b;
        b := next;
    END LOOP;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
