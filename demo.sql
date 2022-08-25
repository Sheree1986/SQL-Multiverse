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



