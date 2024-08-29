COMMENT ON TABLE person_discounts IS 'Stores personal discounts for each person at different pizzerias, facilitating personalized marketing and customer loyalty programs.';

COMMENT ON COLUMN person_discounts.id IS 'A unique identifier for each record in the person_discounts table.';
COMMENT ON COLUMN person_discounts.person_id IS 'Reference to the person table, identifying the person who receives the discount.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Reference to the pizzeria table, identifying the pizzeria where the discount applies.';
COMMENT ON COLUMN person_discounts.discount IS 'The percentage of the discount offered to the person for orders at the specified pizzeria.';

