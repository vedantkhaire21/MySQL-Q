-- ============================================
-- Chapter 1: Additional Base Operations
-- 01. The Rename Operation (AS Clause)
-- ============================================
USE company;

SELECT first_name AS 'First Name', last_name AS 'Last Name' FROM employees;

SELECT e.emp_id, e.first_name, e.salary FROM employees e;

SELECT 
    first_name,
    salary,
    salary * 12 AS annual_salary,
    salary * 1.1 AS new_salary_after_raise
FROM employees;

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    email AS email_address
FROM employees;

SELECT 
    e.emp_id AS 'Employee ID',
    CONCAT(e.first_name, ' ', e.last_name) AS 'Full Name',
    e.salary AS 'Monthly Salary',
    ROUND(e.salary * 1.15, 2) AS 'With 15% Bonus',
    e.department AS 'Dept',
    YEAR(CURDATE()) - YEAR(e.hire_date) AS 'Years of Service'
FROM employees e;

SELECT first_name, salary * 12 AS annual_salary
FROM employees
ORDER BY annual_salary DESC;

SELECT first_name, salary * 12 AS annual_salary
FROM employees
WHERE salary * 12 > 900000;
