USE TSQLV4
GO

--1. (20 Points) List all the Customers located in Germany.
SELECT *
	FROM Sales.Customers
	WHERE country = 'Germany';

--2. (20 Points) Count all the Customers with "Jr." in their name (contactname).
SELECT COUNT (custid) as totalJr
	FROM Sales.Customers
	WHERE contactname like N'%Jr.%';

--3. (20 Points) What are the three highest priced Products that we sell?
SELECT TOP(3) unitprice as price, productid, productname
	FROM Production.Products
	WHERE discontinued < 1
	ORDER BY unitprice DESC;

--4. (20 Points) What is the total quantity of all products that were sold?
SELECT SUM(qty) as totalqty
	FROM Sales.OrderDetails;

--5. (20 Points) What were the top 10 products by quantity that were sold?
SELECT TOP(10) SUM(qty) as totals, productid
	FROM Sales.OrderDetails
	GROUP BY productid
	ORDER BY totals DESC;

--Extra Credit (5 Points) Give the counts of how many Orders each employee (empid) took 
-- from most orders to least orders.
SELECT COUNT(orderid) as totalOrders, empid
	FROM Sales.Orders
	GROUP BY empid
	ORDER BY totalOrders DESC;

-- Extra Credit (5 Points) What are all the different prices I have charged for product id 11 over the years? 
-- I don't care about the dates, I just want a list of the prices.
SELECT DISTINCT unitprice
	FROM Sales.Orderdetails
	WHERE productid = 11;