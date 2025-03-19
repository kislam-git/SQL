WITH DateSeries AS (
    SELECT TRUNC(DATE '2024-01-01') + LEVEL - 1 AS full_date
    FROM DUAL
    CONNECT BY LEVEL <= 365
)
SELECT 
    EXTRACT(YEAR FROM full_date) AS year,
    TO_CHAR(full_date, 'Month') AS month,
    EXTRACT(DAY FROM full_date) AS date,
    TO_CHAR(full_date, 'Day') AS day_name
FROM DateSeries;
