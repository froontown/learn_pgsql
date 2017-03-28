-- Let's say we want to display the total number of orders placed by every customer in the 'customers' table
-- Orders are stored in the 'orders' table along with the appropriate customer ID. SO!

-------------------------
-- Step One:
  -- Retrieve the list of customers from the 'customers' table
-------------------------

-------------------------
-- Step Two:
  -- For each customer retrieved, count the number of associated orders in the 'orders' table
-------------------------
-- This'll add up the number of orders from customer '1000000001', which is 2:
SELECT COUNT(*) AS orders
FROM orders
WHERE cust_id = '1000000001';

-- To do that `COUNT(*)` for each customer, do it as a subquery.
-- So we're choosing the customer name and the customer states simply enough
-- The 3rd thing we're grabbing, however, is being grabbed dynamically:
  -- We're going to count, from the 'orders' table, each time the order's cust_id matches the customer's cust_id and output it in the column 'orders'
  -- All this is from the customers table, ordered by customer name
SELECT cust_name, cust_state, (SELECT COUNT(*)
  FROM orders
  WHERE orders.cust_id = customers.cust_id) AS orders
FROM customers
ORDER BY cust_name;
