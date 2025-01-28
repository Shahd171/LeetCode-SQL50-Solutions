# Write your MySQL query statement below
SELECT product_id, 
       year AS first_year,
      quantity, 
      price
FROM (
    SELECT *, 
           rank() OVER (PARTITION BY product_id ORDER BY year) AS rankNumber
    FROM Sales
) subquery
WHERE rankNumber = 1;