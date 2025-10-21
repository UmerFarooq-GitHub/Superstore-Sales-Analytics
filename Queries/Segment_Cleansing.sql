USE SalesAnalytics;

SELECT DISTINCT Segment
FROM SuperstoreSales
ORDER BY Segment;

SELECT 
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN Segment IS NULL OR LTRIM(RTRIM(Segment)) = '' THEN 1 ELSE 0 END) AS MissingSegments
FROM SuperstoreSales;

SELECT 
    Segment AS Original_Value,
    LTRIM(RTRIM(Segment)) AS Trimmed_Value,
    UPPER(LTRIM(RTRIM(Segment))) AS Upper_Value
FROM SuperstoreSales
WHERE Segment <> LTRIM(RTRIM(Segment))
   OR Segment COLLATE SQL_Latin1_General_CP1_CS_AS <> UPPER(Segment);

UPDATE SuperstoreSales
SET Segment = UPPER(LTRIM(RTRIM(Segment)));

SELECT DISTINCT Segment FROM SuperstoreSales;

SELECT 
    Segment,
    COUNT(*) AS OrderCount,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM SuperstoreSales), 2) AS Percentage
FROM SuperstoreSales
GROUP BY Segment
ORDER BY OrderCount DESC;
