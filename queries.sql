-- Join Queries

-- 1. All orders with product details
SELECT o.OrderID, p.ProductName, o.Quantity, o.OrderDate
FROM Orders o
INNER JOIN Products p ON o.ProductID = p.ProductID;

-- 2. Total quantity ordered per product
SELECT p.ProductName, SUM(o.Quantity) AS TotalOrdered
FROM Products p
INNER JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.ProductName;

-- 3. Orders on a specific date
SELECT p.ProductName, o.Quantity
FROM Products p
INNER JOIN Orders o ON p.ProductID = o.ProductID
WHERE o.OrderDate = '2025-09-08';

-- 4. Most expensive ordered product
SELECT p.ProductName, p.Price
FROM Products p
INNER JOIN Orders o ON p.ProductID = p.ProductID
ORDER BY p.Price DESC
LIMIT 1;

-- 5. Order value (Quantity * Price)
SELECT o.OrderID, p.ProductName, o.Quantity, (o.Quantity * p.Price) AS OrderValue
FROM Orders o
INNER JOIN Products p ON o.ProductID = p.ProductID;

-- 6. All products with their orders (LEFT JOIN)
SELECT p.ProductName, o.OrderID, o.Quantity
FROM Products p
LEFT JOIN Orders o ON p.ProductID = o.ProductID;

-- 7. Products never ordered
SELECT p.ProductName
FROM Products p
LEFT JOIN Orders o ON p.ProductID = o.ProductID
WHERE o.OrderID IS NULL;

-- 8. Sales value per product (including NULLs)
SELECT p.ProductName, SUM(o.Quantity * p.Price) AS TotalSales
FROM Products p
LEFT JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.ProductName;

-- 9. Last order date for each product
SELECT p.ProductName, MAX(o.OrderDate) AS LastOrderDate
FROM Products p
LEFT JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.ProductName;

-- 10. Number of orders per product
SELECT p.ProductName, COUNT(o.OrderID) AS OrderCount
FROM Products p
LEFT JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.ProductName;

-- 11. All orders with products (RIGHT JOIN)
SELECT o.OrderID, p.ProductName, o.Quantity
FROM Products p
RIGHT JOIN Orders o ON p.ProductID = o.ProductID;

-- 12. Orders after a certain date
SELECT o.OrderID, p.ProductName, o.Quantity, o.OrderDate
FROM Products p
RIGHT JOIN Orders o ON p.ProductID = o.ProductID
WHERE o.OrderDate > '2025-09-10';

-- 13. Quantity grouped by date
SELECT o.OrderDate, SUM(o.Quantity) AS TotalQty
FROM Products p
RIGHT JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY o.OrderDate
ORDER BY o.OrderDate;

-- 14. Cheapest product ordered per date
SELECT o.OrderDate, MIN(p.Price) AS CheapestProductPrice
FROM Products p
RIGHT JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY o.OrderDate;

-- 15. Total revenue per order
SELECT o.OrderID, SUM(o.Quantity * p.Price) AS OrderRevenue
FROM Products p
RIGHT JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY o.OrderID;

-- 16. Full join of products and orders
SELECT p.ProductName, o.OrderID, o.Quantity
FROM Products p
FULL JOIN Orders o ON p.ProductID = o.ProductID;

-- 17. Products without orders and orders without products
SELECT p.ProductName, o.OrderID
FROM Products p
FULL JOIN Orders o ON p.ProductID = o.ProductID
WHERE p.ProductID IS NULL OR o.OrderID IS NULL;

-- 18. Total quantity (including unmatched)
SELECT p.ProductName, SUM(o.Quantity) AS TotalQty
FROM Products p
FULL JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.ProductName;

-- 19. Products with same price (SELF JOIN)
SELECT p1.ProductName AS ProductA, p2.ProductName AS ProductB, p1.Price
FROM Products p1
INNER JOIN Products p2 ON p1.Price = p2.Price
AND p1.ProductID < p2.ProductID;

-- 20. Orders on the same date (SELF JOIN)
SELECT o1.OrderID AS OrderA, o2.OrderID AS OrderB, o1.OrderDate
FROM Orders o1
INNER JOIN Orders o2 ON o1.OrderDate = o2.OrderDate
AND o1.OrderID < o2.OrderID;
