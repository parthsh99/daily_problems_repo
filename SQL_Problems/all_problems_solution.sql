USE Northwind;
SELECT * FROM Shippers;

USE Northwind;
-- Problem 3.
SELECT Employees.FirstName,Employees.LastName,Employees.HireDate FROM dbo.Employees 
WHERE Employees.Title = 'Sales Representative' AND Employees.Country='USA';

-- Problem 4
SELECT  * FROM dbo.[Orders] 
WHERE dbo.Orders.EmployeeID = 5;

-- 5.In the Suppliers table, show the SupplierID, ContactName, and
--ContactTitle for those Suppliers whose ContactTitle is not Marketing
--Manager.

SELECT dbo.Suppliers.SupplierID,dbo.Suppliers.ContactName,dbo.Suppliers.ContactTitle 
FROM dbo.Suppliers
WHERE dbo.Suppliers.ContactTitle NOT LIKE 'Marketing Manager';

--6 . In the products table, we’d like to see the ProductID and ProductName
-- for those products where the ProductName includes the string “queso”.
SELECT dbo.[Products].ProductID, dbo.Products.ProductName 
FROM dbo.Products
WHERE LOWER(dbo.Products.ProductName) LIKE '%queso%';


--7. Looking at the Orders table, there’s a field called ShipCountry. Write a
-- query that shows the OrderID, CustomerID, and ShipCountry for the
-- orders where the ShipCountry is either France or Belgium.
SELECT dbo.Orders.OrderDate,
dbo.Orders.CustomerID,
dbo.Orders.ShipCountry
FROM dbo.Orders
WHERE dbo.Orders.ShipCountry = 'France' OR
dbo.Orders.ShipCountry = 'Belgium';
--WHERE dbo.Orders.ShipCountry IN ('France','Belgium');

-- 8 .Show above results from Latin American Countries

SELECT dbo.Orders.OrderDate,
dbo.Orders.CustomerID,
dbo.Orders.ShipCountry
FROM dbo.Orders
WHERE dbo.Orders.ShipCountry IN ('Brazil','Mexico','Argentina','Venezuela');


-- 10. Employees, in order of age
--For all the employees in the Employees table, show the FirstName,
--LastName, Title, and BirthDate. Order the results by BirthDate, so we
--have the oldest employees first.
SELECT dbo.Employees.FirstName,
dbo.Employees.LastName,
dbo.Employees.Title,
dbo.Employees.BirthDate,
DATEDIFF(YEAR, dbo.Employees.BirthDate,GETDATE()) as "Age"
FROM dbo.Employees
ORDER BY dbo.Employees.BirthDate ASC;

--SELECT GETDATE();

-- 11 .Showing only the Date with a DateTime field
-- In the output of the query above, showing the Employees in order of
-- BirthDate, we see the time of the BirthDate field, which we don’t want.
-- Show only the date portion of the BirthDate field.
SELECT dbo.Employees.FirstName,
dbo.Employees.LastName,
dbo.Employees.Title,
CONVERT(date,dbo.Employees.BirthDate),
DATEDIFF(YEAR, dbo.Employees.BirthDate,GETDATE()) as "Age"
FROM dbo.Employees
ORDER BY dbo.Employees.BirthDate ASC;

-- 12. Employees full name
--Show the FirstName and LastName columns from the Employees table,
--and then create a new column called FullName, showing FirstName and
--LastName joined together in one column, with a space in-between.

SELECT dbo.Employees.FirstName,dbo.Employees.LastName,CONCAT(dbo.Employees.FirstName ,' ', dbo.Employees.LastName) as "FullName" 
FROM dbo.Employees;


-- 13. OrderDetails amount per line item
--In the OrderDetails table, we have the fields UnitPrice and Quantity.
--Create a new field, TotalPrice, that multiplies these two together. We’ll
--ignore the Discount field for now.
--In addition, show the OrderID, ProductID, UnitPrice, and Quantity.
--Order by OrderID and ProductID.

