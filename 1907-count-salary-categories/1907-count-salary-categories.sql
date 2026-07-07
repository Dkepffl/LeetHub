WITH class_account AS(
    SELECT account_id, CASE WHEN income < 20000 THEN "Low Salary"
                WHEN income <= 50000 THEN "Average Salary"
                ELSE "High Salary"
                END AS category
    FROM Accounts),
category_list AS (
    SELECT 'Low Salary' AS category
    UNION SELECT 'Average Salary'
    UNION SELECT 'High Salary'
)

SELECT 
    c.category, 
    COUNT(a.account_id) AS accounts_count
FROM category_list c
LEFT JOIN class_account a ON c.category = a.category
GROUP BY c.category