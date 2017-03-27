-------------------------
-- Using `LIKE` with %:
  -- Match any number of occurrences with any character
-------------------------
-- Select any 'prod_name' from 'products' that start with "fish"
-- Notice it's a string, so it's very specific, ('fish%' will return zero results)
SELECT
prod_id, prod_name
FROM
products
WHERE prod_name LIKE 'Fish%';

-- This returns anything with 'bean bag' in it:
SELECT
prod_id, prod_name
FROM
products
WHERE prod_name LIKE '%bean bag%';

-- This starts with an 'F' and ends with a 'y':
SELECT
prod_id, prod_name
FROM
products
WHERE prod_name LIKE 'F%y';

-- Searching for a specific email address would be something useful!
-- Imagine we just want folk with emails that end in '@villagetoys.com' or something:
SELECT
cust_email
FROM
customers
WHERE cust_email LIKE '%@villagetoys%';

-------------------------
-- Using `LIKE` with _:
  -- It's like %, but it matches just a single character
-------------------------
-- In PostgreSQL, you need the % at the end since there are weird, blank spaces
-- Note: EACH '_' is a character. The below example has TWO underscores, (that's why '8 inch teddy bear' doesn't get returned)
SELECT
prod_id, prod_name
FROM
products
WHERE prod_name LIKE '__ inch teddy bear%';

-------------------------
-- Using `LIKE` with []:
  -- It specifies a set of characters, so something like '[JM]%' looks for items that start with J and M, (thanks to the % I think?)
-------------------------
SELECT
cust_contact
FROM
customers
WHERE cust_contact LIKE '[JM]%';
