USE TSQLV4
GO

--SELECT * FROM HR.Employees;

--SELECT * FROM Production.Categories;

--SELECT * FROM Sales.Shippers;

--SELECT C.*, S.*
--	FROM Production.Categories AS C
--		CROSS JOIN Sales.Shippers AS S

--SELECT * 
--	FROM Sales.Orders
--	WHERE orderid = 10248
--	ORDER BY orderid;

--SELECT * 
--	FROM sales.Customers
--	WHERE custid = 85;

--SELECT O.*, C.*
--	FROM Sales.Orders AS O
--		INNER JOIN Sales.Customers AS C
--			ON O.custid = C.custid
--	WHERE O.orderid <= 10250;

--SELECT O.*, OD.* --, E.*, C.empid, C.firstname, C.lastname, S.* 
--	FROM Sales.Orders as O
--		INNER JOIN Sales.Shippers AS E
--			ON O.shipperid = E.shipperid
--		INNER JOIN HR.Employees AS C
--			ON O.empid = C.empid
--		INNER JOIN Sales.Customers AS S
--			ON O.custid = S.custid
--		INNER JOIN Sales.OrderDetails AS OD
--			ON OD.orderid = O.orderid
--	WHERE O.orderid <= 10250;

--SELECT O.*, S.*
--	FROM Sales.Orders AS O
--		CROSS JOIN Sales.customers As S
--	WHERE O.orderid = 10248

--SELECT *
--	FROM Sales.Orders AS Ord
--		Inner JOIN Sales.customers As Cust
--			ON Ord.custid = Cust.custid
--	WHERE orderid <= 10250

--SELECT *, unitprice * qty AS total
--	FROM Sales.OrderDetails
--	WHERE orderid <= 10250

--SELECT OD.*, OD.unitprice *OD.qty AS total, O.*
--	FROM Sales.OrderDetails AS OD
--		INNER JOIN Sales.Orders AS O
--			ON OD.orderid = O.orderid
--		WHERE OD.orderid <= 10250;

--SELECT E1.empid, E1.firstname, E1.lastname, E1.title, E1.mgrid,
--		E2.empid, E2.firstname, E2.lastname, E2.title, E2.mgrid
--	FROM HR.Employees AS E1
--		LEFT OUTER JOIN HR.Employees AS E2
--			ON E1.mgrid = E2.empid
--	ORDER BY E1.empid