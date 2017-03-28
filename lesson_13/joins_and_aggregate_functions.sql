-------------------------
-- Joins and Aggregate Functions:
  -- Pretend we want a list of all customers and the number of orders each placed
-------------------------
-- The `SELECT` clause uses `INNER JOIN` to relate the 'customers' and 'orders' tables to each other
-- The `GROUP BY` clause groups the data by customer
-- The function call `COUNT(orders.order_num)` counts the number of orders placed and returns it as 'num_ord'
SELECT customers.cust_id,
  COUNT(orders.order_num) AS num_ord
FROM customers INNER JOIN orders
  ON customers.cust_id = orders.cust_id
GROUP BY customers.cust_id;

-- Another example using a LEFT OUTER JOIN
-- This'll return customers that haven't actually ordered anything yet
SELECT customers.cust_id,
  COUNT(orders.order_num) AS num_ord
FROM customers LEFT OUTER JOIN orders
  ON customers.cust_id = orders.cust_id
GROUP BY customers.cust_id;
