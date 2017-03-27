-------------------------
-- Combining `WHERE` clauses:
  -- `AND` operator: think &&
-------------------------
SELECT prod_id, prod_price, prod_name
FROM products
WHERE vend_id = 'DLL01' AND prod_price <= 4;

-------------------------
-- Combining `WHERE` clauses:
  -- `OR` operator: think ||
-------------------------
SELECT prod_id, prod_price, prod_name
FROM products
WHERE vend_id = 'DLL01' OR vend_id = 'BRS01';

-------------------------
-- Combining `WHERE` clauses:
  -- Using both `AND` and `OR`
    -- Order of operations is important: SQL passes `AND` first
    -- Use ()! They are your friends forever and ever
-------------------------
-- This won't work, as it won't filter out data greater than or equal to 10
-- It'll basically look for items that are: a.) <= $10 && have a 'vend_id' of 'BRS01', b.) whatever 'DLL01' sells:
SELECT prod_name, prod_price
FROM products
WHERE vend_id = 'DLL01' OR vend_id = 'BRS01' AND prod_price >= 10;

-- Solution:
SELECT prod_name, prod_price
FROM products
WHERE (vend_id = 'DLL01' OR vend_id = 'BRS01') AND prod_price >= 10;

-------------------------
-- Using the `IN` clause:
  -- It's basically the same as `OR`:
-------------------------
SELECT prod_id, prod_price, prod_name
FROM products
WHERE vend_id IN ('DLL01', 'BRS01');

-------------------------
-- Using the `NOT` operator:
  -- Kind of a special operator
  -- Negates the condition immediately following it
  -- Can't be used on its own
-------------------------
-- Look in 'prod_name' and bring back the stuff that does NOT have a 'vend_id' of 'DLL01'
SELECT prod_name
FROM products
WHERE NOT vend_id = 'DLL01';

-- Same as:
SELECT prod_name
FROM products
WHERE vend_id <> 'DLL01';