SELECT dbo.[Order Details].OrderID as "OrderID",
dbo.[Order Details].ProductID as " Product ID",
dbo.[Order Details].UnitPrice as "Unit Price",
dbo.[Order Details].Quantity as "Quantity",
(dbo.[Order Details].UnitPrice * dbo.[Order Details].Quantity) as "Total Price"
FROM dbo.[Order Details]
ORDER BY dbo.[Order Details].OrderID,dbo.[Order Details].ProductID;

--14. How many customers?
--How many customers do we have in the Customers table? Show one
--value only, and don’t rely on getting the recordcount at the end of a
--resultset.
SELECT COUNT_BIG(*) FROM dbo.Customers;


--15. When was the first order?
--Show the date of the first order ever made in the Orders table.
SELECT MIN(dbo.Orders.RequiredDate),
MIN(dbo.Orders.OrderDate)
FROM dbo.Orders;


-- 16. Countries where there are customers
-- Show a list of countries where the Northwind company has customers.
SELECT DISTINCT(dbo.Customers.Country)
FROM dbo.Customers;

SELECT DISTINCT(dbo.Orders.ShipCountry) FROM dbo.Orders;


-- 17. Contact titles for customers
--Show a list of all the different values in the Customers table for
--ContactTitles. Also include a count for each ContactTitle.
--This is similar in concept to the previous question “Countries where
--there are customers”, except we now want a count for each ContactTitle.

SELECT DISTINCT(dbo.Customers.ContactTitle),COUNT(dbo.Customers.ContactTitle) as "Contact_title_count"
FROM dbo.Customers
GROUP BY dbo.Customers.ContactTitle
ORDER BY "Contact_title_count" DESC;


--18.oducts with associated supplier names
--We’d like to show, for each product, the associated Supplier. Show the
--ProductID, ProductName, and the CompanyName of the Supplier. Sort
--by ProductID.
--This question will introduce what may be a new concept, the Join clause
--in SQL. The Join clause is used to join two or more relational database
--tables together in a logical way.
--Here’s a data model of the relationship between Products and Suppliers.

SELECT dbo.Products.ProductID as "Product ID",
dbo.Products.ProductName as "Product Name",
dbo.Suppliers.CompanyName
FROM dbo.Products 
JOIN dbo.Suppliers 
ON dbo.Products.SupplierID = dbo.Suppliers.SupplierID
ORDER BY dbo.Products.ProductID;


-- 19. Orders and the Shipper that was used
-- We’d like to show a list of the Orders that were made, including the
-- Shipper that was used. Show the OrderID, OrderDate (date only), and
-- CompanyName of the Shipper, and sort by OrderID.
-- In order to not show all the orders (there’s more than 800), show only
-- those rows with an OrderID of less than 10300.

SELECT dbo.Orders.OrderID as "Order ID",
dbo.Orders.OrderDate as "Order Date",
dbo.Shippers.CompanyName
FROM dbo.Orders
JOIN dbo.Shippers
ON dbo.Orders.ShipVia = dbo.Shippers.ShipperID
WHERE dbo.Orders.OrderID < 10300;



-------------------------------------------------- INTERMEDIATE PROBLEMS -------------------------------------------------------

--20. Categories, and the total products in each category
--For this problem, we’d like to see the total number of products in each
--category. Sort the results by the total number of products, in descending
--order.

SELECT dbo.Categories.CategoryName AS "Category name",
COUNT(dbo.Products.CategoryID) AS "Product Count"
FROM dbo.Categories
JOIN dbo.Products
ON dbo.Categories.CategoryID = dbo.Products.CategoryID
GROUP BY dbo.Categories.CategoryName
ORDER BY "Product Count" DESC;





--21. Total customers per country/city
--In the Customers table, show the total number of customers per Country
--and City.

SELECT dbo.Customers.Country "Customer Country",
dbo.Customers.City as "Customer City",
COUNT(DISTINCT dbo.Customers.CustomerID) as "Total Customers"
FROM dbo.Customers
GROUP by dbo.Customers.Country,dbo.Customers.City
ORDER BY "Total Customers" DESC;


