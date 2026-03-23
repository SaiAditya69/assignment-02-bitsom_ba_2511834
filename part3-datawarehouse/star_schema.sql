-- Dimension: Date
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    month INT,
    year INT
);

-- Dimension: Store
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50)
);

-- Dimension: Product
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- Fact Table
CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

INSERT INTO dim_date VALUES
(1, '2024-01-01', 1, 2024),
(2, '2024-01-02', 1, 2024),
(3, '2024-02-01', 2, 2024),
(4, '2024-02-05', 2, 2024),
(5, '2024-03-01', 3, 2024);

INSERT INTO dim_store VALUES
(1, 'Store A', 'Mumbai'),
(2, 'Store B', 'Delhi'),
(3, 'Store C', 'Bangalore');

INSERT INTO dim_product VALUES
(1, 'Laptop', 'Electronics'),
(2, 'Phone', 'Electronics'),
(3, 'Shirt', 'Clothing'),
(4, 'Milk', 'Groceries'),
(5, 'Rice', 'Groceries');

INSERT INTO fact_sales VALUES
(1, 1, 1, 1, 1, 50000),
(2, 1, 1, 2, 2, 40000),
(3, 2, 2, 3, 3, 3000),
(4, 2, 3, 4, 5, 500),
(5, 3, 1, 5, 2, 2000),
(6, 3, 2, 1, 1, 50000),
(7, 4, 3, 2, 1, 20000),
(8, 4, 1, 3, 4, 4000),
(9, 5, 2, 4, 6, 600),
(10, 5, 3, 5, 3, 3000);

