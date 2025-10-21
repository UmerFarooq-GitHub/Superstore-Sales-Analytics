USE SalesAnalytics;

EXEC sp_help 'SuperstoreSales';

-- Find invalid or suspicious entries
SELECT *
FROM SuperstoreSales
WHERE Quantity IS NULL 
   OR Quantity < 0 
   OR Quantity != FLOOR(Quantity);

SELECT 
    COUNT(*) AS TotalRows,
    MIN(Quantity) AS Min_Qty,
    MAX(Quantity) AS Max_Qty,
    AVG(Quantity) AS Avg_Qty
FROM SuperstoreSales;

