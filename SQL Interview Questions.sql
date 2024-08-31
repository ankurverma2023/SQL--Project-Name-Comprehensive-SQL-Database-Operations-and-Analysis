CREATE DATABASE ENGINEER
USE ENGINEER

-- SQL INTERVIEW QUESTIONS AND ANSWERS WITH EXMAPLE

-- CREATE CUSTOMERS TABLES 
CREATE TABLE CUSTOMERS
(
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(50),
PhoneNumber VARCHAR(12),
City Varchar(50)
)
-- Insert Data into Orders Table
INSERT INTO CUSTOMERS VALUES(1,'Deepak','Kumar','Deepak@gmail.com','123-456-7890','Delhi'),
(2,'Sonu','Kumar','Sonu@gmail.com','8800661122','Noida'),
(3,'Monu','Sharma','Monu@outlook.com','7778880012','Indrapuram'),
(4,'Ashish','Verma','Ashish@yahoo.com','9999888800','Vaishali'),
(5,'Ravi','Sharma','Ravi@gmail.com','6655442200','Dadri'),
(6,'Akshay','Sharma','Akshay@gmail.com','9999988888','Delhi'),
(7,'Vidit','Jain','Vidit@gmail.com','5555444400','Gaziabaad'),
(8,'Mukesh','Kumar','Mukesh@gmail.com','9999977777','Faridabad'),
(9,'Udit','Kumar','Udit@yahoo.com','8855004466','Rohtak'),
(10,'Mukesh','Gupta','Mukesh@gmail.com','9977880033','Delhi')

SELECT * from CUSTOMERS

-- CREATE ORDERS TABLE
CREATE TABLE ORDERS
(
OrderID INT PRIMARY KEY,
OrderDate DATE,
Amount DECIMAL(10,2),
Status Varchar(50),
CustomerID INT,
FOREIGN KEY (CustomerID) REFERENCES CUSTOMERS(CustomerID)
)
-- Insert Data into Orders Table
INSERT INTO ORDERS VALUES(101,'07-11-2024',150.00,'Shipped',1),
(102,'07-12-2024',200.00,'Pending',2),
(103,'07-13-2024',350.00,'Delivered',3),
(104,'07-14-2024',120.00,'Cancelled',4),
(105,'07-15-2024',250.00,'Shipped',5),
(106,'07-16-2024',175.00,'Pending',6),
(107,'07-17-2024',400.00,'Delivered',7),
(108,'07-18-2024',300.00,'Shipped',8),
(109,'07-19-2024',225.00,'Pending',9),
(110,'07-20-2024',500.00,'Delivered',10)

SELECT * FROM ORDERS

-- Here are examples of SQL queries using the SELECT, FROM, WHERE, ORDER BY, and GROUP BY clauses based on the Customers,
-- and Orders tables created above.
-- 1- SELECT AND FROM
-- To select all columns from the Customers table:
SELECT * FROM CUSTOMERS

-- To select specific columns from the Orders table
SELECT ORDERID,OrderDate,Amount from ORDERS

--2- WHERE
-- To select customers from the Customers table who live in 'Vaishali'
select * from CUSTOMERS
Where City = 'Vaishali'

-- To select orders from the Orders table with an amount greater than 200:
Select * from ORDERS
Where Amount > 200

--3- ORDER BY
-- To select all customers and order them by LastName in ascending order:
SELECT * FROM CUSTOMERS
ORDER BY LastName ASC

-- To select all orders and order them by Amount in descending order:
select * from ORDERS
ORDER BY Amount DESC

--4- GROUP BY
-- To count the number of orders placed by each customer:
SELECT CustomerID, COUNT(OrderID) AS NumberofOrders
from ORDERS
GROUP BY CustomerID

-- To find the total amount spent by each customer:
Select CustomerID, SUM(Amount) AS TotalAmount
FROM ORDERS
GROUP BY CustomerID

--5 - COMBINING CLAUSES
-- To select customers and their orders, showing only those customers who have placed more than one order, 
-- and ordering the result by the total amount spent:
SELECT C.CustomerID, C.FirstName, C.LastName, SUM(O.Amount) AS TotalAmount
FROM CUSTOMERS C
JOIN ORDERS O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
HAVING COUNT(O.OrderID) > 1
ORDER BY TotalAmount DESC

-- To find the average order amount for each status and order the result by the average amount:
SELECT Status, AVG(Amount) AS AverageAmount
from ORDERS
GROUP BY Status
ORDER BY AverageAmount DESC
--------------------------------------------------------------------------------------------------------------------------------
--Here are some examples of SQL queries that demonstrate filtering and sorting using the WHERE, AND, OR conditions, 
--and ordering results in ascending and descending order based on the Customers and Orders tables.
--Filtering with WHERE and AND Conditions
--To select orders with an amount greater than 200 and a status of 'Shipped':
SELECT * FROM ORDERS
WHERE Amount > 200 AND Status = 'Shipped'

