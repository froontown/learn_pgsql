-------------------------
-- Functions vary wildly from DBMS to DBMS:
  -- Examples of differences in functions below:
-------------------------
-- Extracting part of a string:
-- MID()       : Access
-- SUBSTR()    : DB2, Oracle, PostgreSQL, SQLite
-- SUBSTRING() : MariaDB, MySQL, SQL Server

-- Datatype conversion:
--           : Access and Oracle have a lot of functions for each conversion
-- CAST()    : DB2, PostgreSQL
-- CONVERT() : MariaDB, MySQL, SQL Server

-- Getting the current date:
-- NOW()         : Access
-- CURRENT_DATE  : DB2 PostgreSQL
-- CURDATE()     : MariaDB, MySQL
-- SYSDATE       : Oracle
-- GETDATE()     : SQL Server
-- DATE()        : SQLite

-------------------------
-- Text manipulation functions:
  -- `UPPER()`: turns all values uppercase
-------------------------
SELECT vend_name, UPPER(vend_name) AS vend_name_upcase
FROM vendors
ORDER BY vend_name;

-------------------------
-- General Functions:
-------------------------
-- LEFT()                           : Returns characters from left of string
-- RIGHT()                          : Returns characters from right of string
-- LENGTH() / DATALENGTH() / LEN()  : Returns the length of a string
-- LOWER() / LCASE() (Access)       : Lowercase a string
-- UPPER() / UCASE() (Access)       : Uppercase a string
-- LTRIM()                          : Trim whitespace from the left of a string
-- RTRIM()                          : Trim whitespace from the right of a string
-- SOUNDEX()                        : Returns a string's SOUNDEX value

-------------------------
-- SOUNDEX():
  -- Not supported by PostgreSQL
  -- Pretend someone erroneously entered "Michael Green" instead of "Michelle Green"
-------------------------
-- If you query for "Michael Green," you'd get no results, right? So! Use SOUNDEX()!
-- It'll return 'cust_name : Kids Place :: cust_contact : Michelle Green'
SELECT cust_name, cust_contact
FROM customers
WHERE SOUNDEX(cust_contact) = SOUNDEX('Michael Green');

-------------------------
-- Date and Time Manipulations:
  -- We're retriving all order numbers made in the year 2012 from the table 'orders'
-------------------------
-- SQL Server:
SELECT order_num
FROM orders
WHERE DATEPART(yy, order_date) = 2012;

-- Access:
SELECT order_num
FROM order
WHERE DATEPART('yyyy', order_date) = 2012;

-- PostgreSQL:
SELECT order_num
FROM orders
WHERE DATE_PART('year', order_date) = 2012;

-- Oracle:
  -- It doesn't really have a "DATEPART()" function but other functions can do the trick.
  -- `to_char()` extracts parts of the date while `to_number()` converts it to a number that can be compared to `= 2012`
SELECT order_num
FROM orders
WHERE to_number(to_char(order_date, 'YYYY')) = 2012;

  -- `to_date()` in Oracle converts strings into dates
  -- `BETWEEN` and `AND` work just the same
SELECT order_num
FROM orders
WHERE order_date BETWEEN to_date('01-01-2012') and to_date('12-31-2012');

-- MariaDB, MySQL:
-- Can use `YEAR()` to extract the year from the column 'order_date'
SELECT order_num
FROM orders
WHERE YEAR(order_date) = 2012;

-- SQLite:
SELECT order_num
FROM orders
WHERE strftime('%Y', order_date) = 2012;

-------------------------
-- Numeric Manipulation Functions:
-------------------------
-- ABS()  : Returns a number's absolute value
-- COS()  : Returns the trigonometric cosine of a specified angle
-- EXP()  : Returns the exponential value of a specific number
-- PI()   : Returns the value of PI
-- SIN()  : Returns the trigonometric sine of a specified angle
-- SQRT() : Returns the square root of a specific number
-- TAN()  : Returns the trigonometric tangent of a specified angle
