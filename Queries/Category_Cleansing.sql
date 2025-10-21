USE SalesAnalytics;

UPDATE SuperstoreSales
SET Category = UPPER(LTRIM(RTRIM(Category)));

UPDATE SuperstoreSales
SET Category = CASE
    WHEN Category IN ('FURNITURE', 'FURN', 'FURNT') THEN 'FURNITURE'
    WHEN Category IN ('OFFICE SUPPLIES', 'OFFICE', 'OFF SUPPLIES') THEN 'OFFICE SUPPLIES'
    WHEN Category IN ('TECHNOLOGY', 'TECH', 'TEC') THEN 'TECHNOLOGY'
    ELSE Category -- keep unknown values for review
END;

SELECT *
FROM SuperstoreSales
WHERE Category IS NULL
   OR LTRIM(RTRIM(Category)) = '';

SELECT DISTINCT Category
FROM SuperstoreSales
WHERE Category NOT IN ('FURNITURE', 'OFFICE SUPPLIES', 'TECHNOLOGY');
