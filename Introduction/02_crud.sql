-- Operations on Table: remain inside a particular db while operating

-- create
CREATE TABLE person (
 id INT,
 name VARCHAR(100),
 city VARCHAR(100)
);
-- add data into table
CREATE TABLE person (
 id INT,
 name VARCHAR(100),
 city VARCHAR(100)
);


-- read
SELECT * FROM person; -- to read an entire table
SELECT name FROM person; --to ony read a column

-- update
UPDATE person 
    SET city='Pokhara'
    WHERE id='101';

-- delete
DELETE FROM person
    WHERE id='102';
