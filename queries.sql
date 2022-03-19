SELECT *
FROM parts
LIMIT 10;

// Altering the code column so that each value inserted into this field is unique and not empty;

ALTER TABLE parts
ALTER COLUMN code SET NOT NULL;

ALTER TABLE parts
ADD UNIQUE (code);

// Altering the table so that all rows have a value for description:

UPDATE parts
SET description = 'none'
WHERE description IS NULL;

ALTER TABLE parts
ALTER COLUMN description SET NOT NULL;

// Testing the constraint by trying to insert a row into parts:

INSERT INTO parts (id, code, manufacturer_id)
VALUES (54, 'V1-009', 9); // throws ERROR:  null value in column “description” violates not-null constraint

// Ensuring that price_usd and quantity are both NOT NULL in the reorder_options table;

ALTER TABLE reorder_options
ALTER COLUMN price_usd SET NOT NULL;

ALTER TABLE reorder_options
ALTER COLUMN quantity SET NOT NULL;

// Ensuring that price_usd and quantity are both positive:

ALTER TABLE reorder_options
ADD CHECK (price_usd > 0 AND quantity > 0);

// Adding a constraint to reorder_options that limits price per unit between 0.02 USD and 25.00 USD assuming that price per unit for a given ordering option is the price divided by the quantity:

ALTER TABLE reorder_options
ADD CHECK (price_usd/quantity > 0.02 AND price_usd/quantity < 25);

// Adding a constraint to ensure that we don’t have pricing information on parts that aren’t already tracked in our DB schema:

ALTER TABLE parts
ADD PRIMARY KEY (id);

ALTER TABLE reorder_options
ADD FOREIGN KEY (part_id)
REFERENCES parts (id);







