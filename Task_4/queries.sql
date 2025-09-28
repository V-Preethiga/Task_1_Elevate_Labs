-- Database Creation

CREATE DATABASE ecommerce;
use ecommerce;

-- Table Creation and Data Loading

CREATE TABLE customers ( customer_id VARCHAR(50) PRIMARY KEY, customer_unique_id VARCHAR(50), customer_zip_prefix INT, customer_city VARCHAR(100), customer_state VARCHAR(10));

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customers.csv" INTO TABLE customers FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (customer_id, customer_unique_id, customer_zip_prefix, customer_city, customer_state);

CREATE TABLE orders (order_id VARCHAR(50) PRIMARY KEY, customer_id VARCHAR(50), order_status VARCHAR(20), order_purchase_timestamp DATETIME, order_approved_at DATETIME, order_delivered_carrier_date DATETIME, order_delivered_customer_date DATETIME, order_estimated_delivery_date DATETIME,FOREIGN KEY (customer_id) REFERENCES customers(customer_id));

ALTER TABLE orders ADD COLUMN customer_state VARCHAR(10);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders.csv" INTO TABLE orders FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (order_id, customer_id, order_status, @purchase_ts, @approved_at, @delivered_carrier, @delivered_customer, @estimated_delivery, customer_state) SET order_purchase_timestamp      = STR_TO_DATE(@purchase_ts, '%d-%m-%Y %H:%i'),
order_approved_at = STR_TO_DATE(@approved_at, '%d-%m-%Y %H:%i'), order_delivered_carrier_date  = STR_TO_DATE(NULLIF(@delivered_carrier,''), '%d-%m-%Y %H:%i'), order_delivered_customer_date = STR_TO_DATE(NULLIF(@delivered_customer,''), '%d-%m-%Y %H:%i'), order_estimated_delivery_date = STR_TO_DATE(NULLIF(@estimated_delivery,''), '%d-%m-%Y %H:%i');

-- Data Retrieval Queries

SELECT * FROM customers LIMIT 10;

SELECT * FROM orders WHERE order_status = 'delivered' LIMIT 10;

-- Aggregate function

SELECT AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)) AS avg_delivery_days FROM orders WHERE order_delivered_customer_date IS NOT NULL;

SELECT o.customer_id, SUM(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)) AS total_delivery_days FROM orders o WHERE o.order_delivered_customer_date IS NOT NULL GROUP BY o.customer_id ORDER BY total_delivery_days DESC LIMIT 10;

-- Joins

SELECT o.order_id, c.customer_city, o.order_status FROM orders o JOIN customers c ON o.customer_id = c.customer_id WHERE c.customer_city = 'Sao Paulo';

SELECT o.order_id, c.customer_city, o.order_status FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id LIMIT 10;

SELECT c.customer_id, o.order_id FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id LIMIT 10;

SELECT o.order_id, o.customer_id, o.order_status, c.customer_unique_id FROM orders o RIGHT JOIN customers c ON o.customer_id = c.customer_id LIMIT 20;


-- Subquery

SELECT * FROM orders WHERE customer_id = ( SELECT customer_id FROM orders GROUP BY customer_id ORDER BY COUNT(order_id) DESC  LIMIT 1);

-- Order by and Group by

SELECT order_status, COUNT(*) AS total_orders FROM orders GROUP BY order_status ORDER BY total_orders DESC;

-- Views

CREATE VIEW orders_summary AS SELECT order_status, COUNT(order_id) AS total_orders, AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)) AS avg_delivery_days, MIN(order_purchase_timestamp) AS first_order_date, MAX(order_purchase_timestamp) AS last_order_date FROM orders WHERE order_delivered_customer_date IS NOT NULL GROUP BY order_status ORDER BY total_orders DESC;

SELECT * FROM orders_summary;

-- Index

CREATE INDEX idx_orders_status ON orders(order_status);
SELECT * FROM orders WHERE order_status = 'delivered';


