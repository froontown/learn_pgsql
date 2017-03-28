-- Simply put: A join is a mechanism used to associate tables within a `SELECT` statment
-- Using a special syntax, multiple tables can be joined so that a single set of output is returned, and the join associates the correct rows in teach table on-the-fly

-------------------------
-- Creating A Join:
-------------------------
-- The `SELECT` line is basically the same, but notice:
  -- 'vend_name' is from one table, while 'prod_name' and 'prod_price' are from 'products'
  -- So, we're selecting `FROM` those two tables
-- The `WHERE` line needs to know which 'vend_id' belongs to which table, hence the syntax
  -- Without the `WHERE` line, we'd be joining every row from 'vendors' with every row from 'products'
SELECT vend_name, prod_name, prod_price
FROM vendors, products
WHERE vendors.vend_id = products.vend_id;

-------------------------
-- Inner Join:
  -- This is also known as an equijoin - a join based on the testing of equality between two tables
-------------------------
-- This is the same:
SELECT vend_name, prod_name, prod_price
FROM vendors INNER JOIN products
  ON vendors.vend_id = products.vend_id;

-------------------------
-- Joining Multiple Tables:
-------------------------
-- Order items are stored in the 'OrderItems' table
-- Each product is stored by its product ID, which refers to a product in the 'products' table
-- The products are linked to an appropriate vender in the 'vendors' table via the vendor ID which is stored with each product record
-- The `FROM` clause lists the 3 tables
-- The `WHERE` clauses define a.) the two Join conditions, and b.) filters them out down to just order number '20007'
SELECT prod_name, vend_name, prod_price, quantity
FROM orderitems, products, vendors
WHERE products.vend_id = vendors.vend_id
  AND orderitems.prod_id = products.prod_id
  AND order_num = 20007;
