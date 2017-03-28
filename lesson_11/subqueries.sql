-- The given tables are structured specifically.
-- A row in the 'orders' table has: order number, order date, and the customer ID
-- Individual order items are in the 'OrderItems' table, which has: order number, order item, product ID, quantitiy, item price
-- Customer info is in the 'customers' table, which has: customer ID, customer name, customer address / city / state / zip, contact, and email
-- What if you wanted all the customers who ordered the item 'RGAN01'

-------------------------
-- Step One:
  -- Retrieve the order numbers of all the orders containing item 'RGAN01'
-------------------------

-------------------------
-- Step Two:
  -- Retrieve the customer IDs of all the customers who have orders listed in the order numbers returned in step 1
-------------------------

-------------------------
-- Step Three:
  -- Retrieve the customer information from allt he customer IDs retrieved from step 2
-------------------------

-------------------------
-- As separate queries:
-------------------------
-- Get the order numbers from 'OrderItems' where the 'prod_id' matches the product ID we want, 'RGAN01':
SELECT order_num
FROM OrderItems
WHERE prod_id = 'RGAN01';

-- Output:
order_num
-----------
    20007
    20008

-- Now, find the customer IDs in 'orders' where their 'order_num' matches the ones we got before:
SELECT cust_id
FROM orders
WHERE order_num IN (20007, 20008);

-- Output:
cust_id
------------
1000000004
1000000005

-------------------------
-- Combined as a Subquery:
  -- These queries go from the innermost query outward, (so starting with the subquery of 'order_num')
  -- The subquery returns '20007, 20008', which is then passed to the `WHERE` clause, which now filters the search for our customer IDs
-------------------------
SELECT cust_id
FROM orders
WHERE order_num IN (SELECT order_num
  FROM OrderItems
  WHERE prod_id = 'RGAN01');

-------------------------
-- Deeper Subqueries:
  -- Now that we have the customer IDs of those who ordered 'RGAN01', we can find out info about those customers!
-------------------------
SELECT cust_name, cust_contact
FROM customers
WHERE cust_id IN (SELECT cust_id
  FROM orders
  WHERE order_num IN (SELECT order_num
    FROM OrderItems
    WHERE prod_id = 'RGAN01'));