--Filtering with WHERE and OR Conditions
--To select customers who live in either 'Faridabad' or 'Mukesh'
select * from CUSTOMERS
WHERE City = 'Faridabad' OR City = 'Mukesh'

--Filtering with WHERE, AND, and OR Conditions Combined
--To select orders that have an amount greater than 200 and are either 'Shipped' or 'Delivered':
SELECT * FROM ORDERS
WHERE Amount > 200 AND (Status = 'Shipped' OR Status = 'Delivered')

--Sorting in Ascending Order
--To select all customers and order them by FirstName in ascending order:
select * from CUSTOMERS
ORDER BY FirstName ASC

--Sorting in Descending Order
--To select all orders and order them by OrderDate in descending order:
SELECT * FROM ORDERS
ORDER BY OrderDate DESC

--Combining Filtering and Sorting
--To select customers who live in 'San Diego' or 'Dallas', and order them by LastName in ascending order:
SELECT * FROM CUSTOMERS
WHERE City = 'Noida' OR City = 'Delhi'
ORDER BY LastName ASC

--To select orders with an amount greater than 150 and order them by Amount in descending order
select * from ORDERS
WHERE Amount > 150
ORDER BY Amount DESC

--More Complex Example with Filtering and Sorting
--To select orders placed by customers from 'Rohtak' or 'Indrapuram', and order the result by OrderDate in descending order:
select o.OrderID, O.OrderDate, o.Amount, O.Status, C.FirstName, C.LastName, C.City
FROM ORDERS O
JOIN CUSTOMERS C ON O.CustomerID = C.CustomerID
WHERE C.City = 'Rohtak' OR City = 'Indrapuram'
ORDER BY O.OrderDate DESC
----------------------------------------------------------------------------------------------------------------------------------
-- Data aggregation functions like SUM, AVG, COUNT, MIN, and MAX help in summarizing data from the tables.
-- Here are examples using the Customers and Orders tables:
-- 1- SUM, To calculate the total amount spent on all orders:
SELECT SUM(Amount) AS TotalSpent
from ORDERS

-- To find the total amount spent by each customer:
SELECT CustomerID, SUM(Amount) AS TotalAmountSpent
from ORDERS
GROUP BY CustomerID

--2- AVG,To calculate the average order amount:
SELECT AVG(Amount) AS AverageOrderAmount
from ORDERS

-- To find the average order amount for each status:
SELECT Status, AVG(Amount) AS AverageAmount
FROM ORDERS
GROUP BY Status

--3- COUNT, To count the total number of orders:
SELECT COUNT(*) AS TotalOrders
FROM ORDERS

-- To count the number of orders for each customer:
SELECT CustomerID, COUNT(OrderID) AS NumberofOrders
from ORDERS
GROUP BY CustomerID

--4 - MIN, To find the minimum order amount:
SELECT MIN(Amount) AS MinimunOrderAmount
from ORDERS

-- To find the minimum order amount for each status:
SELECT Status, MIN(Amount) AS MinimumAmount
FROM ORDERS
Group by Status

--5- MAX, To find the maximum order amount:
SELECT MAX(Amount) AS MaximumOrderAmount
from ORDERS

--To find the maximum order amount for each customer:
SELECT CustomerID, Max(Amount) AS MaximumOrderAmount
FROM ORDERS
Group by CustomerID

-- Combining Aggregation with Filtering
-- To find the total amount spent by customers who have placed more than 2 orders:
SELECT C.CustomerID, SUM(O.Amount) AS TotalAmountSpent
from ORDERS O
JOIN CUSTOMERS C ON O.CustomerID = C.CustomerID
GROUP BY C.CustomerID
HAVING COUNT(O.OrderID) > 2

--To find the average order amount for orders placed in '2024-07':
SELECT AVG(Amount) AS AverageOrderAmount
from ORDERS
WHERE OrderDate BETWEEN '07-11-2024' AND '07-20-2024'
----------------------------------------------------------------------------------------------------------------------------
-- JOINS, Here's how you can use different types of joins with the Customers and Orders tables, including INNER JOIN, 
-- LEFT JOIN, RIGHT JOIN, Self-Joins, Cross Joins, and FULL OUTER JOIN.
--1, INNER JOIN, Purpose: Returns only the rows where there is a match in both joined tables
-- To find all orders along with the corresponding customer details:
SELECT O.OrderID, O.OrderDate, O.Amount, O.Status, C.FirstName, C.LastName, C.City
from ORDERS O
INNER JOIN CUSTOMERS C ON O.CustomerID = C.CustomerID

