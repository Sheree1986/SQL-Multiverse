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
UPDATE customers
SET age = 35
WHERE first_name = "Fred";

-- You can update as many records as you'd like to update
UPDATE customers
SET 
    first_name = "Bruce",
    last_name = "Wayne",
    age = 31 
WHERE first_name = "Johnny";

-- You can also add columns to your table by altering the table. This is like appending, or pushing to the end of an array: 
ALTER TABLE customers
ADD address VARCHAR(50);

-- Notice if you read the table, you'll have a column for the address full of NULL values. It's similar to how when you don't assign a value to a variable in JS, it's undefined by default. You can ofcourse, assign it or give it a value to update it. 
UPDATE customers
SET address = "123 Generic Street, GenCity, GC, 12345" 
WHERE id = 1;

UPDATE customers
SET address = "456 Basic Street, BasicCity, BC, 98765" 
WHERE id = 2;

UPDATE customers
SET address = "789 Common Street, CommonCity, CC, 65748" 
WHERE id = 3;

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
    price MONEY,
    PRIMARY KEY (id)
);

INSERT INTO products (id, itemName, price)
VALUES (
    1,
    "Pen",
    4.99
), (
    2,
    "Printer",
    49.99
), (
    3,
    "Notebook",
    9.99
);

CREATE TABLE orders (
    id INT NOT NULL,
    order_number INT,
    products_id INT,
    customers_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (customers_id) REFERENCES customers(id),
    FOREIGN KEY (products_id) REFERENCES products(id) 
)

INSERT INTO orders (id, order_number, products_id, customers_id)
VALUES (
    1,
    0009,
    3,
    1
), (
    2, 
    0083,
    2,
    2
)

-- Now that I have a table with a foreign key, it's referring to the primary key of the table its referencing. So now this orders table has an association with the Customers Table, as well as the Products Table. This means that from this table "orders", I can extract information from both the Products and the Customers! This is where Inner Joining comes in, and it's only possible thanks to the foreign keys in our "orders" table referencing the values in the "customers" and "products" table

SELECT orders.order_number, customers.first_name, customers.last_name, customers.age
FROM orders
INNER JOIN customers
ON orders.customers_id = customers.id;

SELECT orders.order_number, products.itemName, products.price
FROM orders
INNER JOIN products
ON orders.products_id = products.id;



