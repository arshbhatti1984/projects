CREATE DATABASE e_commerce;
USE e_commerce;
--
CREATE TABLE Customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150),
  city VARCHAR(100)
);

CREATE TABLE Products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  category VARCHAR(100),
  price DECIMAL(10,2) NOT NULL,
  stock INT 
);

CREATE TABLE Orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,        
  order_date DATE NOT NULL,
  total_amount DECIMAL(12,2) 
);

CREATE TABLE Order_Details (
  detail_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,          
  product_id INT NOT NULL,         
  quantity INT NOT NULL,
  subtotal DECIMAL(12,2) NOT NULL
);

CREATE TABLE Payments (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,           
  payment_date DATE NOT NULL,
  payment_method VARCHAR(50),
  amount_paid DECIMAL(12,2) NOT NULL
);

INSERT INTO Customers (name, email, city) VALUES
('Akshit_Kumar','akshit.kumar@example.com','Amritsar'),
('Ravi Patel','ravi.patel@example.com','Ahmedabad'),
('Neha Sharma','neha.sharma@example.com','Delhi'),
('Harman Singh','harman.singh@example.com','Amritsar'),
('Priya Mehta','priya.mehta@example.com','Mumbai'),
('Rahul Verma','rahul.verma@example.com','Lucknow'),
('Sunita Rao','sunita.rao@example.com','Bengaluru'),
('Aarav Kapoor','aarav.kapoor@example.com','Delhi'),
('Sana Khan','sana.khan@example.com','Hyderabad'),
('Karan Malhotra','karan.malhotra@example.com','Amritsar'),
('Deepa Iyer','deepa.iyer@example.com','Chennai'),
('Manish Joshi','manish.joshi@example.com','Surat');

INSERT INTO Products (name, category, price, stock) VALUES
('Basic Phone Charger','Electronics',399.00,50),
('Wireless Mouse','Electronics',799.00,30),
('Bluetooth Headset','Electronics',1499.00,25),
('Ceramic Coffee Mug','Home & Kitchen',299.00,100),
('Cotton Bedsheet (King)','Home & Kitchen',1999.00,20),
('Stainless Steel Knife Set','Home & Kitchen',2499.00,10),
('Yoga Mat','Fitness',899.00,40),
('Dumbbell 5kg','Fitness',1200.00,15),
('Running Shoes (Size 9)','Footwear',2999.00,12),
('Leather Wallet','Accessories',999.00,60),
('Sunglasses UV400','Accessories',1299.00,0),
('Smart Watch Basic','Electronics',2199.00,8);

--

INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1,'2025-07-01',1097.00),  -- order 1 total = 798 + 299
(2,'2025-08-15',1798.00),  -- order 2 total = 799 + 999
(3,'2025-09-10',2998.00),  -- order 3 total = 2 * 1499
(1,'2025-09-22',3797.00),  -- order 4 total = 1999 + 1798
(4,'2025-10-05',2999.00),  -- order 5 total = 2999
(5,'2025-10-10',1299.00),  -- order 6 total = 1299
(6,'2025-06-20',2400.00),  -- order 7 total = 2 * 1200
(7,'2025-07-30',2499.00),  -- order 8 total = 2499
(8,'2025-10-20',2199.00),  -- order 9 total = 2199
(9,'2025-10-25',897.00);   -- order 10 total = 3 * 299
 
INSERT INTO Order_Details (order_id, product_id, quantity, subtotal) VALUES
(1,1,2, 798.00),
(1,4,1, 299.00),
(2,2,1, 799.00),
(2,10,1, 999.00),
(3,3,2, 2998.00),
(4,5,1, 1999.00),
(4,7,2, 1798.00),
(5,9,1, 2999.00),
(6,11,1, 1299.00),
(7,8,2, 2400.00),
(8,6,1, 2499.00),
(9,12,1, 2199.00),
(10,4,3, 897.00);
 
INSERT INTO Payments (order_id, payment_date, payment_method, amount_paid) VALUES
(1,'2025-07-02','Credit Card',1097.00),
(2,'2025-08-16','UPI',1798.00),
(3,'2025-09-11','Debit Card',2998.00),
(4,'2025-09-23','Cash',1000.00),
(5,'2025-10-06','Credit Card',2999.00),
(7,'2025-06-21','NetBanking',2400.00),
(8,'2025-08-01','UPI',2499.00);


select*
from customers;
select *
from products;
select*
from orders;
select *
from order_details;
select *
from payments;

-- Filtering and Searching
-- 1) List all customers from a specific city

SELECT * FROM Customers WHERE city = 'Amritsar';

-- 2) Find all products under ₹1000

SELECT * FROM Products WHERE price < 1000.00;

-- 3) Show all orders placed in 3 months
SELECT * FROM Orders
WHERE order_date >= DATE_SUB('2025-10-29', INTERVAL 3 MONTH);

-- 4) Find out-of-stock products
SELECT * FROM Products WHERE stock <= 0;