--2, LEFT JOIN
-- Purpose: Returns all rows from the left table and the matched rows from the right table. If no match is found, 
-- NULL values are returned for columns from the right table.
-- To find all customers and their orders, including customers who have not placed any orders:
SELECT C.CustomerID, C.FirstName, C.LastName, o.OrderID, O.OrderDate, o.Amount
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CustomerID = O.CustomerID

--3, RIGHT JOIN
-- Purpose: Returns all rows from the right table and the matched rows from the left table. If no match is found, 
-- NULL values are returned for columns from the left table.
-- To find all orders and their corresponding customers, including orders that do not have a matching customer record:
SELECT O.OrderID, O.OrderDate, O.Amount, O.Status, C.FirstName, C.LastName
from ORDERS O
RIGHT JOIN CUSTOMERS C ON O.CustomerID = C.CustomerID

--4, SELF JOIN
-- Purpose: Joins a table with itself. Useful for hierarchical data or comparing rows within the same table.
-- To find pairs of orders placed by the same customer:
SELECT A.OrderID AS OrderID1, B.OrderID AS OrderID2, A.CustomerID
FROM ORDERS A
INNER JOIN ORDERS B ON A.CustomerID = B.CustomerID AND A.OrderID <> B.OrderID

--5, CROSS JOIN
-- Purpose: Returns the Cartesian product of the two tables. Each row from the first table is combined,
-- with each row from the second table.
-- To get every possible combination of customers and orders (typically used for generating all possible pairs):
SELECT C.CustomerID, O.OrderID
FROM CUSTOMERS C
CROSS JOIN ORDERS o

--6, Full outer JOIN
--Purpose: Returns all rows when there is a match in either the left or right table. Rows that do not have a match in one of,
--the tables will have NULLs for the columns from that table.
--To find all customers and all orders, showing customers who have not placed orders and orders that do not, 
--have corresponding customer records:
SELECT C.CustomerID, C.FirstName, C.LastName, o.OrderID, O.OrderDate, o.Amount
FROM CUSTOMERS C
FULL OUTER JOIN ORDERS O ON C.CustomerID = O.CustomerID
----------------------------------------------------------------------------------------------------------------------
--SUBQUERIES, Subqueries are queries nested inside other queries. They can be used for filtering data, aggregating data, 
--joining tables, and correlated subqueries. Here are examples based on the Customers and Orders tables
--1 Subqueries Used in Filtering Data, Purpose: To filter data based on the results of another query.
--Find customers who have placed orders with an amount greater than $200.
SELECT CustomerID, FirstName, LastName
from CUSTOMERS
where CustomerID IN (
     SELECT CustomerID
	 from ORDERS
	 where Amount > 200
)

--2,Complete Query
--To select the customer details for the customer with the highest total amount spent, you can use a subquery to find the 
--CustomerID and then join it with the Customers tab
SELECT C.CustomerID, C.FirstName, C.LastName
FROM Customers C
WHERE C.CustomerID = (
    SELECT TOP 1 CustomerID
    FROM Orders
    GROUP BY CustomerID
    ORDER BY SUM(Amount) DESC
)

--3- Correlated Subqueries
-- Purpose: A correlated subquery is a subquery that references columns from the outer query. It’s evaluated once for 
-- each row processed by the outer query.
-- Find customers who have placed more orders than the average number of orders placed by all customers.
SELECT C.CustomerID, C.FirstName, C.LastName
from CUSTOMERS C
WHERE (
    SELECT COUNT(*)
	FROM ORDERS O
	WHERE O.CustomerID = C.CustomerID
) >(
   SELECT AVG(OrderCount)
   from (
        SELECT COUNT(*) AS OrderCount
		from ORDERS
		GROUP BY CustomerID
	) AS CustomerOrderCounts
)
------------------------------------------------------------------------------------------------------------------
--1-VIEWS, To create a virtual table based on a query.
--Create a view to show customer names along with their total order amount.
CREATE VIEW CustomerOrderSummary AS
SELECT C.CustomerID, C.FirstName, C.LastName, SUM(O.Amount) AS TotalAmountSpent
from CUSTOMERS C
LEFT JOIN ORDERS O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, FirstName, c.LastName

SELECT * FROM CustomerOrderSummary

--2- Modifying Views, To update an existing view’s definition
-- Modify the CustomerOrderSummary view to include the number of orders each customer has placed.
-- irst, you must drop the existing view and then recreate it with the new definition.

-- Drop the Existing View
DROP VIEW IF EXISTS CustomerOrderSummary       

