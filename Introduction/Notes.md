## SQL Commands: 

REVISION of SQL commands in PostgreSQL, covering basic to intermediate concepts.

**I. Basic SQL Commands**

These commands are fundamental for interacting with relational databases.

**A. Data Definition Language (DDL)**

DDL commands are used to define the database schema (structure).

1.  **CREATE TABLE:** Creates a new table.

    ```sql
    CREATE TABLE table_name (
        column1_name data_type constraints,
        column2_name data_type constraints,
        ...
        PRIMARY KEY (column_name(s)), -- Optional primary key
        FOREIGN KEY (column_name) REFERENCES other_table(column_name) -- Optional foreign key
    );
    ```

    *   `data_type`: Specifies the type of data the column will hold (e.g., `INTEGER`, `VARCHAR`, `DATE`, `TEXT`).
    *   `constraints`: Rules enforced on the data (e.g., `NOT NULL`, `UNIQUE`, `CHECK`).

    *Example:*

    ```sql
    CREATE TABLE employees (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        department_id INTEGER REFERENCES departments(id),
        salary NUMERIC
    );
    ```

2.  **ALTER TABLE:** Modifies an existing table.

    ```sql
    ALTER TABLE table_name
        ADD COLUMN column_name data_type constraints,      -- Add a column
        DROP COLUMN column_name,                           -- Remove a column
        ALTER COLUMN column_name SET DATA TYPE data_type, -- Change data type
        ADD CONSTRAINT constraint_name constraint_definition; -- Add a constraint
    ```

    *Example:*
    ```sql
    ALTER TABLE employees
        ADD COLUMN email VARCHAR(255) UNIQUE;
    ```

3.  **DROP TABLE:** Deletes a table.

    ```sql
    DROP TABLE table_name;
    ```

    *Example:*
    ```sql
    DROP TABLE employees;
    ```

**B. Data Manipulation Language (DML)**

DML commands are used to manipulate data within tables.

1.  **INSERT INTO:** Inserts new rows into a table.

    ```sql
    INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);
    -- Or to insert into all columns
    INSERT INTO table_name VALUES (value1, value2, ...);
    ```

    *Example:*
    ```sql
    INSERT INTO employees (name, department_id, salary) VALUES ('John Doe', 1, 60000);
    ```

2.  **SELECT:** Retrieves data from a table.

    ```sql
    SELECT column1, column2, ... FROM table_name; -- Select specific columns
    SELECT * FROM table_name;                 -- Select all columns
    ```

    *Example:*
    ```sql
    SELECT name, salary FROM employees;
    ```

3.  **UPDATE:** Modifies existing data in a table.

    ```sql
    UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition;
    ```

    *Example:*
    ```sql
    UPDATE employees SET salary = 65000 WHERE name = 'John Doe';
    ```

4.  **DELETE:** Removes rows from a table.

    ```sql
    DELETE FROM table_name WHERE condition;
    ```

    *Example:*
    ```sql
    DELETE FROM employees WHERE name = 'John Doe';
    ```

**II. Intermediate SQL Commands**

These commands allow for more complex data retrieval and manipulation.

**A. Filtering and Sorting**

1.  **WHERE:** Filters rows based on a condition.

    *Example:*
    ```sql
    SELECT * FROM employees WHERE salary > 50000;
    SELECT * FROM employees WHERE department_id = 1 AND salary < 70000;
    SELECT * FROM employees WHERE name LIKE 'J%'; -- Names starting with J
    ```

2.  **ORDER BY:** Sorts the result set.

    ```sql
    SELECT * FROM employees ORDER BY salary ASC;   -- Ascending order (default)
    SELECT * FROM employees ORDER BY salary DESC;  -- Descending order
    SELECT * FROM employees ORDER BY department_id, salary DESC; -- Sort by department then salary
    ```

3.  **LIMIT and OFFSET:** Limits the number of returned rows and skips a certain number of rows.

    ```sql
    SELECT * FROM employees LIMIT 10;          -- Returns the first 10 rows
    SELECT * FROM employees OFFSET 5 LIMIT 10; -- Skips the first 5 rows and returns the next 10
    ```

**B. Aggregate Functions and Grouping**

1.  **Aggregate Functions:** Perform calculations on a set of values and return a single value.

    *   `COUNT()`: Counts the number of rows.
    *   `SUM()`: Calculates the sum of values.
    *   `AVG()`: Calculates the average of values.
    *   `MIN()`: Finds the minimum value.
    *   `MAX()`: Finds the maximum value.

    *Example:*
    ```sql
    SELECT COUNT(*) FROM employees;
    SELECT AVG(salary) FROM employees;
    ```

2.  **GROUP BY:** Groups rows based on one or more columns.

    ```sql
    SELECT department_id, AVG(salary) FROM employees GROUP BY department_id;
    ```

3.  **HAVING:** Filters groups based on a condition (used with `GROUP BY`).

    ```sql
    SELECT department_id, AVG(salary) FROM employees GROUP BY department_id HAVING AVG(salary) > 60000;
    ```

**C. Joins**

Joins combine rows from two or more tables based on a related column.

1.  **INNER JOIN:** Returns rows only when there is a match in both tables.

    ```sql
    SELECT employees.name, departments.name
    FROM employees
    INNER JOIN departments ON employees.department_id = departments.id;
    ```

2.  **LEFT JOIN (LEFT OUTER JOIN):** Returns all rows from the left table and matching rows from the right table. If there's no match, NULL values are returned for the right table's columns.

    ```sql
    SELECT employees.name, departments.name
    FROM employees
    LEFT JOIN departments ON employees.department_id = departments.id;
    ```

3.  **RIGHT JOIN (RIGHT OUTER JOIN):** Returns all rows from the right table and matching rows from the left table.

4.  **FULL OUTER JOIN:** Returns all rows from both tables.

**D. Subqueries**

A subquery is a query nested inside another query.

```sql
SELECT * FROM employees WHERE department_id IN (SELECT id FROM departments WHERE name LIKE 'Sales%');
```

This documentation covers essential SQL commands from basic to intermediate levels. Remember to practice regularly and refer to the PostgreSQL documentation for more advanced topics.
