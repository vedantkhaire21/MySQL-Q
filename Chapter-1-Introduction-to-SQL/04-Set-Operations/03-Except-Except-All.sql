-- ============================================
-- Chapter 1: Set Operations
-- 03. Except / Except All Queries
-- ============================================
USE company;

CREATE TABLE IF NOT EXISTS sales_team (emp_id INT, name VARCHAR(50));
CREATE TABLE IF NOT EXISTS it_team (emp_id INT, name VARCHAR(50));

INSERT INTO sales_team VALUES (1,'Alice'),(2,'Bob'),(3,'Charlie'),(4,'Diana');
INSERT INTO it_team VALUES (2,'Bob'),(4,'Diana'),(5,'Eve');

-- EXCEPT using LEFT JOIN
SELECT DISTINCT s.name
FROM sales_team s
LEFT JOIN it_team i ON s.name = i.name
WHERE i.name IS NULL;

-- EXCEPT using NOT EXISTS
SELECT DISTINCT s.name
FROM sales_team s
WHERE NOT EXISTS (
    SELECT 1 FROM it_team i WHERE i.name = s.name
);

-- EXCEPT using NOT IN
SELECT DISTINCT name FROM sales_team
WHERE name NOT IN (SELECT name FROM it_team);

CREATE TABLE IF NOT EXISTS registered_students (student_id INT, name VARCHAR(50));
CREATE TABLE IF NOT EXISTS attending_students (student_id INT, name VARCHAR(50));

INSERT INTO registered_students VALUES (1,'Alice'),(2,'Bob'),(3,'Charlie'),(4,'Diana');
INSERT INTO attending_students VALUES (1,'Alice'),(3,'Charlie'),(4,'Diana');

-- Students registered but not attending
SELECT DISTINCT r.name FROM registered_students r
WHERE r.name NOT IN (SELECT name FROM attending_students);

-- Employees in Sales or IT but not both
SELECT s.name FROM sales_team s
WHERE s.name NOT IN (SELECT i.name FROM it_team i)
UNION
SELECT i.name FROM it_team i
WHERE i.name NOT IN (SELECT s.name FROM sales_team s);
