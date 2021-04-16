USE TSQLV4;

-- Exercise 5
SELECT C.custid, C.companyname
FROM Sales.Customers AS C
	LEFT OUTER JOIN Sales.Orders AS O
		ON O.custid = C.custid
WHERE O.orderid IS NULL;

-- Exercise 6
SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON O.custid = C.custid
WHERE O.orderdate LIKE '2016-02-12'

-- Exercise 1-1

SELECT E.empid, E.firstname, E.lastname, N.n
FROM HR.Employees as E
	CROSS JOIN dbo.Nums as N
WHERE N.n <= 5
ORDER BY n, empid;