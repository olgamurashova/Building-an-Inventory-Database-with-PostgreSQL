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


