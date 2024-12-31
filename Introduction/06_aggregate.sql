-- 1. COUNT() --------------

-- Total number of employees
SELECT COUNT(*) FROM employees; 
-- Total number of employees using primary key(unique & not null)
SELECT COUNT(emp_id) FROM employees;
-- Number of employees with a department assigned
SELECT COUNT(dept) FROM employees;
-- Number of distinct departments
SELECT COUNT(DISTINCT dept) FROM employees; 

-- 2. SUM() ----------------
SELECT SUM(salary) FROM employees; -- Total salary of all employees

-- 3. AVG() ------------------
SELECT AVG(salary) FROM employees; -- Average salary of all employees

-- 4. MIN() & MAX() -------------
SELECT MIN(salary) FROM employees; -- Lowest salary
SELECT MAX(salary) FROM employees; -- Highest salary