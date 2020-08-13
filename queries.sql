-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.ProductName, c.CategoryName
FROM Product as p
  JOIN Category as c
  ON p.CategoryID = c.ID;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.ID, o.ShipName as ShippingCo
FROM Orders as o
WHERE o.orderDate < '2012-08-09'
ORDER BY o.orderDate desc;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName as Name, p.QuantityPerUnit as QuantityPer
FROM Product as p
  JOIN OrderDetail as o 
WHERE o.OrderID = 10251 AND o.ProductID = p.ID
ORDER BY p.ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.ID, c.CompanyName as CustomerCo, e.LastName as EmployeeLastName
FROM Orders as o
  JOIN Customer as c , Employee as e
WHERE o.customerID = c.ID AND o.employeeID = e.ID
