-- ============================================
-- Chapter 1: Null Value Handling
-- 01. Null-Check Predicate Queries
-- ============================================
USE company;

CREATE TABLE IF NOT EXISTS employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    salary DECIMAL(10,2),
    manager_id INT,
    department VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'Alice', 'Smith', 'alice@company.com', '555-0001', 90000, NULL, 'Management'),
(2, 'Bob', 'Johnson', 'bob@company.com', NULL, 75000, 1, 'Sales'),
(3, 'Charlie', 'Brown', NULL, '555-0003', 70000, 1, 'Sales'),
(4, 'Diana', 'Davis', 'diana@company.com', '555-0004', 65000, 2, 'HR'),
(5, 'Eve', 'Wilson', NULL, NULL, 62000, 2, 'IT');

SELECT * FROM employees WHERE email IS NULL;
SELECT first_name, last_name FROM employees WHERE manager_id IS NULL;
SELECT first_name, email FROM employees WHERE email IS NOT NULL;

SELECT first_name FROM employees
WHERE email IS NULL OR phone IS NULL;

SELECT first_name,
    COALESCE(email, 'No email') AS email,
    COALESCE(phone, 'No phone') AS phone
FROM employees;

SELECT first_name,
    IFNULL(email, 'N/A') AS email
FROM employees;

SELECT 
    COUNT(*) AS total_employees,
    COUNT(email) AS employees_with_email,
    COUNT(phone) AS employees_with_phone
FROM employees;

SELECT first_name, email FROM employees
ORDER BY email IS NULL, email ASC;

SELECT first_name FROM employees
WHERE emp_id NOT IN (SELECT manager_id FROM employees WHERE manager_id IS NOT NULL);
