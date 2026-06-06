-- ============================================
-- Chapter 1: Data Definition Language (DDL)
-- 03. Drop Table Command
-- ============================================
USE company;

DROP TABLE IF EXISTS temp_table;
DROP TABLE IF EXISTS table1, table2, table3;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS customers;

TRUNCATE TABLE employees;

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;

CREATE TABLE employees_backup AS SELECT * FROM employees;