-- JOINS
-- 1) Display each customers name along with the products they ordered
SELECT
  c.name as customer_name,
  p.name as product_name,
  od.quantity,
  o.order_id,
  o.order_date
from Customers c
JOIN Orders o        
	ON c.customer_id = o.customer_id
JOIN Order_Details od 
	ON o.order_id = od.order_id
JOIN Products p      
	ON od.product_id = p.product_id
ORDER BY c.name, o.order_id, p.name;

-- 2) List order details with customer name, product name,and payment method
SELECT 
    c.name AS customer_name,
    p.name AS product_name,
    pay.payment_method
FROM Customers c
JOIN Orders o 
	ON c.customer_id = o.customer_id
JOIN Order_Details od 
	ON o.order_id = od.order_id
JOIN Products p 
	ON od.product_id = p.product_id
JOIN Payments pay 
	ON o.order_id = pay.order_id
ORDER BY c.name, p.name;

-- 3) Show all product and include customers (if any) who purchased them -- use left join

SELECT 
    p.product_id,
    p.name as product_name,
    c.name as customer_name
from Products p
LEFT JOIN Order_Details od 
	ON p.product_id = od.product_id
LEFT JOIN Orders o 
	ON od.order_id = o.order_id
LEFT JOIN Customers c 
	ON o.customer_id = c.customer_id
ORDER BY p.product_id, c.name;


-- Union

-- 1) Combine all customer names and product names into one column called all_names

SELECT name as all_names, 'Customer' as type
FROM Customers
UNION
SELECT name as all_names, 'Product' as type
FROM Products
ORDER BY all_names;

-- 2) Combine all order IDs from orders and payments table (to show which have payments and which do not)

select 
    order_id,
    'Orders Table' as source
from Orders
union
select 
    order_id,
    'Payments Table' as source
from Payments
ORDER BY order_id;

-- Case

-- 1) Categorize products by price (CASE)

SELECT product_id, name, price,
  CASE
    WHEN price < 500 THEN 'Budget'
    WHEN price BETWEEN 500 AND 2000 THEN 'Standard'
    ELSE 'Premium'
  END AS price_category
FROM Products;

-- 2) Show stock status
SELECT 
    product_id,
    name AS product_name,
    stock,
    CASE
        WHEN stock > 0 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS stock_status
FROM Products;

-- 3) Display customer category based on total purchase 
SELECT 
    c.name AS customer_name,
    CASE
        WHEN o.total_amount> 10000 THEN 'Gold'
        WHEN o.total_amount>= 5000 THEN 'Silver'
        ELSE 'Bronze'
    END AS customer_category
FROM Customers c
LEFT JOIN Orders o 
	ON c.customer_id = o.customer_id
;

-- String Functions

-- 1) Display customer names in uppercase and lowercase
SELECT customer_id, name, UPPER(name) AS name_upper, LOWER(name) AS name_lower FROM Customers;

-- 2) Extract the first three characters of product names
SELECT product_id, name, LEFT(name,3) AS first_three_chars FROM Products;

-- 3) Concatenate customer name and city
SELECT customer_id, CONCAT(name, ' - ', city) AS name_and_city FROM Customers;

-- 4)Format email IDs to show only username part (before @)
SELECT customer_id, email, SUBSTRING_INDEX(email,'@',1) AS email_username FROM Customers;

-- Subqueries
-- 1) Find customers who placed more than 3 orders

SELECT customer_id, name FROM Customers
WHERE customer_id IN (
						SELECT customer_id 
						FROM Orders
						GROUP BY customer_id
						having COUNT(order_id) > 3
					);

-- 2) Find the most expensive product
SELECT * FROM Products
WHERE price = (SELECT MAX(price) 
				FROM Products);

-- 3) List products that have never been ordered

SELECT * FROM Products p
WHERE p.product_id NOT IN 
						(SELECT product_id 
                        FROM Order_Details
                        );


-- Windows Function

-- 1) Rank customes by total spending
SELECT 
    c.customer_id,
    c.name AS customer_name,
    SUM(o.total_amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS spend_rank
FROM Customers c
JOIN Orders o 
	ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY spend_rank;

-- 2) Row Number
SELECT 
    order_id,
    customer_id,
    order_date,
    ROW_NUMBER() OVER (ORDER BY order_date) AS order_sequence
FROM Orders;

-- 3) Cumulative spending per customer
SELECT 
    order_id,
    customer_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date
    ) AS running_total
FROM Orders
ORDER BY customer_id, order_date;

-- 4) Average price per category

SELECT 
    category,
    name AS product_name,
    price,
    AVG(price) OVER (PARTITION BY category) AS avg_price_in_category
FROM Products
ORDER BY category, price;



 DELETE FROM Order_Details WHERE order_id = 6;
 DELETE FROM Payments WHERE order_id = 6;
 DELETE FROM Orders WHERE order_id = 6;