--22. Products that need reordering
--What products do we have in our inventory that should be reordered?
--For now, just use the fields UnitsInStock and ReorderLevel, where
--UnitsInStock is less than the ReorderLevel, ignoring the fields
--UnitsOnOrder and Discontinued.
--Order the results by ProductID.
SELECT dbo.Products.ProductID as "Product_ID",
dbo.Products.ProductName as "Product_Name",
dbo.Products.UnitsInStock as "Units_In_Stock",
dbo.Products.ReorderLevel as "Reorder_Level"
from dbo.Products
WHERE dbo.Products.UnitsInStock < dbo.Products.ReorderLevel
ORDER BY dbo.Products.ProductID;



--23. Products that need reordering, continued
--Now we need to incorporate these fields—UnitsInStock, UnitsOnOrder,
--ReorderLevel, Discontinued—into our calculation. We’ll define
--“products that need reordering” with the following:
--UnitsInStock plus UnitsOnOrder are less than or equal to
--ReorderLevel
--The Discontinued flag is false (0).

SELECT dbo.Products.ProductID as "Product_ID",
dbo.Products.ProductName as "Product_Name",
dbo.Products.UnitsInStock as "Units_In_Stock",
dbo.Products.UnitsOnOrder as "Units_On_Order",
dbo.Products.ReorderLevel as "Reorder_Level",
dbo.Products.Discontinued as "Discontinued"
from dbo.Products
WHERE (dbo.Products.UnitsInStock + dbo.Products.UnitsOnOrder) <= dbo.Products.ReorderLevel AND
dbo.Products.Discontinued = 0
ORDER BY dbo.Products.ProductID;




-- 24. Customer list by region
--A salesperson for Northwind is going on a business trip to visit
--customers, and would like to see a list of all customers, sorted by
--region, alphabetically.
--However, he wants the customers with no region (null in the Region
--field) to be at the end, instead of at the top, where you’d normally find
--the null values. Within the same region, companies should be sorted by
--CustomerID.

SELECT dbo.Customers.CustomerID,
dbo.Customers.CompanyName,
dbo.Customers.Region
FROM dbo.Customers
ORDER BY (CASE WHEN dbo.Customers.Region IS NULL THEN 1 ELSE 0 END),dbo.Customers.Region,dbo.Customers.CustomerID;



--25. High freight charges
--Some of the countries we ship to have very high freight charges. We'd
--like to investigate some more shipping options for our customers, to be
--able to offer them lower freight charges. Return the three ship countries
--with the highest average freight overall, in descending order by average
--freight.


USE Northwind;
SELECT TOP 3 dbo.Orders.ShipCountry as "Country",
(SUM(dbo.Orders.Freight)/COUNT(dbo.Orders.ShipCountry)) as "Average_Freight_charges"
FROM dbo.Orders
GROUP BY dbo.Orders.ShipCountry
ORDER BY Average_Freight_charges DESC

SELECT TOP 3 dbo.Orders.ShipCountry as "Country",
avg(DBO.Orders.Freight) as "Average_Freight_charges"
FROM dbo.Orders
GROUP BY dbo.Orders.ShipCountry
ORDER BY Average_Freight_charges DESC

GO





--26. High freight charges - 2015
--We're continuing on the question above on high freight charges. Now,
--instead of using all the orders we have, we only want to see orders from
--the year 2015.

USE Northwind;
SELECT TOP 3 dbo.Orders.ShipCountry as "Country",
(SUM(dbo.Orders.Freight)/COUNT(dbo.Orders.ShipCountry)) as "Average_Freight_charges"
FROM dbo.Orders
WHERE DATEPART(year,dbo.Orders.OrderDate) = 1997
--WHERE strftime('%Y', OrderDate) = '1997'
GROUP BY dbo.Orders.ShipCountry
ORDER BY Average_Freight_charges DESC

GO

