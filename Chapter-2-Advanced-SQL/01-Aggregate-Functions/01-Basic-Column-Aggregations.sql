-- ============================================
-- Chapter 2: Advanced SQL
-- 01. Basic Column Aggregations
-- ============================================
USE company;

CREATE TABLE IF NOT EXISTS employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2),
    department VARCHAR(50),
    hire_date DATE
);

INSERT INTO employees VALUES
(1,'Alice','Smith',90000,'Management','2021-01-15'),
(2,'Bob','Johnson',75000,'Sales','2022-03-20'),
(3,'Charlie','Brown',70000,'Sales','2022-06-10'),
(4,'Diana','Davis',65000,'HR','2023-02-01'),
(5,'Eve','Wilson',62000,'IT','2023-05-12'),
(6,'Frank','Miller',72000,'IT','2023-07-01');

SELECT COUNT(*) AS total_employees FROM employees;
SELECT COUNT(DISTINCT department) AS unique_departments FROM employees;
SELECT SUM(salary) AS total_salary FROM employees;
SELECT AVG(salary) AS avg_salary FROM employees;
SELECT MIN(salary) AS lowest_salary FROM employees;
SELECT MAX(salary) AS highest_salary FROM employees;
SELECT MIN(hire_date) AS earliest_hire FROM employees;

SELECT 
    COUNT(*) AS employee_count,
    SUM(salary) AS total_salary,
    ROUND(AVG(salary), 2) AS average_salary,
    MIN(salary) AS lowest_salary,
    MAX(salary) AS highest_salary,
    MAX(salary) - MIN(salary) AS salary_range
FROM employees;

SELECT 
    COUNT(*) AS recent_hires,
    AVG(salary) AS avg_recent_salary
FROM employees
WHERE YEAR(hire_date) >= 2023;

SELECT SUM(salary) * 1.1 AS total_with_10pct_raise FROM employees;
