
-- 1. UPPER() and LOWER():
SELECT UPPER(lname) AS last_name_uppercase, LOWER(email) AS email_lowercase
FROM employees;

-- 2. LENGTH():
SELECT lname, LENGTH(lname) AS last_name_length
FROM employees;

-- 3. TRIM():
SELECT TRIM('   Hello World   ') AS trimmed_string; -- Result: 'Hello World'
SELECT TRIM(LEADING '0' FROM '000123') AS trimmed_leading_zeros; -- Result: '123'
SELECT TRIM(TRAILING '0' FROM '12300') AS trimmed_leading_zeros; -- Result: '123'
SELECT TRIM(BOTH '0' FROM '0012300') AS trimmed_leading_zeros; -- Result: '123'

-- 4. SUBSTRING():
SELECT SUBSTRING(email FROM 1 FOR 5) AS first_five_email_chars -- Get the first 5 characters of the email
FROM employees;
-- john.example.com --> john.

SELECT SUBSTRING(lname, 2, 3) AS middle_three_letters -- Get 3 characters starting from the 2nd position
FROM employees;
---- gautam --> aut


--5. || (Concatenation Operator):
SELECT lname || ', ' || email AS employee_contact
FROM employees;

--6. POSITION():
SELECT email, POSITION('@' IN email) AS at_position
FROM employees;
-- "john.smith@example.com"	: 11

-- 7. REPLACE():
-- REPLACE(string, old_substring, new_substring)
SELECT REPLACE(email, 'example.com', 'newdomain.net') AS updated_email
FROM employees;

--8. INITCAP():Converts the first letter of each word in a string to uppercase and the rest to lowercase.
SELECT INITCAP('hello world') AS initcap_string; -- Result: 'Hello World'


-- 9. LIKE && ILIKE
SELECT * FROM employees WHERE lname LIKE 'S%'; -- Case-sensitive: Last names starting with 'S'
SELECT * FROM employees WHERE lname ILIKE 's%'; -- Case-insensitive: Last names starting with 's' or 'S'