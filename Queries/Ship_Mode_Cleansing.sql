USE SalesAnalytics;

SELECT DISTINCT Ship_Mode
FROM SuperstoreSales
ORDER BY Ship_Mode;

SELECT 
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN Ship_Mode IS NULL OR LTRIM(RTRIM(Ship_Mode)) = '' THEN 1 ELSE 0 END) AS MissingValues
FROM SuperstoreSales;

SELECT 
    Ship_Mode AS Original_Mode,
    LTRIM(RTRIM(Ship_Mode)) AS Trimmed_Mode,
    UPPER(LTRIM(RTRIM(Ship_Mode))) AS Upper_Mode
FROM SuperstoreSales
WHERE Ship_Mode <> LTRIM(RTRIM(Ship_Mode))
   OR Ship_Mode COLLATE SQL_Latin1_General_CP1_CS_AS <> UPPER(Ship_Mode);


SELECT DISTINCT Ship_Mode
FROM SuperstoreSales
WHERE UPPER(LTRIM(RTRIM(Ship_Mode))) NOT IN (
    'FIRST CLASS',
    'SECOND CLASS',
    'STANDARD CLASS',
    'SAME DAY'
);

UPDATE SuperstoreSales
SET Ship_Mode = UPPER(LTRIM(RTRIM(Ship_Mode)));

SELECT DISTINCT Ship_Mode
FROM SuperstoreSales
ORDER BY Ship_Mode;

SELECT 
    Ship_Mode, 
    COUNT(*) AS OrderCount, 
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM SuperstoreSales), 2) AS Percentage
FROM SuperstoreSales
GROUP BY Ship_Mode
ORDER BY OrderCount DESC;

