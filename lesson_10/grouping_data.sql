-------------------------
-- `GROUP BY` is how one creates groups
  -- Groups allow you to break up data into logical sets so you can perform aggregate calculations on those groups
-------------------------
-- This specifies two columns: 'vend_id', which has the ID of the vendor, and 'num_prods', the values of which are the calculated field created by `COUNT(*)`
-- `GROUP BY` tells the DBMS to group it by 'vend_id' in this case, counting 'num_prods' once per 'vend_id' instead of the whole table
-- The output puts each vendor in one column and the number of products each sells in another:
SELECT vend_id, COUNT(*) AS num_prods
FROM products
GROUP BY vend_id;

-- output:
-- vend_id   | num_prods
-- ------------+-----------
-- FNG01      |         2
-- DLL01      |         4
-- BRS01      |         3

-------------------------
-- Filtering groups using `HAVING`
  -- It's basically the group version of `WHERE`
  -- The key difference: `WHERE` filters before data is groups. `HAVING` filters afterwards. `WHERE` can affect the results of `HAVING`
-------------------------
-- This specifies two columns: 'cust_id', which has the ID of the customer, and 'orders', which are the number of orders per 'cust_id'
-- The `HAVING` filters the groups, returning only those that fit the criteria: having more than 2 items in that column's count:
SELECT cust_id, COUNT(*) AS orders
FROM orders
GROUP BY cust_id
HAVING COUNT(*) >= 2;

-------------------------
-- Combining `WHERE` and `HAVING`
  -- Above, we filtered the groups to only show customers who ordered more than 2 items and that's it
  -- What if we also wanted to filter out vendors who have 2 ore more products that are priced at 4.00 or more?
-------------------------
SELECT vend_id, COUNT(*) AS num_prods
FROM products
WHERE prod_price >= 4
GROUP BY vend_id
HAVING COUNT(*) >= 2;

-- Doing the same thing, but without the pricing filter
SELECT vend_id, COUNT(*) AS num_prods
FROM products
GROUP BY vend_id
HAVING COUNT(*) >= 2;

-------------------------
-- Grouping and Sorting
  -- Differences between ORDER BY and GROUP BY:
-------------------------
--                                            ORDER BY     |       GROUP BY
--                              Sorts generated output     |       Groups Rows. The output might not be in group order. As a rule: If your'e using `GHROUP BY`, use `ORDER BY` too
-- Any columns, (even unselected columns, may be used)     |       Only selected columns or expressions columns may be used, and every selected column expression must be used
--                                      Never required     |       Required if using columns (or expressions) with aggregate functions.

-- This is not really sorted:
SELECT order_num, COUNT(*) AS items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >= 3;

-- This IS sorted:
SELECT order_num, COUNT(*) AS items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >= 3
ORDER BY items, order_num;
