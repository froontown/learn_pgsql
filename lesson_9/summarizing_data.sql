-------------------------
-- Aggregate Functions
  -- Let you summarize data from a table without actually having to retrive the table itself
-------------------------

-------------------------
-- AVG()   : Returns a column's average value
-------------------------
-- This returns the average of the column 'prod_price' as the alias, 'avg_price'
SELECT AVG(prod_price) AS avg_price
FROM products;

-- This returns the average from a specific vender:

SELECT AVG(prod_price) AS avg_price
FROM products
WHERE vend_id = 'DLL01';

-------------------------
-- COUNT() : Returns the number of rows in a column
  -- COUNT(*) counts the number of rows in a whole table, regardless if values are NULL
  -- COUNT(<columnname>) counts the number of rows in a column ignoring NULL values
-------------------------
SELECT COUNT(*) AS num_cust
FROM customers;

SELECT COUNT(cust_email) AS num_cust
FROM customers;

-------------------------
-- MAX()   : Returns a column's highest value
  -- If the data isn't numeric, it'll return the last value if the data was sorted by that column
-------------------------
SELECT MAX(prod_price) AS max_price
FROM products;

-------------------------
-- MIN()   : Returns a column's lowest value
  -- If the data isn't numeric, it'll return the first value if the data was sorted by that column
-------------------------
SELECT MIN(prod_price) AS min_price
FROM products;

-------------------------
-- SUM()   : Returns the sum of a column's values
-------------------------
-- Sum of all the 'quantity' values
SELECT SUM(quantity) AS items_ordered
FROM OrderItems
WHERE order_num = 20005;

-- Sum of all 'item_price' * all 'quantity' values:
SELECT SUM(item_price*quantity) AS total_price
FROM OrderItems
WHERE order_num = 20005;

-------------------------
-- Using `DISTINCT`
  -- Only includes unique values
  -- Not in Access
  -- Can't use it with `COUNT(*)`. The column name must be specified.
  -- Can't be used with a calculation or an expression
-------------------------
-- This takes the average produce price of a specific vender, but doesn't include repeats of the same price:
SELECT AVG(DISTINCT prod_price) AS avg_price
FROM products
WHERE vend_id = 'DLL01';

-------------------------
-- Combining Aggregate Functions:
-------------------------
SELECT COUNT(*) AS num_items,
  MIN(prod_price) AS price_min,
  MAX(prod_price) AS price_max,
  AVG(prod_price) AS price_avg
FROM products;