Select Top 3
ShipCountry
,AverageFreight = avg(freight)
From Orders
Where
OrderDate between '1/1/1997' and '12/31/1997'
Group By ShipCountry
Order By AverageFreight desc;


----------------------------------------------------------------------------------------good query --------------------------------------------------------
--28. High freight charges - last year
--We're continuing to work on high freight charges. We now want to get
--the three ship countries with the highest average freight charges. But
--instead of filtering for a particular year, we want to use the last 12
--months of order data, using as the end date the last OrderDate in Orders.

SELECT MAX(OrderDate),DATEADD(year,-1,Max(OrderDate))
FROM Orders;

SELECT TOP 3 dbo.Orders.ShipCountry,
AVG(dbo.Orders.Freight) as "AVG_Freight_PerCountry"
FROM dbo.Orders
--WHERE (dbo.Orders.OrderDate) >= DATEADD(year,-1,(SELECT Max(dbo.Orders.OrderDate) FROM dbo.Orders.OrderDate )  )
WHERE (dbo.Orders.OrderDate) > (SELECT DATEADD(year,-1,Max(dbo.Orders.OrderDate)) FROM dbo.Orders)
GROUP BY dbo.Orders.ShipCountry
ORDER BY AVG_Freight_PerCountry DESC;


----------------------------------------------------------------------------------------good query --------------------------------------------------------


--29. Inventory list
--We're doing inventory, and need to show information like the below, for
--all orders. Sort by OrderID and Product ID.

--EmployeeID , LastName,OrderID,ProductName,Quantity

SELECT dbo.Orders.EmployeeID as "Employee_id",
dbo.Employees.LastName as "LastName",
dbo.Orders.OrderID as "Order_ID",
dbo.Products.ProductName as "Product_Name",
dbo.Products.UnitsInStock as "Quantity"
FROM dbo.Orders,dbo.Employees,dbo.Products,dbo.[Order Details]
WHERE dbo.Orders.EmployeeID = dbo.Employees.EmployeeID AND
dbo.Orders.OrderID = dbo.[Order Details].OrderID AND
dbo.[Order Details].ProductID = dbo.Products.ProductID
ORDER BY dbo.Orders.OrderID, dbo.Products.ProductID;



--30. Customers with no orders
--There are some customers who have never actually placed an order.
--Show these customers.

SELECT dbo.Customers.CustomerID,
dbo.Orders.CustomerID
FROM dbo.Customers
LEFT JOIN dbo.Orders
ON dbo.Customers.CustomerID = dbo.Orders.CustomerID
WHERE dbo.Orders.CustomerID IS NULL;



--31. Customers with no orders for EmployeeID 4
--One employee (Margaret Peacock, EmployeeID 4) has placed the most
--orders. However, there are some customers who've never placed an order
--with her. Show only those customers who have never placed an order
--with her.

SELECT
Customers.CustomerID AS Customers_CustomerID
, Orders.CustomerID AS Orders_CustomerID
FROM
Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
AND Orders.EmployeeID = 4
WHERE
Orders.CustomerID IS NULL
ORDER BY
Orders.CustomerID;


--Note that with outer joins, the filters on the where clause are applied after the join.





----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------ADVANCED SQL PROBLEMS ON NORTHWIND--------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------


--32. High-value customers
--We want to send all of our high-value customers a special VIP gift.
--We're defining high-value customers as those who've made at least 1
--order with a total value (not including the discount) equal to $10,000 or
--more. We only want to consider orders made in the year 2016.
--CustoemrId, company Name ,OrderId, Total Amount
select * FROM DBO.Orders;

SELECT dbo.Orders.CustomerID,dbo.Orders.OrderID,
(SUM( (dbo.[Order Details].UnitPrice + dbo.[Order Details].Discount)*dbo.[Order Details].Quantity ) ) as "Total_Price"
FROM dbo.Orders,dbo.[Order Details]
WHERE dbo.Orders.OrderID = dbo.[Order Details].OrderID AND
DATEPART(YEAR,dbo.Orders.OrderDate) = 1998
GROUP BY dbo.Orders.CustomerID,dbo.Orders.OrderID
HAVING SUM( (dbo.[Order Details].UnitPrice + dbo.[Order Details].Discount)*dbo.[Order Details].Quantity ) > 10000
ORDER BY "Total_Price" DESc;

