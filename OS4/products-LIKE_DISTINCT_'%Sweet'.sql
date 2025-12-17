SELECT *    
FROM products;    
UPDATE products SET Price = ROUND(Price * 1.10, 2)
--1) Рассказать как работает оператор like и какие символы постановки я знаю
--SELECT ProductID, ProductName
--FROM products
--WHERE ProductName LIKE '%Sweet'
--2) Ключевое слово Distinct и привести парочку примеров
--SELECT DISTINCT SupplierID
--FROM products