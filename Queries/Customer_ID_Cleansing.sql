USE SalesAnalytics;

SELECT 
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN Customer_ID IS NULL OR LTRIM(RTRIM(Customer_ID)) = '' THEN 1 ELSE 0 END) AS MissingIDs
FROM SuperstoreSales;

SELECT 
    Customer_ID AS Original_ID,
    LTRIM(RTRIM(Customer_ID)) AS Trimmed_ID
FROM SuperstoreSales
WHERE Customer_ID <> LTRIM(RTRIM(Customer_ID));

SELECT 
    Customer_ID, 
    COUNT(*) AS OrderCount
FROM SuperstoreSales
GROUP BY Customer_ID
HAVING COUNT(*) > 1
ORDER BY OrderCount DESC;


