-- ============================================
-- Chapter 1: Basic Query Components
-- 02. The Where Clause
-- ============================================
USE company;

SELECT * FROM employees WHERE department = 'Sales';
SELECT * FROM employees WHERE department != 'IT';
SELECT * FROM employees WHERE salary > 70000;
SELECT * FROM employees WHERE salary BETWEEN 60000 AND 80000;
SELECT * FROM employees WHERE department IN ('Sales', 'IT', 'HR');
SELECT * FROM employees WHERE department NOT IN ('Sales', 'IT');
SELECT * FROM employees WHERE first_name LIKE 'J%';
SELECT * FROM employees WHERE first_name LIKE 'B_b';
SELECT * FROM employees WHERE email IS NULL;
SELECT * FROM employees WHERE email IS NOT NULL;

SELECT * FROM employees
WHERE (department = 'Sales' AND salary > 70000)
   OR (department = 'IT' AND salary > 75000);

SELECT * FROM employees
WHERE department NOT IN ('IT', 'Sales')
  AND salary BETWEEN 60000 AND 80000;
