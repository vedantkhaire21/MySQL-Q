-- ============================================
-- Chapter 1: Additional Base Operations
-- 02. Self Join Queries
-- ============================================
USE company;

CREATE TABLE IF NOT EXISTS employees_with_mgr (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees_with_mgr(emp_id)
);

INSERT INTO employees_with_mgr VALUES
(1, 'Alice', 'Smith', 90000, NULL),
(2, 'Bob', 'Johnson', 75000, 1),
(3, 'Charlie', 'Brown', 70000, 1),
(4, 'Diana', 'Davis', 65000, 2),
(5, 'Eve', 'Wilson', 62000, 2),
(6, 'Frank', 'Miller', 68000, 3);

SELECT 
    e.first_name AS 'Employee Name',
    e.salary AS 'Employee Salary',
    m.first_name AS 'Manager Name',
    m.salary AS 'Manager Salary'
FROM employees_with_mgr e
JOIN employees_with_mgr m ON e.manager_id = m.emp_id;

SELECT 
    e.first_name AS 'Employee',
    COALESCE(m.first_name, 'None (CEO)') AS 'Manager'
FROM employees_with_mgr e
LEFT JOIN employees_with_mgr m ON e.manager_id = m.emp_id;

SELECT 
    e.first_name AS 'Employee',
    m1.first_name AS 'Direct Manager',
    m2.first_name AS 'Manager\'s Manager'
FROM employees_with_mgr e
LEFT JOIN employees_with_mgr m1 ON e.manager_id = m1.emp_id
LEFT JOIN employees_with_mgr m2 ON m1.manager_id = m2.emp_id;

CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    year_of_study INT
);

INSERT INTO students VALUES
(1, 'Alice', 2), (2, 'Bob', 2),
(3, 'Charlie', 3), (4, 'Diana', 2), (5, 'Eve', 3);

SELECT 
    s1.student_name AS 'Student 1',
    s2.student_name AS 'Classmate',
    s1.year_of_study AS 'Year'
FROM students s1
JOIN students s2 
    ON s1.year_of_study = s2.year_of_study
    AND s1.student_id < s2.student_id;
