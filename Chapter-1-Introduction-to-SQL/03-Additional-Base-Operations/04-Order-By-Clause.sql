-- ============================================
-- Chapter 1: Additional Base Operations
-- 04. Ordering the Display of Tuples (ORDER BY)
-- ============================================
USE company;

SELECT first_name, salary FROM employees ORDER BY first_name;
SELECT first_name, salary FROM employees ORDER BY salary DESC;

SELECT first_name, department, salary FROM employees
ORDER BY department ASC, salary DESC;

SELECT first_name, salary, salary * 12 AS annual_salary
FROM employees ORDER BY annual_salary DESC;

SELECT first_name, LENGTH(first_name) AS name_length FROM employees
ORDER BY LENGTH(first_name) DESC;

SELECT first_name, hire_date FROM employees ORDER BY hire_date DESC;

SELECT first_name, salary FROM employees
ORDER BY salary DESC LIMIT 5;

SELECT first_name, salary FROM employees
ORDER BY salary DESC LIMIT 3 OFFSET 2;

SELECT first_name, department FROM employees
ORDER BY CASE 
    WHEN department = 'Sales' THEN 1
    WHEN department = 'IT' THEN 2
    WHEN department = 'HR' THEN 3
    ELSE 4
END;

SELECT first_name, department, salary, salary * 12 AS annual_salary
FROM employees
ORDER BY department ASC, salary DESC;
