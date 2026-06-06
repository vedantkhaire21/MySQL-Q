-- ============================================
-- Chapter 2: Advanced SQL
-- 02. Group By Clause
-- ============================================
USE company;

SELECT department, COUNT(*) AS employee_count FROM employees GROUP BY department;
SELECT department, SUM(salary) AS total_salary FROM employees GROUP BY department;

SELECT 
    department,
    YEAR(hire_date) AS hire_year,
    COUNT(*) AS count
FROM employees
GROUP BY department, YEAR(hire_date);

SELECT 
    department,
    COUNT(*) AS employee_count,
    ROUND(AVG(salary), 2) AS avg_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department;

SELECT department, COUNT(*) AS employee_count, AVG(salary) AS avg_salary
FROM employees
WHERE salary > 65000
GROUP BY department;

SELECT department, SUM(salary) AS total_payroll
FROM employees
GROUP BY department
ORDER BY total_payroll DESC;

SELECT 
    YEAR(hire_date) AS hire_year,
    COUNT(*) AS hires,
    ROUND(AVG(salary), 2) AS avg_starting_salary
FROM employees
GROUP BY YEAR(hire_date)
ORDER BY hire_year;

SELECT 
    CASE 
        WHEN salary < 65000 THEN 'Level 1'
        WHEN salary < 75000 THEN 'Level 2'
        ELSE 'Level 3'
    END AS pay_grade,
    COUNT(*) AS employee_count,
    ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY pay_grade;
