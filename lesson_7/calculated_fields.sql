-- Calculated fields are what we can create while querying to create our own titles
-- For example, if you have a table with separate columns for: street address, city, and zip code, but you want a formatted address returned, you can do that with a Calculated field

-------------------------
-- Concatenating a querty with +:
  -- There are a few ways to go about concatenating:
-------------------------
-- Most DBMS:
SELECT vend_name + ' (' + vend_country + ')'
FROM vendors
ORDER BY vend_name;

-- PostgreSQL:
SELECT vend_name || ' (' || vend_country || ')'
FROM vendors
ORDER BY vend_name;

-- MySQL or MariaDB:
SELECT Concat(vend_name, ' (', vend_country, ')')
FROM vendors
ORDER BY vend_name;

-------------------------
-- Using RTRIM(), (doesn't look like we have to with PostgreSQL)
  -- There's also LTRIM(), which trims from the left, duh.
-------------------------
SELECT RTRIM(vend_name) || ' (' || RTRIM(vend_country) || ')'
FROM vendors
ORDER BY vend_name;

-------------------------
-- Using Aliases with `AS`:
  -- Notice that the previous queries, the columns are titled: ?column?
  -- Let's give them ALIASES!
-------------------------
SELECT RTRIM(vend_name) || ' (' || RTRIM(vend_country) || ')' AS vend_title
FROM vendors
ORDER BY vend_name;

-------------------------
-- Doing some MATH:
-- * : Multiplication
-- / : Division
-- + : Addition
-- - : Subtraction
-------------------------
-- Let's start off with this query
SELECT prod_id, quantity, item_price
FROM OrderItems
WHERE order_num = 20008;

-- This returns:
-- prod_id   | quantity | item_price
-- ------------+----------+------------
-- RGAN01     |        5 |       4.99
-- BR03       |        5 |      11.99
-- BNBG01     |       10 |       3.49
-- BNBG02     |       10 |       3.49
-- BNBG03     |       10 |       3.49

-- Say you wanted to find out how much it all cost total, ('quantity' times 'item_price')
SELECT prod_id, quantity, item_price, quantity*item_price AS total_price
FROM OrderItems
WHERE order_num = 20008;
