-- ========================================================
-- PROJECT: E-COMMERCE INVENTORY & SALES ANALYSIS
-- AUTHOR: Deepti
-- DESCRIPTION: Database structure design and advanced analytical business queries.
-- ========================================================

-- SECTION 1: DATABASE STRUCTURE (SCHEMA)
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


-- SECTION 2: MOCK DATA INGESTION
INSERT INTO Products VALUES 
(101, 'iPhone 15', 'Electronics', 799.99, 15),
(102, 'Logitech Mouse', 'Electronics', 29.99, 50),
(103, 'Running Shoes', 'Apparel', 89.99, 0),
(104, 'Coffee Mug', 'Home Decor', 14.99, 100),
(105, 'Yoga Mat', 'Fitness', 39.99, 25);

INSERT INTO Customers VALUES 
(1, 'Amit', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Rahul', 'Delhi'),
(4, 'Sneha', 'Bangalore');

INSERT INTO Orders VALUES 
(5001, 1, 101, '2026-01-10', 1),
(5002, 2, 102, '2026-01-11', 2),
(5003, 1, 104, '2026-01-12', 3),
(5004, 3, 101, '2026-01-12', 1),
(5005, 4, 105, '2026-01-13', 1);


-- SECTION 3: ANALYTICAL BUSINESS QUERIES

-- Query 1: High-Value Sales Report (JOINs & Aggregations)
SELECT 
    p.product_name,
    SUM(o.quantity) AS total_units_sold,
    SUM(o.quantity * p.price) AS total_revenue
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- Query 2: Inventory Alert System (Conditional logic via CASE statements)
SELECT product_name, category, stock_quantity,
       CASE 
            WHEN stock_quantity = 0 THEN 'Out of Stock'
            WHEN stock_quantity <= 20 THEN 'Low Stock - Reorder Now'
            ELSE 'Healthy Stock'
       END AS inventory_status
FROM Products;

-- Query 3: Customer Leaderboard (Advanced CTEs & Window Functions)
WITH CustomerSpend AS (
    SELECT 
        c.first_name,
        c.city,
        SUM(o.quantity * p.price) AS total_spent
    FROM Orders o
    JOIN Customers c ON o.customer_id = c.customer_id
    JOIN Products p ON o.product_id = p.product_id
    GROUP BY c.first_name, c.city
)
SELECT 
    first_name,
    city,
    total_spent,
    DENSE_RANK() OVER (ORDER BY total_spent DESC) as customer_rank
FROM CustomerSpend;
