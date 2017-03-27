-------------------------
-- Retrieve a column:
-------------------------
SELECT
prod_name -- Select the column name
FROM
products; -- Select the table the column belongs in

-------------------------
-- Retrieve multiple columns:
-------------------------
SELECT
prod_id, prod_name, prod_price
FROM
products;

-------------------------
-- Retrieve all columns:
  -- Can be slow
  -- Helpful when finding unknown columns
-------------------------
SELECT * FROM products;
-------------------------
-- Retrieve distinct rows:
  -- Won't select dupes
-------------------------
SELECT DISTINCT
vend_id
FROM
products;

-------------------------
-- Limit the amount you're retrieving:
  -- This differs depending on which SQL implementation you're using
  -- Below is psql
-------------------------
SELECT
prod_name
FROM
products
LIMIT 5;

-------------------------
-- Specify the number of rows from a specific row
  -- Below, we're looking for 5 rows starting from the 5th row in table, products:
-------------------------
SELECT prod_name
FROM
products
LIMIT 5
OFFSET 5;
