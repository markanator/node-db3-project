-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT Prod."ProductName", Cat."CategoryName"
FROM "Product" as Prod
JOIN "Category" as Cat on Prod."CategoryId" = Cat."Id";
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT ODR."Id" as "Order ID",ODR."ShippedDate", SIP."CompanyName"
From "Order" AS ODR
Join "Shipper" as SIP ON ODR."ShipVia" = SIP."Id"
Where ODR."ShippedDate" < date("2012-08-10");
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT PRD."ProductName", ORDL."Quantity"
FROM "OrderDetail" AS ORDL
JOIN "Product" AS PRD ON ORDL."ProductId" = PRD."Id"
Where ORDL."OrderId" = 10251
ORDER BY "ProductName";
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT "Order"."Id" AS "Order Id", "Customer"."CompanyName","Employee"."Lastname" AS "Employee Last Name"
FROM "Order"
JOIN "Customer" on "Order"."CustomerId" = "Customer"."Id"
JOIN "Employee" on "Order"."EmployeeID" = "Employee"."Id";