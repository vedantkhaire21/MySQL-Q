-- ============================================
-- Chapter 1: Set Operations
-- 01. Union / Union All Queries
-- ============================================
USE company;

CREATE TABLE IF NOT EXISTS sales_employees (
    emp_id INT, name VARCHAR(50), salary DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS it_employees (
    emp_id INT, name VARCHAR(50), salary DECIMAL(10,2)
);

INSERT INTO sales_employees VALUES
(1, 'John Doe', 75000), (2, 'Jane Smith', 82000), (3, 'Bob Johnson', 60000);

INSERT INTO it_employees VALUES
(4, 'Alice Williams', 72000), (5, 'Mike Brown', 68000), (1, 'John Doe', 75000);

SELECT name, salary FROM sales_employees
UNION
SELECT name, salary FROM it_employees;

SELECT name, salary FROM sales_employees
UNION ALL
SELECT name, salary FROM it_employees;

SELECT name, salary FROM sales_employees WHERE salary > 70000
UNION
SELECT name, salary FROM it_employees WHERE salary > 70000;

SELECT name, salary FROM sales_employees
UNION
SELECT name, salary FROM it_employees
ORDER BY salary DESC;

SELECT name, salary, 'Sales' AS department FROM sales_employees
UNION
SELECT name, salary, 'IT' AS department FROM it_employees
ORDER BY name;

