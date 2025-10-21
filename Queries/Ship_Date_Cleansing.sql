USE SalesAnalytics;

SELECT 
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN Ship_Date IS NULL THEN 1 ELSE 0 END) AS NullDates,
    SUM(CASE WHEN TRY_CONVERT(date, Ship_Date) IS NULL THEN 1 ELSE 0 END) AS InvalidDates
FROM SuperstoreSales;

SELECT COUNT(*) AS InvalidOrderShipPairs
FROM SuperstoreSales
WHERE Ship_Date < Order_Date;

SELECT 
    MIN(Ship_Date) AS Earliest_ShipDate,
    MAX(Ship_Date) AS Latest_ShipDate
FROM SuperstoreSales;

SELECT COUNT(*) AS FutureShipDates
FROM SuperstoreSales
WHERE Ship_Date > GETDATE();

SELECT 
    AVG(DATEDIFF(DAY, Order_Date, Ship_Date)) AS Avg_Shipping_Days,
    MIN(DATEDIFF(DAY, Order_Date, Ship_Date)) AS Min_Shipping_Days,
    MAX(DATEDIFF(DAY, Order_Date, Ship_Date)) AS Max_Shipping_Days
FROM SuperstoreSales;
