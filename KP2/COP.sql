SELECT 
c.CustomerName, o.OrderID, p.ProductName, p.Price, od.Quantity
FROM orders o
JOIN customers c on o.CustomerID = c.CustomerID
JOIN order_details od ON o.OrderID = od.OrderID
JOIN products p ON od.ProductID = p.ProductID;