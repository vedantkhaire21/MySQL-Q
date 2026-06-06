-- ============================================
-- Chapter 1: Additional Base Operations
-- 03. String Operations and Pattern Matching
-- ============================================
USE company;

SELECT * FROM employees WHERE first_name LIKE 'J%';
SELECT first_name, last_name FROM employees WHERE last_name LIKE '%son';
SELECT email FROM employees WHERE email LIKE '%.com';
SELECT first_name FROM employees WHERE first_name LIKE 'B_b';
SELECT first_name FROM employees WHERE first_name LIKE 'J___';
SELECT first_name FROM employees WHERE first_name LIKE '_a%';
SELECT first_name FROM employees WHERE first_name NOT LIKE 'J%';
SELECT first_name FROM employees WHERE first_name LIKE BINARY 'john';

SELECT first_name, LENGTH(first_name) AS name_length FROM employees;
SELECT UPPER(first_name) AS uppercase_name FROM employees;
SELECT LOWER(first_name) AS lowercase_name FROM employees;
SELECT first_name, SUBSTRING(first_name, 1, 3) AS first_three FROM employees;
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;
SELECT CONCAT_WS(' - ', first_name, last_name, email) FROM employees;
SELECT TRIM('  John  ') AS trimmed_name;
SELECT first_name, REPLACE(first_name, 'o', '0') AS replaced FROM employees;
SELECT REVERSE(first_name) AS reversed FROM employees;

SELECT * FROM employees WHERE LOWER(first_name) LIKE 'j%';

SELECT first_name, email, salary
FROM employees
WHERE (first_name LIKE 'J%' OR last_name LIKE '%son')
  AND salary > 65000;