-- Recreate the View with the new Defination
CREATE VIEW CustomerOrderSummary AS
SELECT C.CustomerID, C.FirstName, C.LastName, 
       COUNT(O.OrderID) AS NumberOfOrders, 
       SUM(O.Amount) AS TotalAmountSpent
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName

SELECT * FROM CustomerOrderSummary

--3- Dropping Views, To remove a view from the database.
-- Drop the CustomerOrderSummary view.

DROP VIEW IF EXISTS CustomerOrderSummary
-----------------------------------------------------------------------------------------------------------------------
-- Stored procedures and user-defined functions (UDFs) are used to encapsulate logic and perform operations in the database. 
-- Here’s how you can create, modify, drop, and execute stored procedures, and how to define and use user-defined functions, 
-- based on the Customers and Orders tables
--1- CREATE A STORE PROCEDURE
-- To define a reusable set of SQL commands that can be executed with a single call.
-- Create a stored procedure to get all orders for a specific customer.

CREATE PROCEDURE GetCustomersOrders
   @CustomerID INT
AS
BEGIN
    SELECT OrderID, OrderDate, Amount, Status
	FROM ORDERS
	WHERE CustomerID = @CustomerID
END

EXEC GetCustomersOrders @CustomerID = 2

--2- Altering a Stored Procedure, To modify an existing stored procedure’s definition.
-- Modify the GetCustomerOrders procedure to include the customer's name in the result.
ALTER PROCEDURE GetCustomersOrders
    @CustomerID INT
AS
BEGIN
    SELECT O.OrderID, O.OrderDate, O.Amount, O.Status, C.FirstName, C.LastName
	FROM ORDERS O
	JOIN CUSTOMERS C ON O.CustomerID = C.CustomerID
	WHERE O.CustomerID = @CustomerID
END

EXEC GetCustomersOrders @CustomerID = 4

--3- Dropping a Stored Procedure
-- To remove a stored procedure from the database.
-- Drop the GetCustomerOrders procedure.

DROP PROCEDURE IF EXISTS GetCustomersOrders

--4- Executing a Stored Procedure
-- To run a stored procedure and get the results.
-- Execute the GetCustomerOrders procedure for a customer with CustomerID 1.

EXEC GetCustomersOrders @CustomerID = 1 

--5- User-Defined Functions (UDFs)
-- To create custom functions that return a single value and can be used in queries.
-- Create a function to calculate the total amount spent by a specific customer.
CREATE FUNCTION TotalAmountSpent(@CustomerID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Total DECIMAL(10,2)

	SELECT @Total = SUM(Amount)
	FROM ORDERS
	where CustomerID = @CustomerID

	RETURN @TOTAL
END

SELECT CustomerID, FirstName, LastName, dbo.TotalAmountSpent(CustomerID) AS TotalSpent
from CUSTOMERS

-- Create a function to get the highest order amount for a specific customer.
CREATE FUNCTION MaxOrderAmount(@CustomerID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @MaxAmount DECIMAL(10,2)

	SELECT @MaxAmount = @MaxAmount
	FROM ORDERS
	where CustomerID = @CustomerID

	RETURN @maxAmount
END

SELECT CustomerID, FirstName, LastName, dbo.MaxOrderAmount(CustomerID) AS MaxAmountSpent
From CUSTOMERS
--------------------------------------------------------------------------------------------------------------------------
-- TRIGGER, A trigger is a special type of stored procedure that automatically executes or fires when a specific event,
-- occurs in the database. Triggers are used to enforce business rules, maintain data integrity, and automatically perform, 
-- actions in response to changes in the database.

CREATE TRIGGER TRG_AuditOrders
on orders
AFTER INSERT, UPDATE
AS
BEGIN

INSERT INTO ORDERS_AUDIT (OrderID, OrderDate, Amount, Status, ChangeType)
SELECT
     i.OrderID,
	 i.OrderDate,
	 i.Amount,
	 i.Status,
	 CASE
	    WHEN i.OrderID IS NOT NULL AND d.OrderID IS NULL THEN 'INSERT'
		WHEN i.OrderID IS NOT NULL AND d.OrderID IS NOT NULL THEN 'UPDATE'
     END AS ChangeType
  From inserted i
  LEFT JOIN deleted D
  ON i.OrderID = d.OrderID
END


-- Create the trigger
CREATE TRIGGER TRG_AuditOrdersDelete
ON ORDERS
AFTER DELETE
AS
BEGIN
    INSERT INTO ORDERS_AUDIT (OrderID, OrderDate, Amount, Status, ChangeType)
    SELECT
        d.OrderID,
        d.OrderDate,
        d.Amount,
        d.Status,
        'DELETE' AS ChangeType
    FROM deleted d;
END;