-- Long & In-efficient My way 
select ord.CustomerID,
cust.CompanyName,
ord.OrderID,
SUM((Ord_Det.UnitPrice) * Ord_Det.Quantity) as "Total_Value"
FROM dbo.Orders ord,dbo.Customers cust, dbo.[Order Details] Ord_Det
WHERE ord.CustomerID = cust.CustomerID AND
ord.OrderID = Ord_Det.OrderID AND
DATEPART(year,ord.OrderDate) = 1998
GROUP BY ord.CustomerID,cust.CompanyName,ord.OrderID
HAVING SUM((Ord_Det.UnitPrice+Ord_Det.Discount) * Ord_Det.Quantity) >= 10000
ORDER BY "Total_Value" desc;

--Book solution 
Select
Customers.CustomerID
,Customers.CompanyName
,dbo.Orders.OrderID
,TotalOrderAmount = SUM(Quantity * UnitPrice)
From Customers
Join dbo.Orders
on dbo.Orders.CustomerID = Customers.CustomerID
Join dbo.[Order Details]
on dbo.Orders.OrderID = dbo.[Order Details].OrderID
Where
OrderDate >= '20160101'
and OrderDate < '20170101'
Group by
Customers.CustomerID
,Customers.CompanyName
,Orders.Orderid
Having Sum(Quantity * UnitPrice) > 10000
Order by TotalOrderAmount DESC



--33. High-value customers - total orders
--The manager has changed his mind. Instead of requiring that customers
--have at least one individual orders totaling $10,000 or more, he wants to
--define high-value customers as those who have orders totaling $15,000
--or more in 2016. How would you change the answer to the problem
--above?

select ord.CustomerID,
cust.CompanyName,
SUM((Ord_Det.UnitPrice) * Ord_Det.Quantity) as "Total_Value"
FROM dbo.Orders ord,dbo.Customers cust, dbo.[Order Details] Ord_Det
WHERE ord.CustomerID = cust.CustomerID AND
ord.OrderID = Ord_Det.OrderID AND
DATEPART(year,ord.OrderDate) = 1998
GROUP BY ord.CustomerID,cust.CompanyName
HAVING SUM((Ord_Det.UnitPrice+Ord_Det.Discount) * Ord_Det.Quantity) >= 15000
ORDER BY "Total_Value" DESC;




--34. High-value customers - with discount
--Change the above query to use the discount when calculating high-value
--customers. Order by the total amount which includes the discount.

select ord.CustomerID,
cust.CompanyName,
-- The price as customer Paid
SUM(Ord_Det.UnitPrice * Ord_Det.Quantity) as "Total_Value_Without_Discount",
-- original price without discount on purchased Order - Discount in the table is in % wrt to Unit price
SUM((Ord_Det.UnitPrice)*(1-Ord_Det.Discount) * Ord_Det.Quantity) as "Total_Value_with_Discount"
FROM dbo.Orders ord,dbo.Customers cust, dbo.[Order Details] Ord_Det
WHERE ord.CustomerID = cust.CustomerID AND
ord.OrderID = Ord_Det.OrderID AND
--To filter out orders only from year 1998
DATEPART(year,ord.OrderDate) = 1998
GROUP BY ord.CustomerID,cust.CompanyName
-- Select discounted price here to filter over $10000
HAVING SUM((Ord_Det.UnitPrice)*(1-Ord_Det.Discount) * Ord_Det.Quantity) >= 10000
ORDER BY "Total_Value_with_Discount" DESC;





-- 35. Month-end orders
--At the end of the month, salespeople are likely to try much harder to get
--orders, to meet their month-end quotas. Show all orders made on the last
--day of the month. Order by EmployeeID and OrderID

