
-- ARITHMETIC OPERATOR
SELECT lname, salary, salary * 0.10 AS raise -- Calculate a 10% raise & display in new col 'raise'
FROM employees;

-- LOGICAL : AND OR NOT
SELECT * FROM employees WHERE dept = 'Sales' AND salary > 6000;
SELECT * FROM employees WHERE dept = 'Sales' OR dept = 'Marketing';
SELECT * FROM employees WHERE NOT dept = 'IT'; -- Employees not in the IT department

-- LIKE OPERATOR
SELECT * FROM employees WHERE lname LIKE 'S%'; -- Last names starting with 'S'
SELECT * FROM employees WHERE email LIKE '%@example.com';
SELECT * FROM employees WHERE lname LIKE '_o%'; -- Last names with 'o' as the second letter.

-- BETWEEN OPERATOR
SELECT * FROM employees WHERE salary BETWEEN 5000 AND 7000; -- Salaries between 5000 and 7000 (inclusive)

-- IN OPERATOR
SELECT * FROM employees WHERE dept IN ('Sales', 'Marketing', 'HR');

-- IS NULL and IS NOT NULL OPERATORS
SELECT * FROM employees WHERE dept IS NULL; -- Employees with no department assigned
SELECT * FROM employees WHERE dept IS NOT NULL;

-- CONCATENATION OPERATOR : combines two or more strings.
SELECT lname || ',' || email AS employee_contact 
FROM employees; -- Combines last name and email and displays under new column 'employee_contact'
