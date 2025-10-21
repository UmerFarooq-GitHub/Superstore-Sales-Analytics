USE SalesAnalytics;

SELECT DISTINCT Country
FROM SuperstoreSales
ORDER BY Country;

SELECT 
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN Country IS NULL OR LTRIM(RTRIM(Country)) = '' THEN 1 ELSE 0 END) AS MissingCountries
FROM SuperstoreSales;

SELECT 
    Country AS Original_Value,
    LTRIM(RTRIM(Country)) AS Trimmed_Value,
    UPPER(LTRIM(RTRIM(Country))) AS Upper_Value
FROM SuperstoreSales
WHERE 
    Country <> LTRIM(RTRIM(Country))

UPDATE SuperstoreSales
SET Country = UPPER(LTRIM(RTRIM(Country)));

SELECT DISTINCT Country FROM SuperstoreSales;
