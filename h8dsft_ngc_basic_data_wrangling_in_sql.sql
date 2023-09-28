-- SQL querry in PostgreSQL

-- Membuat dan menggunakan database Sales
CREATE DATABASE Sales;
\c Sales;

-- 1. You are asked to create a customer and order table 
-- as follows "Customers" and "Orders". Determine the right 
-- datatype to create the two tables. Here are the structures 
-- and data for both tables:

-- Membuat tabel Customers
CREATE TABLE Customers (
	customer_id SERIAL PRIMARY KEY,
	customer_name VARCHAR(250) NOT NULL,
	city VARCHAR(50)
	);

-- Membuat tabel Orders
CREATE TABLE Orders (
	order_id SERIAL PRIMARY KEY,
	customer_id INT,
	order_date DATE,
	total_amount NUMERIC(5,2),
	FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
	);

-- Memasukan value tabel Customers
INSERT INTO Customers(customer_name, city)
VALUES
	('John Doe', 'New York'),
	('Jane Smith', 'Los Angeles'),
	('David Johnson', 'Chicago')

SELECT * FROM Customers -- Menampilkan tabel Customers

-- Memasukan value tabel Orders
INSERT INTO Orders(customer_id, order_date, total_amount)
VALUES
	(1, '2022/01/10', 100),
	(1, '2022/02/15', 150),
	(2, '2022/03/20', 200),
	(3, '2022/04/25', 50)
	
SELECT * FROM Orders -- Menampilkan tabel Orders

-- 2. Once you have successfully created both tables, 
-- create a query to retrieve the total number of orders made 
-- by each customer along with the customer name from 
-- the "Customers" and "Orders" tables. Expected Output:

-- Memprint tabel yang memiliki kolom customer_name dan juga total_orders -
-- yang meruapakan hasil dari menghitung banyaknya transaksi yang dilakukan setiap customer -
-- yang kemudian diurutkan berdasarkan customer_id
SELECT customer_name, COUNT(Orders.customer_id) AS total_orders
FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id