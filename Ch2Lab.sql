-- 1. Customers in North America

SELECT *
	FROM Sales.Customers
	WHERE COUNTRY in ('USA','Mexico','Canada')


-- 2. Orders placed in April, 2015

SELECT *
	FROM Sales.Orders
	WHERE orderdate BETWEEN '2015-04-01' AND '2015-04-30'


-- 3. Cheese sold (categoryid 4)

SELECT *
	FROM Production.Products
	WHERE categoryid = 4


-- 4. What employees (employee id only) shipped products to Germany in December?

SELECT DISTINCT empid
	FROM sales.orders
	WHERE shipcountry = 'Germany'
		AND shippeddate like N'%-12-%'


--5. We have an issue with product 19. 
--I need to know the total amount and the net amount of all orders 
--for product 19 where the customer took a discount.

SELECT (qty * unitprice) AS totalprice, (unitprice * qty * (1 - discount)) AS NET, qty, unitprice, discount
		--COUNT(orderid) AS netAmount,
		--SUM(qty) AS totalAmount
	FROM sales.OrderDetails
	WHERE productid = 19
		AND discount != 0.000


--6. I need a list of employees by title, first name, and last name.
--
Select titleofcourtesy, firstname, lastname 
	From HR.Employees
	ORDER BY firstname


--7. I need a list of our customers and the first name only of the customer representative.

Select --companyname, contactname, 
		--LEN(contactname),
		--RIGHT(contactname, 10),
		--CHARINDEX(', ', contactname),

		RIGHT(contactname, LEN(contactname) - CHARINDEX (', ', contactname)) AS firstName

	from sales.customers
	Where contacttitle = 'Sales Representative'

--8. Give me a list of our customer contacts alphabetically by last name.

SELECT contactname
	FROM Sales.Customers
	ORDER BY Contactname


--9. You sell some kind of dried fruit that I liked very much. However, it is discontinued. What is its name?

SELECT productname, productid
	FROM Production.Products
	WHERE categoryid = 7
		AND discontinued = 1


--10. How many days old are you today?

SELECT
DATEDIFF (day, '1993-09-04', GETDATE());