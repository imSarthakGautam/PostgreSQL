CREATE TABLE employees (
    emp_id SERIAL PRIMARY_KEY;
    lname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    dept VARCHAR(50),
    salary DECIMAL(10,2) DEFAULT 3000.00,
    --10 digits, precision .00 => 12345678.90
    hire_date DATE NOT NULL DEFAULT CURRENT_DATE
);

INSERT INTO employees (lname, email, dept, salary, hire_date) VALUES
('Smith', 'john.smith@example.com', 'Sales', 6000.00, '2022-01-15'),
('Johnson', 'alice.johnson@example.com', 'Marketing', 7500.50, '2021-11-01'),
('Williams', 'bob.williams@example.com', 'IT', 9000.00, '2023-03-10'),
('Brown', 'eva.brown@example.com', 'HR', 5500.00, '2022-06-20'),
('Davis', 'michael.davis@example.com', 'Finance', 8000.75, '2020-09-05'),
('Garcia', 'olivia.garcia@example.com', 'Sales', 6200.00, '2023-01-25'),
('Rodriguez', 'david.rodriguez@example.com', 'Marketing', 7800.25, '2022-04-12'),
('Wilson', 'sophia.wilson@example.com', 'IT', 9500.00, '2021-07-18'),
('Martinez', 'daniel.martinez@example.com', 'HR', 5800.00, '2023-05-02'),
('Anderson', 'mia.anderson@example.com', 'Finance', 8200.50, '2022-10-29');

-- Example using default values for salary and hire_date
INSERT INTO employees (lname, email, dept) VALUES
('Thomas', 'james.thomas@example.com', 'Operations');

-- Example showing how the unique constraint works. This will still cause an error
-- INSERT INTO employees (lname, email, dept) VALUES ('Hall', 'john.smith@example.com', 'Legal');