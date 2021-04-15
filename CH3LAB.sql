USE TSQLV4


--EX 2: what's wrong with this query, and correct it.
-- Spell out Orders and Customers instead of using C and O on the FROM and Inner Join statements
SELECT Customers.custid, Customers.companyname, Orders.orderid, Orders.orderdate
FROM Sales.Customers AS Customers
	INNER JOIN Sales.Orders as Orders
	ON Customers.custid = Orders.custid;

--EX 3: Return US customers, and for each customer return the total number of orders and total quantities:
--  Tables involved: Sales.Customers, Sales.Orders, and Sales.Orderdetails
SELECT C.custid, COUNT(DISTINCT O.orderid) AS numorders, SUM(OD.qty) AS totalQTY
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders as O
	ON C.custid = O.custid
	INNER JOIN Sales.Orderdetails as OD
	ON O.orderid = OD.orderid
	WHERE country = N'USA'
	GROUP BY C.custid;

--EX 4: Return customers and their orders, including customers who placed no orders:
--  Tables involved: Sales.Customers and Sales.Orders
SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C
	LEFT OUTER JOIN Sales.Orders AS O
	ON C.custid = O.custid
	ORDER BY C.custid, O.orderid;