--We need to select required columns first
SELECT ord.EmployeeID,
ord.OrderID,
ord.OrderDate
FROM dbo.Orders ord
-- filter out internal query results by checking for Month end dates only
WHERE ord.OrderDate = EOMONTH(ord.OrderDate)
-- If EOMONTH was not available in SQL SERVER : Where Date = dateadd(month,1 + datediff(month,0,Date),-1)
-- Order by required fields in ASC
ORDER BY EmployeeID,OrderID;



--36. Orders with many line items
--The Northwind mobile app developers are testing an app that customers
--will use to show orders. In order to make sure that even the largest
--orders will show up correctly on the app, they'd like some samples of
--orders that have lots of individual line items. Show the 10 orders with
--the most line items, in order of total line items.

-- By most line items : They are asking Individiual orders which ordered maximum different no. of products in 1 go
SELECT top 10 ORD.OrderID,
-- Count Different Product ID for each order
COUNT(DISTINCT ord.ProductID)
FROM dbo.[Order Details] ord
GROUP BY ord.OrderID
ORDER BY COUNT(ord.ProductID) DESC;

SELECT DISTINCT ords.OrderID,COUNT(ords.OrderID) OVER(PARTITION BY ords.OrderID) as 'Total_line_items'  FRom
dbo.[Order Details] ords
ORDER BY 'Total_line_items' DESC;



--38. Orders - accidental double-entry
--Janet Leverling, one of the salespeople, has come to you with a request.
---She thinks that she accidentally double-entered a line item on an order,
--with a different ProductID, but the same quantity. She remembers that
--the quantity was 60 or more. Show all the OrderIDs with line items that
--match this, in order of OrderID.

-- We have employee name : Janet Leverling
-- We want to find a duplicate entry where Product ID is different that original one & quantity is same > 60
-- NOT WORKING 
SELECT
DISTINCT ord.OrderID
FROM dbo.Employees emp , dbo.[Order Details] ord, dbo.Orders ords
WHERE CONCAT(FirstName,' ', LastName) = 'Janet Leverling'
AND ord.Quantity > 60 AND
ords.EmployeeID = emp.EmployeeID AND
ord.OrderID = ords.OrderID;

-- Need to join employee(To find Emp_id for jane) -> Orders(To filter out Employee ID and order id for Janet) -> Order_details(To check equal quantity )
-- First need to locate Janet & her EmpId -> Then locate all the orders with same EmpId in Orders table
-- Then connect this to Orders_details table to find all records with same quantity but different Product id with quantity > 60

-- NOT NEEDED THIS MUCH BIG CRAP!!!!!!!!!!!!!!!!!!!!!!!
SELECT 
emp.EmployeeID,
ord.OrderID,
ords.Quantity
FROM dbo.Employees emp
JOIN dbo.Orders ord
on emp.EmployeeID = ord.EmployeeID
JOIN dbo.[Order Details] ords
on ord.OrderID = ords.OrderID
WHERE emp.FirstName = 'Janet' AND
emp.LastName = 'Leverling' AND 
ords.Quantity >= 60
ORDER BY ord.OrderID

-- As we know that Quantity is duplicated, we need to find out only those records occurring more than once with same quantity
SELECT 
ords.OrderID,
ords.Quantity,
COUNT(ords.Quantity)
FROM dbo.[Order Details] ords
WHERE ords.Quantity >= 60
GROUP BY ords.OrderID,
ords.Quantity
HAVING COUNT(ords.Quantity) > 1;


--39. Orders - accidental double-entry details
--Based on the previous question, we now want to show details of the
--order, for orders that match the above criteria.


--41. Late orders
--Some customers are complaining about their orders arriving late. Which
--orders are late?
SELECT * FROM
(SELECT
ord.OrderID,
CONVERT(date,ord.OrderDate) AS "Order_date",
CONVERT(DATE,ord.RequiredDate) as "Required_date",
CONVERT(DATE,ord.ShippedDate) as "Shipped_date"
FROM dbo.Orders ord) "date_table"
WHERE date_table.Shipped_date >= date_table.Required_date;



