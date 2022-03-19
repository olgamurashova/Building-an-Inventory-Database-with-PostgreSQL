SELECT *
FROM parts
LIMIT 10;

// Altering the code column so that each value inserted into this field is unique and not empty;

ALTER TABLE parts
ALTER COLUMN code SET NOT NULL UNIQUE;

