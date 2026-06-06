-- ============================================
-- Chapter 1: Data Definition Language (DDL)
-- 02. Alter Table Commands
-- ============================================
USE company;

ALTER TABLE employees ADD COLUMN department VARCHAR(50);
ALTER TABLE employees ADD COLUMN phone VARCHAR(20), ADD COLUMN manager_id INT;
ALTER TABLE employees ADD COLUMN birth_date DATE AFTER hire_date;
ALTER TABLE employees ADD COLUMN emp_status VARCHAR(20) FIRST;

ALTER TABLE employees MODIFY COLUMN phone VARCHAR(15);
ALTER TABLE employees MODIFY COLUMN salary DECIMAL(12,2);
ALTER TABLE employees MODIFY COLUMN department VARCHAR(50) NOT NULL;
ALTER TABLE employees MODIFY COLUMN emp_status VARCHAR(20) DEFAULT 'Active';

ALTER TABLE employees DROP COLUMN manager_id;
ALTER TABLE employees DROP COLUMN birth_date;

ALTER TABLE employees RENAME COLUMN email TO email_address;

ALTER TABLE employees ADD UNIQUE (email_address);
ALTER TABLE employees ADD CONSTRAINT check_salary CHECK (salary > 0);

ALTER TABLE employees DROP INDEX email_address;
ALTER TABLE employees DROP CHECK check_salary;

ALTER TABLE employees MODIFY COLUMN department VARCHAR(50) AFTER hire_date;

DESCRIBE employees;
SHOW COLUMNS FROM employees;
