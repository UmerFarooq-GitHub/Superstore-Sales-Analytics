USE SalesAnalytics;
EXEC sp_columns SuperstoreSales;

-- customer name spaces check start
SELECT 
    COUNT(*) AS Total_Rows,
    SUM(CASE WHEN LEN(Customer_Name) <> LEN(LTRIM(RTRIM(Customer_Name))) THEN 1 ELSE 0 END) AS Rows_With_Spaces
FROM SuperstoreSales;
-- customer name spaces check end

-- customer name consistent check start
DECLARE @InconsistentCount INT;

SELECT @InconsistentCount = COUNT(*)
FROM (
    SELECT LOWER(Customer_Name) AS NameLower, COUNT(DISTINCT Customer_Name) AS FormatVariants
    FROM SuperstoreSales
    GROUP BY LOWER(Customer_Name)
    HAVING COUNT(DISTINCT Customer_Name) > 1
) AS Inconsistent;

-- Conditional output based on inconsistency presence
IF @InconsistentCount = 0
BEGIN
    PRINT 'All Customer_Name entries are consistent in formatting (no case inconsistencies).';
END
ELSE
BEGIN
    PRINT 'Found ' + CAST(@InconsistentCount AS VARCHAR(10)) + ' customer names with inconsistent casing formats.';
    PRINT 'Showing all inconsistent name variants below:';

    SELECT 
        LOWER(Customer_Name) AS Name_Base,
        STRING_AGG(Customer_Name, ', ') AS Variants
    FROM SuperstoreSales
    GROUP BY LOWER(Customer_Name)
    HAVING COUNT(DISTINCT Customer_Name) > 1
    ORDER BY Name_Base;
END;

-- customer name consistent check end