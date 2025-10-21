
CREATE DATABASE SalesAnalytics;

USE SalesAnalytics;

EXEC sp_rename '[Sample - Superstore]', 'SuperstoreSales';

SELECT * FROM SuperstoreSales;

SELECT COUNT(*) AS Total_Rows FROM SuperstoreSales;

ALTER TABLE SuperstoreSales
ALTER COLUMN Quantity INT;
ALTER TABLE SuperstoreSales
ALTER COLUMN Postal_Code NVARCHAR(20);

SELECT DISTINCT Region FROM SuperstoreSales ORDER BY Region;
SELECT DISTINCT Segment FROM SuperstoreSales ORDER BY Segment;