--42. Late orders - which employees?
--Some salespeople have more orders arriving late than others. Maybe
--they're not following up on the order process, and need more training.
--Which salespeople have the most orders arriving late?

SELECT Delayed_dates.EmployeeID,
emp.LastName,
COUNT(*) as "Total_delayed_orders"
FROM (
SELECT 
ord.EmployeeID,
CONVERT(DATE,ord.RequiredDate) as "req_date",
CONVERT(DATE,ord.ShippedDate) as "ship_date"
FROM dbo.Orders ord
) "Delayed_dates", dbo.Employees emp
WHERE Delayed_dates.req_date <= Delayed_dates.ship_date
AND 
Delayed_dates.EmployeeID = emp.EmployeeID
GROUP BY Delayed_dates.EmployeeID,emp.LastName
ORDER BY Total_delayed_orders DESC;






--43. Late orders vs. total orders
--Andrew, the VP of sales, has been doing some more thinking some more
--about the problem of late orders. He realizes that just looking at the
--number of orders arriving late for each salesperson isn't a good idea. It
--needs to be compared against the total number of orders per
--salesperson. Return results like the following:

SELECT 
ord.EmployeeID,
COUNT(*) as "AllOrders",
SUM(
CASE 
	WHEN RequiredDate <= ShippedDate THEN 1
	ELSE 0
	END
) AS "Delayed_Orders"
FROM dbo.Orders ord
group BY ord.EmployeeID
ORDER BY EmployeeID;

SELECT ord1.EmployeeID,
COUNT(ord1.EmployeeID) 'Total_Orders',
Delayed_ords.LastName,Delayed_ords.Total_delayed_orders
FROM dbo.Orders ord1
JOIN (SELECT Delayed_dates.EmployeeID,
emp.LastName,
COUNT(*) as "Total_delayed_orders"
FROM (
SELECT 
ord.EmployeeID,
CONVERT(DATE,ord.RequiredDate) as "req_date",
CONVERT(DATE,ord.ShippedDate) as "ship_date"
FROM dbo.Orders ord
) "Delayed_dates", dbo.Employees emp
WHERE Delayed_dates.req_date <= Delayed_dates.ship_date
AND 
Delayed_dates.EmployeeID = emp.EmployeeID
GROUP BY Delayed_dates.EmployeeID,emp.LastName) Delayed_ords
ON ord1.EmployeeID = Delayed_ords.EmployeeID
GROUP BY ord1.EmployeeID, Delayed_ords.LastName, Delayed_ords.Total_delayed_orders
ORDER BY 'Total_Orders' DESC;





--48. Customer grouping
--Andrew Fuller, the VP of sales at Northwind, would like to do a sales
--campaign for existing customers. He'd like to categorize customers into
--groups, based on how much they ordered in 2016. Then, depending on
---which group the customer is in, he will target the customer with
--different sales materials.
--The customer grouping categories are 0 to 1,000, 1,000 to 5,000, 5,000
--to 10,000, and over 10,000.
--A good starting point for this query is the answer from the problem
--“High-value customers - total orders. We don’t want to show customers
--who don’t have any orders in 2016.
--Order the results by CustomerID

Select
Customers.CustomerID
,Customers.CompanyName
,TotalOrderAmount = SUM(Quantity * UnitPrice)
,CustomerGroup =
Case
when SUM(Quantity * UnitPrice) between 0 and 1000 then 'Low'
when SUM(Quantity * UnitPrice) between 1001 and 5000 then 'Medium'
when SUM(Quantity * UnitPrice) between 5001 and 10000 then 'High'
when SUM(Quantity * UnitPrice) > 10000 then 'Very High'
End
From Customers
Join Orders
on Orders.CustomerID = Customers.CustomerID
Join dbo.[Order Details]
on Orders.OrderID = dbo.[Order Details].OrderID
Where
OrderDate >= '19980101'
and OrderDate < '19981231'
Group By
Customers.CustomerID
,Customers.CompanyName
