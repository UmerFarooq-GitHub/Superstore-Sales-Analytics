USE SalesAnalytics;

EXEC sp_help 'SuperstoreSales';

ALTER TABLE SuperstoreSales
ALTER COLUMN Discount DECIMAL(5,4);

SELECT *
FROM SuperstoreSales
WHERE Discount IS NULL
   OR Discount < 0
   OR Discount > 1;

UPDATE SuperstoreSales
SET Discount = ROUND(Discount, 2);


SELECT 
    COUNT(*) AS TotalRows,
    MIN(Discount) AS Min_Discount,
    MAX(Discount) AS Max_Discount,
    AVG(Discount) AS Avg_Discount
FROM SuperstoreSales;
