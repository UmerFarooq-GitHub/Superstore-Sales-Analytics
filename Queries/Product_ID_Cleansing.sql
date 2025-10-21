USE SalesAnalytics;

SELECT *
FROM SuperstoreSales
WHERE Product_ID IS NULL
   OR LTRIM(RTRIM(Product_ID)) = ''

SELECT *
FROM SuperstoreSales
WHERE Product_ID NOT LIKE 'FUR-%'
  AND Product_ID NOT LIKE 'OFF-%'
  AND Product_ID NOT LIKE 'TEC-%';

SELECT *
FROM SuperstoreSales
WHERE Product_ID NOT LIKE '[A-Z][A-Z][A-Z]-[A-Z][A-Z]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]';
