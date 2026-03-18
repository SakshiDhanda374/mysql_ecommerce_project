CREATE DATABASE ECommerce;
USE ECommerce;
-- Create Customers Table
CREATE TABLE if not exists customers
(cust_id INT PRIMARY KEY, 
cust_name VARCHAR(20) NOT NULL, 
city VARCHAR(20));

-- Create Table Products
CREATE TABLE products
(prod_id INT PRIMARY KEY,
prod_name VARCHAR(20) NOT NULL, 
price INT CHECK(price>0));

-- Create Table Orders
CREATE TABLE orders
(ord_id INT PRIMARY KEY,
quantity INT,
cust_id INT, 
prod_id INT,
FOREIGN KEY(cust_id) references customers(cust_id),
FOREIGN KEY(prod_id) references products(prod_id));

-- Insert Data into Customers
INSERT INTO customers
(cust_id,cust_name,city)VALUES
(1, 'Rahul', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Aman', 'Pune'),
(4, 'Neha', 'Delhi'),
(5, 'Karan', 'Chandigarh'),
(6, 'Anita', 'Jaipur'),
(7, 'Rohit', 'Delhi'),
(8, 'Simran', 'Punjab'),
(9, 'Vikas', 'Noida'),
(10, 'Pooja', 'Gurgaon');

-- Insert Data into Products
INSERT INTO products
(prod_id,prod_name,price) VALUES
(101, 'Laptop', 60000),
(102, 'Mobile', 20000),
(103, 'Headphones', 2000),
(104, 'Keyboard', 1500),
(105, 'Mouse', 800),
(106, 'Tablet', 30000),
(107, 'Smartwatch', 5000);

-- Insert Data into Orders
INSERT INTO orders
(ord_id,quantity,cust_id,prod_id)VALUES
(1,1,1, 101),
(2,2,2, 102),
(3,3,3, 103),
(4,1,4, 104),
(5,2,5, 105),
(6, 1,6, 101),
(7,1,7, 102),
(8,2,1, 103),
(9,1,8, 106),
(10,2,9, 107),
(11,1,10, 101),
(12,1,3, 102);

-- View all data
SELECT*FROM customers;
SELECT*FROM products;
SELECT*FROM orders;

-- JOIN Query (customers,products,orders)
SELECT c.cust_name,p.prod_name,o.quantity
 FROM orders as o 
 JOIN customers as c
 ON o.cust_id=c.cust_id 
 JOIN products as p 
 ON o.prod_id=p.prod_id;
 
 -- Calculate Total Revenue from all Orders
 SELECT SUM(p.price * o.quantity) AS total_revenue
FROM orders o
JOIN products p 
ON o.prod_id = p.prod_id;

--  City-wise Customer Count
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city;

--  Top Selling Product
SELECT p.prod_name, SUM(o.quantity) AS total_sold
FROM orders o
JOIN products p ON o.prod_id = p.prod_id
GROUP BY p.prod_name
ORDER BY total_sold DESC;

-- High Spending Customers
SELECT c.cust_name, SUM(p.price * o.quantity) AS total_spent
FROM orders o
JOIN customers c ON o.cust_id = c.cust_id
JOIN products p ON o.prod_id = p.prod_id
GROUP BY c.cust_name
ORDER BY total_spent DESC;

-- Update 
UPDATE products
SET price = 65000
WHERE prod_id = 101;

-- Delete 
DELETE FROM orders
WHERE ord_id = 5;

-- Final Check
SELECT * FROM orders;


