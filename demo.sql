-- Creating the table(s) -- 

CREATE TABLE customers (
    -- Property/Attribute Name DataType
    id INT NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT,
    -- Assigning the 'id' property to be the Primary Key of this table
    PRIMARY KEY (id)
);


-- Adding entries to the table(s) -- 
INSERT INTO customers (id, first_name, last_name, age)
VALUES (
    1,
    "John",
    "Snow",
    25
);

-- Can add multiple entires to the table(s) as well by assing more value sets --

INSERT INTO customers (id, first_name, last_name, age)
VALUES (
    2, 
    "Johnny",
    "Bravo",
    23
), (
    3, 
    "Fred",
    "Flinstone",
    30
);

-- I can also Read from my table as follows (it's like the console.log in JS) --
SELECT * FROM customers;

-- I can choose to Read only a particular column from a table by specifying its name
SELECT first_name FROM customers;

-- I can choose to Read multiple specific columns from a table by specifying their names separated by a comma
SELECT first_name, last_name FROM customers;

-- You can also choose to only get a particular column based on a condition to narrow down or filter your query. 
SELECT first_name, last_name FROM customers WHERE age > 24;

-- You can update a record from your database table as well. It's like re-assigning a variable in JS
UPDATE customers (age) 
SET (
    age = 35
)
WHERE first_name = "Fred";

-- You can update as many records as you'd like to update
UPDATE customers (first_name, last_name, age)
SET (
    first_name = "Bruce",
    last_name = "Wayne",
    age = 31
)
WHERE first_name = "Johnny";

-- You can also add columns to your table by altering the table. This is like appending, or pushing to the end of an array: 
ALTER TABLE customers
ADD (
    address VARCHAR(50)
);

-- Finally, you have the ability to delete the table: 
DELETE FROM customers;

-- You can also delete specific entries from a table: 
DELETE FROM customers where id = 2;

-- *********** MOVING ON TO INNER JOIN ************ --

-- When you "join" two tables in SQL, you're creating a custom table made up of the properties from two seperate tables that you would like to combine. This becomes extremly useful because the better our tables are, the easier we can extract the data from our database to serve our needs. 

-- The first thing you want to do is create several other tables

CREATE TABLE products (
    id INT NOT NULL, 
    itemName VARCHAR(20),
    price MONEY
);



