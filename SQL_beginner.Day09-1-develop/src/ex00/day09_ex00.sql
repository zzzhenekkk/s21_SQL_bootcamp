CREATE TABLE person_audit (
    created    timestamp with time zone NOT NULL DEFAULT current_timestamp,
    type_event char(1)                  NOT NULL DEFAULT 'I',
    row_id     bigint                   NOT NULL,
    name       varchar,
    age        integer,
    gender     varchar,
    address    varchar,
    constraint ch_type_event check (type_event in ('I', 'D', 'U'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO person_audit(row_id, name, age, gender, address)
    VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

SELECT * FROM person_audit;
