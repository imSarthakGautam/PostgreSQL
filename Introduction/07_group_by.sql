-- Always give column bASed on which grouping happens

-- error 1: SELECT * FROM employees GROUP BY dept;
SELECT dept FROM employees
GROUP BY dept; -- displays all unique departments;

-- Now for operating inside each unique departments, give 2nd parameter after comma (,)
SELECT dept, count(emp_id) AS employee_count
 FROM employees
 GROUP BY dept;

SELECT dept, sum(salary) AS department_cost
 FROM employees
 GROUP BY dept;

SELECT dept, AVG(salary) AS average_salary
FROM employees
GROUP BY dept;

-- ----------------------------------------------------------------

-- for group by with multiple columns

/*
ALTER TABLE employees ADD COLUMN location VARCHAR(50);

UPDATE employees SET location = 'New York' WHERE dept = 'Sales';
UPDATE employees SET location = 'Los Angeles' WHERE dept = 'Marketing';
UPDATE employees SET location = 'Chicago' WHERE dept = 'IT';
UPDATE employees SET location = 'New York' WHERE dept = 'HR';
UPDATE employees SET location = 'Los Angeles' WHERE dept = 'Finance';
UPDATE employees SET location = 'Chicago' WHERE dept = 'Operations';
*/


-- groups the rows first by dept and then by location.
--  So, you'll get separate average salaries for 'Sales' in 'New York', 'Marketing' in 'Los Angeles', 'IT' in 'Chicago', and so on.
SELECT dept, location, AVG(salary) AS average_salary
FROM employees
GROUP BY dept, location;


-- -------------------------------------------------------------

-- group by with having clause
SELECT dept, location, AVG(salary) AS average_salary
FROM employees
GROUP BY dept, location
HAVING AVG(salary) > 7000;
-- The HAVING clause filters the results after the grouping has been done. This is important: WHERE filters rows before grouping, and HAVING filters groups after grouping.

