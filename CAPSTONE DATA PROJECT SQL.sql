CREATE DATABASE LITAProject;

use LITAProject;
select * from [dbo].[CAPSTONE DATASET]

SELECT Product, SUM(Sales_amount) AS TotalSales
FROM [dbo].[CAPSTONE DATASET]
GROUP BY Product;

SELECT Region,COUNT(OrderID) AS NumberOfTransactions
FROM [dbo].[CAPSTONE DATASET]
GROUP BY Region;

SELECT Top (1) Product, SUM(Sales_amount) AS TotalSales
FROM [dbo].[CAPSTONE DATASET]
GROUP BY Product
ORDER BY TotalSales DESC;

SELECT Product, SUM(Sales_amount) AS TotalRevenue
FROM [dbo].[CAPSTONE DATASET]
GROUP BY Product;

SELECT Month(OrderDate) AS Month,
    SUM(Sales_amount) AS MonthlySalesTotal
FROM [dbo].[CAPSTONE DATASET] WHERE YEAR(OrderDate) = 2024
GROUP BY Month(OrderDate)
ORDER BY Month;

SELECT Top (5) Customer_Id,
 SUM(Sales_amount) AS TotalPurchaseAmount FROM [dbo].[CAPSTONE DATASET]
GROUP BY Customer_Id
ORDER BY TotalPurchaseAmount DESC;

SELECT Region, SUM(Sales_amount) AS RegionTotalSales,
FORMAT(ROUND((SUM(Sales_amount) / CAST((SELECT SUM(Sales_amount) FROM [dbo].[CAPSTONE DATASET]) AS DECIMAL(10,2)) * 100), 1), '0.#') 
AS PercentageOfTotalSales
FROM [dbo].[CAPSTONE DATASET]
GROUP BY Region;

SELECT Product FROM [dbo].[CAPSTONE DATASET]
GROUP BY Product
HAVING SUM(CASE 
WHEN OrderDate BETWEEN '2024-06-01' AND '2024-08-31' 
THEN 1 ELSE 0 END) = 0;
