USE SalesAnalytics;

EXEC sp_help 'SuperstoreSales';

SELECT *
FROM SuperstoreSales
WHERE Sales IS NULL OR Sales <= 0;

SELECT 
    COUNT(*) AS TotalRows,
    MIN(Sales) AS Min_Sales,
    MAX(Sales) AS Max_Sales,
    AVG(Sales) AS Avg_Sales
FROM SuperstoreSales;

SELECT CAST(Sales AS DECIMAL(10,2)) AS Sales_Clean
FROM SuperstoreSales;

ALTER TABLE SuperstoreSales
ALTER COLUMN Sales DECIMAL(18,2);

