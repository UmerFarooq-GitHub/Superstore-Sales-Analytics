USE SalesAnalytics;

UPDATE SuperstoreSales
SET [Postal_Code] = LTRIM(RTRIM([Postal_Code]));

-- Check current data type
SELECT DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SuperstoreSales' AND COLUMN_NAME = 'Postal_Code';

-- Remove any non-numeric characters except dash
UPDATE SuperstoreSales
SET [Postal_Code] = 
    CASE 
        WHEN LEN([Postal_Code]) >= 5 THEN LEFT([Postal_Code], 5)
        ELSE [Postal_Code]
    END;

SELECT DISTINCT [Postal_Code]
FROM SuperstoreSales
WHERE [Postal_Code] NOT LIKE '[0-9][0-9][0-9][0-9][0-9]'
  AND [Postal_Code] NOT LIKE '[0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]';


UPDATE SuperstoreSales
SET [Postal_Code] = RIGHT('00000' + [Postal_Code], 5)
WHERE LEN([Postal_Code]) < 5;

