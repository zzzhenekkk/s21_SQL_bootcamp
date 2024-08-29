CREATE OR REPLACE FUNCTION func_minimum(arr NUMERIC[])
RETURNS NUMERIC AS $$
DECLARE
    min_value NUMERIC := arr[1];
    num NUMERIC;
BEGIN
    FOREACH num IN ARRAY arr LOOP
        IF num < min_value THEN
            min_value := num;
        END IF;
    END LOOP;
    RETURN min_value;
END;
$$ LANGUAGE plpgsql;



SELECT func_minimum(VARIADIC ARRAY[10.0, -1.0, 5.0, 4.4]);

SELECT func_minimum(ARRAY[10.0, -1.0, 5.0, 4.4]);