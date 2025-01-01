-- Create the database (if it doesn't exist)
CREATE DATABASE IF NOT EXISTS notes_app;

-- Use the notes_app database
USE notes_app;

-- Create the notes table
CREATE TABLE IF NOT EXISTS notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO notes (title, content) VALUES
('Grocery List', 'Milk, eggs, bread, cheese, apples'),
('Meeting Notes', 'Discussed project updates, assigned tasks, scheduled next meeting.');

-- Verify the data (optional)
SELECT * FROM notes;