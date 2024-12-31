-- 1. WHERE CLAUSE ------------------------------
-- find employees with salary greater than 7000:
SELECT * FROM employees WHERE salary > 7000;
-- Find employees in the 'Sales' department:
SELECT * FROM employees WHERE dept = 'Sales';
-- Find employees hired after January 1, 2022:
SELECT * FROM employees WHERE hire_date > '2022-01-01';


-- 2 DISTINCT CLAUSE --------------------------
-- Get a list of unique departments:
SELECT DISTINCT dept FROM employees;


-- 3. LIKE CLAUSE ----------------------------
-- Find employees whose last name starts with 'W':
SELECT * FROM employees WHERE lname LIKE 'W%';
-- Find employees whose email contains 'example.com' (this will likely return all of them in this example, but it's a useful demonstration):
SELECT * FROM employees WHERE email LIKE '%example.com%';


-- 4. ORDER BY CLAUSE ------------------
--Sort employees by salary in descending order:
SELECT * FROM employees ORDER BY salary DESC;
-- Sort employees by department and then by last name in ascending order:
SELECT * FROM employees ORDER BY dept, lname; --eg: FINANCE:  C, D, MARKETING: A, B 


-- 5. LIMIT ----------------
-- Get the first 3 employees:
SELECT * FROM employees LIMIT 3;


-- COMBINING CLAUSES--
--Find the 2 highest-paid employees in the 'Marketing' department:
SELECT *
FROM employees
WHERE dept = 'Marketing'
ORDER BY salary DESC
LIMIT 2;

