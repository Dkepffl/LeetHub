WITH Earliest AS (
    SELECT product_id, min(year) AS first_year
    FROM Sales
    GROUP BY product_id
) 

SELECT S.product_id, E.first_year, S.quantity, S.price
FROM Sales S JOIN Earliest E ON (S.year = E.first_year) and (S.product_id = E.product_id)