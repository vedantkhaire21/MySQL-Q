-- ============================================
-- Chapter 1: Set Operations
-- 02. Intersect / Intersect All Queries
-- ============================================
USE company;

CREATE TABLE IF NOT EXISTS employees_sales (emp_id INT, name VARCHAR(50));
CREATE TABLE IF NOT EXISTS employees_it (emp_id INT, name VARCHAR(50));

INSERT INTO employees_sales VALUES (1,'Alice'),(2,'Bob'),(3,'Charlie'),(4,'Diana');
INSERT INTO employees_it VALUES (2,'Bob'),(4,'Diana'),(5,'Eve'),(6,'Frank');

-- INTERSECT using INNER JOIN
SELECT DISTINCT s.name
FROM employees_sales s
INNER JOIN employees_it i ON s.name = i.name;

-- INTERSECT using EXISTS
SELECT DISTINCT s.name
FROM employees_sales s
WHERE EXISTS (
    SELECT 1 FROM employees_it i WHERE i.name = s.name
);

-- INTERSECT using IN
SELECT DISTINCT name FROM employees_sales
WHERE name IN (SELECT name FROM employees_it);

CREATE TABLE IF NOT EXISTS students_course_a (student_id INT, student_name VARCHAR(50));
CREATE TABLE IF NOT EXISTS students_course_b (student_id INT, student_name VARCHAR(50));

INSERT INTO students_course_a VALUES (1,'Alice'),(2,'Bob'),(3,'Charlie');
INSERT INTO students_course_b VALUES (2,'Bob'),(3,'Charlie'),(4,'Diana');

-- Students in BOTH courses
SELECT DISTINCT s1.student_name
FROM students_course_a s1
INNER JOIN students_course_b s2 ON s1.student_name = s2.student_name;
