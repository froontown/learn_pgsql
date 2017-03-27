-------------------------
-- Filtering with WHERE:
  -- Finds the 'prod_name' items where the 'prod_price' = 3.49
  -- If using both `ORDER BY` and `WHERE`, make sure the `ORDER BY` comes after the `WHERE`
-------------------------
SELECT
prod_name, prod_price
FROM
products
WHERE prod_price = 3.49;

-------------------------
-- Other operators:
-- =       : Equality
-- <>      : Non-equality
-- !=      : Non-equality
-- <       : Less than
-- <=      : Less than or equal to
-- !<      : Not less than
-- >       : Greater than
-- >=      : Greater than or equal to
-- !>      : Not greater than
-- BETWEEN : Between two specified values
-- IS NULL : Is a NULL value
-------------------------

-------------------------
-- Checking against a single example:
-------------------------
SELECT
prod_name, prod_price
FROM
products
WHERE
prod_price < 10;

-- or
SELECT
prod_name, prod_price
FROM
products
WHERE
prod_price <= 10; -- ja'kno??

-------------------------
-- Checking for non-matches:
-------------------------
SELECT
vend_id, prod_name
FROM
products
WHERE vend_id != 'DLL01';

-------------------------
-- Checking for ranges:
  -- Includes start and end values
-------------------------
SELECT
prod_name, prod_price
FROM
products
WHERE prod_price BETWEEN 5 AND 10;

-------------------------
-- Checking for no value:
-------------------------
SELECT
prod_name
FROM
products
WHERE prod_price IS NULL;

SELECT
cust_name
FROM
customers
WHERE cust_email IS NULL;
