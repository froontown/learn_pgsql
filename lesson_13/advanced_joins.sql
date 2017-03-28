-------------------------
-- Table Aliases:
  -- Sort of like storing something in a short variable:
  -- Oracle doesn't know `AS`, so 'customers AS C' can just be 'customers C'
-------------------------
-- You can set these pretty much wherever
SELECT cust_name, cust_contact
FROM customers AS C, orders AS O, orderitems as OI
WHERE C.cust_id = O.cust_id
  AND OI.order_num = O.order_num
  AND prod_id = 'RGAN01';

-------------------------
-- Self Joins:
  -- Let's say we want to mail something to all customer contacts who work for the same company as Jim Jones
  -- We'll need to: a.) find out what company Jim Jones works for and, b.) which customers work for the same company
-------------------------
-- This is a subquery approach.
  -- The inner `SELECT` gets the 'cust_name' of the company that Jim Jones works for
  -- That's passed into the outer query so all customers who work for that company, 'cust_name', are returned
SELECT cust_id, cust_name, cust_contact
FROM customers
WHERE cust_name = (SELECT cust_name
  FROM customers
  WHERE cust_contact = 'Jim Jones');

-- This is the approach using a self join
  -- What's happening here is that the two joined tables are the same table: 'customers'
  -- By giving them aliases, we're able to differentiate the 'cust_name' that we're looking for
SELECT c1.cust_id, c1.cust_name, c1.cust_contact
FROM customers AS c1, customers AS c2
WHERE c1.cust_name = c2.cust_name
  AND c2.cust_contact = 'Jim Jones';

-------------------------
-- Natural Joins:
  -- A natural join is a join in which you select only columns that are unique
  -- This is typically done by selecting a wildcre, (`SELECT *`), for one table and explicit subsets of the columns for all other tables:
-------------------------
SELECT C.*, O.order_num, O.order_date, OI.prod_id, OI.quantity, OI.item_price
FROM customers AS C, orders AS O, orderitems as OI
WHERE C.cust_id = O.cust_id
  AND OI.order_num = O.order_num
  AND prod_id = 'RGAN01';

-------------------------
-- Outer Joins:
  -- You might want to include rows that have no related rows in a join
  -- For example: you might want to count how many orders were placed by each customers, including those who haven't ordered yet
-------------------------
-- Inner Join for reference
SELECT customers.cust_id, orders.order_num
FROM customers INNER JOIN orders
  ON customers.cust_id = orders.cust_id;

-- Outer Join syntax
  -- This returns basically the same thing as above, but with an extra customer, (Who didn't order anything! Wow!)
  -- LEFT vs RIGHT: You are choosing all the rows from either the LEFT or the RIGHT of the `SELECT` clause
SELECT customers.cust_id, orders.order_num
FROM customers LEFT OUTER JOIN orders
  ON customers.cust_id = orders.cust_id;

SELECT customers.cust_id, orders.order_num
FROM customers RIGHT OUTER JOIN orders
  ON customers.cust_id = orders.cust_id;

-------------------------
-- Full Outer Joins:
  -- Unlike LEFT/RIGHT OUTER JOIN, this includes all unrelated rows from both tables:
-------------------------
SELECT customers.cust_id, orders.order_num
FROM orders FULL OUTER JOIN customers
  ON orders.cust_id = customers.cust_id;
