-- part1-rdbms/schema_design.sql

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    phone VARCHAR(15)
);

CREATE TABLE SalesReps (
    salesrep_id INT PRIMARY KEY,
    salesrep_name VARCHAR(100) NOT NULL,
    region VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    salesrep_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (salesrep_id) REFERENCES SalesReps(salesrep_id)
);

CREATE TABLE OrderDetails (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Sample Inserts (5 rows each minimum)
INSERT INTO Customers VALUES
(1, 'Ravi Kumar', 'Mumbai', '9876543210'),
(2, 'Alice Dsouza', 'Delhi', '9988776655'),
(3, 'John Verma', 'Mumbai', '9123456789'),
(4, 'Meena Nair', 'Pune', '9012345678'),
(5, 'Kevin Singh', 'Bangalore', '9865321470');

INSERT INTO SalesReps VALUES
(1, 'Rahul Mehta', 'West'),
(2, 'Sonal Gupta', 'North'),
(3, 'Aman Shah', 'South'),
(4, 'Pooja Nair', 'West'),
(5, 'Raj Malhotra', 'Central');

INSERT INTO Products VALUES
(1, 'Wireless Mouse', 799.00, 'Electronics'),
(2, 'Office Chair', 4500.00, 'Furniture'),
(3, 'Laptop Bag', 1200.00, 'Accessories'),
(4, 'Keyboard', 999.00, 'Electronics'),
(5, 'Desk Lamp', 1500.00, 'Home');

INSERT INTO Orders VALUES
(101, 1, 1, '2024-02-10'),
(102, 2, 2, '2024-02-12'),
(103, 3, 1, '2024-02-20'),
(104, 5, 3, '2024-03-05'),
(105, 4, 4, '2024-03-10');

INSERT INTO OrderDetails VALUES
(101, 1, 2),
(101, 2, 1),
(102, 5, 3),
(103, 3, 1),
(104, 1, 1),
(105, 4, 2);
