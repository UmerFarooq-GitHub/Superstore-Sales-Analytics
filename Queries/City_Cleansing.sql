USE SalesAnalytics;

SELECT DISTINCT City
FROM SuperstoreSales
ORDER BY City;

SELECT 
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN City IS NULL OR LTRIM(RTRIM(City)) = '' THEN 1 ELSE 0 END) AS MissingCities
FROM SuperstoreSales;

SELECT 
    City AS Original,
    LTRIM(RTRIM(City)) AS Trimmed
FROM SuperstoreSales
WHERE City <> LTRIM(RTRIM(City));

SELECT 
    City AS Original,
    LTRIM(RTRIM(City)) AS Trimmed
FROM SuperstoreSales
WHERE City <> LTRIM(RTRIM(City));

SELECT 
    UPPER(LTRIM(RTRIM(City))) AS City_Base,
    COUNT(DISTINCT City) AS Variants
FROM SuperstoreSales
GROUP BY UPPER(LTRIM(RTRIM(City)))
HAVING COUNT(DISTINCT City) > 1
ORDER BY City_Base;

UPDATE SuperstoreSales
SET City = UPPER(LTRIM(RTRIM(City)));

SELECT DISTINCT TOP 20 City
FROM SuperstoreSales
ORDER BY City;

SELECT 
    Postal_Code,
    COUNT(DISTINCT City) AS CityCount,
    STRING_AGG(City, ', ') AS CityNames
FROM SuperstoreSales
GROUP BY Postal_Code
HAVING COUNT(DISTINCT City) > 1;

SELECT DISTINCT 
    City, Region, 
    State, 
    Region, 
    Postal_Code
FROM SuperstoreSales
WHERE Postal_Code = '92024';

SELECT DISTINCT State
FROM SuperstoreSales
ORDER BY State;

SELECT 
    c.City,
    COUNT(DISTINCT c.Postal_Code) AS UniquePostalCodes,
    STUFF((
        SELECT DISTINCT ', ' + c2.Postal_Code
        FROM SuperstoreSales c2
        WHERE c2.City = c.City 
          AND c2.State = 'California'
        FOR XML PATH(''), TYPE
    ).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS PostalList
FROM SuperstoreSales c
WHERE c.State = 'California'
GROUP BY c.City
ORDER BY c.City;

UPDATE SuperstoreSales
SET City = 'ENCINITAS'
WHERE Postal_Code = '92024';




