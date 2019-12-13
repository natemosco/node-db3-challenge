-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT ProductName, CategoryName
FROM Product
JOIN Category ON Product.CategoryId = Category.Id; 

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT id, CompanyName 
FROM [Order]
JOIN Shipper
  on [Order].ShipVia = Shipper.id
  WHERE [Order].OrderDate < '2012-08-09'
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT OrderId, ProductName
FROM OrderDetail
JOIN Product on ProductId = Product.id
WHERE OrderID = 10251
ORDER BY ProductName;
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT Id, CompanyName, LastName 
FROM [Order]
JOIN [Customer] ON [Order].CustomerId = [Customer].Id
JOIN [Employee] ON [Order].EmployeeId = [Employee].Id;
