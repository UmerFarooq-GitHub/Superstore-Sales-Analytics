USE SalesAnalytics;

SELECT 
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN Order_ID IS NULL OR LTRIM(RTRIM(Order_ID)) = '' THEN 1 ELSE 0 END) AS MissingOrderIDs
FROM SuperstoreSales;

SELECT 
    Order_ID AS Original,
    LTRIM(RTRIM(Order_ID)) AS Trimmed
FROM SuperstoreSales
WHERE Order_ID <> LTRIM(RTRIM(Order_ID));

SELECT 
    Order_ID, 
    COUNT(*) AS OrderCount
FROM SuperstoreSales
GROUP BY Order_ID
HAVING COUNT(*) > 1
ORDER BY OrderCount DESC;

SELECT DISTINCT Order_ID
FROM SuperstoreSales
WHERE Order_ID NOT LIKE '[A-Z][A-Z]-%-%';

SELECT 
    DISTINCT SUBSTRING(Order_ID, 4, 4) AS OrderYear
FROM SuperstoreSales
ORDER BY OrderYear;

