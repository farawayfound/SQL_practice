USE TSQLV4;

-- 1a. List all the Categories in alphabetical order.
SELECT *
   FROM Production.Categories
   ORDER BY categoryname ASC;

-- 1b. List all the Categories in alphabetical order along with all of the products in each category.
SELECT C.categoryname, P.productname
   FROM Production.Categories AS C
      INNER JOIN Production.Products AS P
	     ON C.categoryid = P.categoryid
   ORDER BY C.categoryname ASC;

-- 2a. List all the Products that contain both an 'A' and a 'Z' in their name (in either order - A...Z or Z...A).
SELECT productname
   FROM Production.Products
   WHERE productname LIKE N'%A%'
      AND productname LIKE N'%Z%';

-- 2b. List all the Products that contain both an 'A' and a 'Z' in their name as well as the company name(s) that supply us those products.
SELECT P.productname, S.companyname
   FROM Production.Products AS P
      INNER JOIN Production.Suppliers AS S
	     ON P.supplierid = S.supplierid
   WHERE productname LIKE N'%A%'
      AND productname LIKE N'%Z%';

-- 3a. List all of the Suppliers (in order of id).
SELECT * FROM Production.Suppliers;

-- 3b. List all of the Suppliers (in order of id) along with all of the products that they supply that are not discontinued.
SELECT S.companyname, P.productname, P.discontinued
   FROM Production.Suppliers AS S
      INNER JOIN Production.Products AS P
	     ON S.supplierid = P.supplierid
   WHERE P.discontinued = 0;

-- 4. List all Orders that were placed by the "Owner" of the Customer Company.
SELECT O.orderid, O.custid, C.contactname, C.contacttitle
   FROM Sales.Orders as O
      INNER JOIN Sales.Customers as C
	     ON O.custid = C.custid
   WHERE C.contacttitle LIKE N'%Owner%';