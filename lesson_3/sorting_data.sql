-------------------------
-- Sorting with a SELECT statement:
-------------------------
SELECT prod_name
FROM products
ORDER BY prod_name;

-------------------------
-- Sorting by multiple columns:
  -- Keep track of the `ORDER BY` order, as this is the order they'll be sorted
-------------------------
SELECT prod_name, prod_price, prod_id
FROM products
ORDER BY prod_price, prod_name;

-------------------------
-- Sort by column position:
  -- `ORDER BY 2` means sort by the second column in `SELECT`, ('prod_price' here)
  -- `ORDER BY 2, 3;` means sort by 'prod_price' THEN 'prod_name'
-------------------------
SELECT
prod_id, prod_price, prod_name
FROM
products
ORDER BY 2, 3;

-------------------------
-- Sorting by descending order:
-------------------------
SELECT
prod_id, prod_price, prod_name
FROM
products
ORDER BY prod_price DESC;

-------------------------
-- Sorting by descending order with multiple columns:
  -- Here, we're sorting 'prod_price' in descending order, then sorting those by 'prod_name':
-------------------------
SELECT prod_id, prod_price, prod_name
FROM
products
ORDER BY prod_price DESC, prod_name;
