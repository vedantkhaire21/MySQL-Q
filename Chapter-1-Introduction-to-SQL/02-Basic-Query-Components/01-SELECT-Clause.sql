-- ============================================
-- Chapter 1: Basic Query Components
-- 01. The Select Clause
-- ============================================
USE company;

CREATE TABLE IF NOT EXISTS employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2),
    department VARCHAR(50),
    hire_date DATE
);

INSERT INTO employees (first_name, last_name, email, salary, department, hire_date) VALUES
('John', 'Doe', 'john@email.com', 75000, 'Sales', '2022-01-15'),
('Jane', 'Smith', 'jane@email.com', 82000, 'IT', '2023-02-20'),
('Bob', 'Johnson', 'bob@email.com', 60000, 'Sales', '2023-03-10'),
('Alice', 'Williams', 'alice@email.com', 72000, 'HR', '2023-04-05'),
('Mike', 'Brown', 'mike@email.com', 68000, 'IT', '2023-05-12'),
('Sara', 'Davis', 'sara@email.com', 75000, 'Sales', '2023-06-01');

SELECT * FROM employees;
SELECT first_name, last_name FROM employees;
SELECT DISTINCT department FROM employees;
SELECT 'Employee' AS label, first_name, salary FROM employees;
SELECT first_name, salary, salary * 12 AS annual_salary FROM employees;
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;
SELECT COUNT(*) AS total_employees FROM employees;
