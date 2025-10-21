USE SalesAnalytics;
EXEC sp_columns SuperstoreSales;

SELECT 
    TOP 9994 Order_Date AS SampleValues,
    COUNT(*) AS Frequency,
    CASE
        WHEN Order_Date LIKE '%/%/%' THEN 'Slash Format (MM/DD/YYYY or DD/MM/YYYY)'
        WHEN Order_Date LIKE '%-%-%' THEN 'Dash Format (YYYY-MM-DD or DD-MM-YYYY)'
        WHEN Order_Date LIKE '%.%' THEN 'Dot Format (DD.MM.YYYY)'
        WHEN TRY_CONVERT(date, Order_Date) IS NULL THEN '❌ Invalid Format'
        ELSE '✅ Valid Date'
    END AS Format_Type
FROM SuperstoreSales
GROUP BY Order_Date
ORDER BY COUNT(*) DESC;

SELECT 
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN TRY_CONVERT(date, Order_Date) IS NULL THEN 1 ELSE 0 END) AS InvalidDateCount
FROM SuperstoreSales;


