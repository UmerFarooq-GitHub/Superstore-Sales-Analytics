USE SalesAnalytics;
EXEC sp_help 'SuperstoreSales';

ALTER TABLE SuperstoreSales
ALTER COLUMN Profit DECIMAL(18,2);

SELECT *
FROM SuperstoreSales
WHERE Profit IS NULL
   OR Profit < -10000   -- unusually large loss
   OR Profit > 10000;   -- unusually large profit

UPDATE SuperstoreSales
SET Profit = ROUND(Profit, 2);


SELECT 
    COUNT(*) AS TotalRows,
    MIN(Profit) AS Min_Profit,
    MAX(Profit) AS Max_Profit,
    AVG(Profit) AS Avg_Profit
FROM SuperstoreSales;
