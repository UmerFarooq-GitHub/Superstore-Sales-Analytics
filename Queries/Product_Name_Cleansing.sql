USE SalesAnalytics;

UPDATE SuperstoreSales
SET Product_Name = LTRIM(RTRIM(Product_Name));

SELECT *
FROM SuperstoreSales
WHERE Product_Name IS NULL
   OR LTRIM(RTRIM(Product_Name)) = '';

SELECT Product_ID, Product_Name, COUNT(*) AS CountOccurrences
FROM SuperstoreSales
GROUP BY Product_ID, Product_Name
HAVING COUNT(*) > 1;

SELECT *
FROM SuperstoreSales
WHERE LEN(Product_Name) > 100; -- adjust threshold as needed

UPDATE SuperstoreSales
SET Product_Name_Short = LEFT(Product_Name, 50); -- first 50 chars

SELECT 
    Product_Name,
    CASE 
        WHEN Product_Name LIKE 'I Need%Hello Kitty%' 
             THEN LEFT(REPLACE(Product_Name, 'I Need''s ', ''), 50)
        ELSE LEFT(Product_Name, 50)
    END AS Product_Name_Short_Preview
FROM SuperstoreSales
WHERE Product_Name LIKE '%Hello Kitty Hybrid Silicone Case Cover%'
   OR Product_Name LIKE '%Ativa D5772 2-Line 5.8GHz Digital Expandable%'
ORDER BY Product_Name;

UPDATE SuperstoreSales
SET Product_Name = 
    CASE 
        WHEN Product_Name LIKE 'I Need%Hello Kitty%' 
             THEN LEFT(REPLACE(Product_Name, 'I Need''s ', ''), 50)
        ELSE LEFT(Product_Name, 50)
    END
WHERE LEN(Product_Name) > 50;

