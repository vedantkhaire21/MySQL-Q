-- ============================================
-- Chapter 1: Basic Query Components
-- 03. The From Clause
-- ============================================
USE company;

SELECT * FROM employees;
SELECT first_name, salary FROM employees;

CREATE TABLE IF NOT EXISTS departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments (dept_id, dept_name, location) VALUES
(1, 'Sales', 'New York'),
(2, 'IT', 'San Francisco'),
(3, 'HR', 'Boston');

SELECT e.emp_id, e.first_name, d.dept_id, d.dept_name
FROM employees e, departments d;

SELECT e.first_name, e.salary, d.dept_name
FROM employees e, departments d
WHERE e.department = d.dept_name;

SELECT emp_id, full_name, salary
FROM (
    SELECT emp_id, CONCAT(first_name, ' ', last_name) AS full_name, salary
    FROM employees
) AS emp_derived
WHERE salary > 70000;

SELECT first_name, salary
FROM employees
WHERE salary > 65000
ORDER BY salary DESC
LIMIT 3;
