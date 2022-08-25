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