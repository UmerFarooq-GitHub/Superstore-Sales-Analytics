USE SalesAnalytics;

UPDATE SuperstoreSales
SET Region = UPPER(LTRIM(RTRIM(Region)));

UPDATE SuperstoreSales
SET Region = CASE
    WHEN Region IN ('EAST', 'Eastr', 'East') THEN 'EAST'
    WHEN Region IN ('WEST', 'West', 'Wst') THEN 'WEST'
    WHEN Region IN ('SOUTH', 'South', 'Sth') THEN 'SOUTH'
    WHEN Region IN ('CENTRAL', 'Central', 'Cntral') THEN 'CENTRAL'
    ELSE Region -- Keeps unknown values for review
END;

SELECT DISTINCT Region
FROM SuperstoreSales
WHERE Region NOT IN ('EAST', 'WEST', 'SOUTH', 'CENTRAL');

SELECT *
FROM SuperstoreSales
WHERE 
    -- Check for invalid regions
    Region NOT IN ('EAST', 'WEST', 'SOUTH', 'CENTRAL');
