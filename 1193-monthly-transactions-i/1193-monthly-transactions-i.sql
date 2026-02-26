SELECT MONTH(trans_date) AS month, 
       COUNT(id) AS trans_count, 
       SUM(CASE WHEN state='approved' THEN 1 ELSE 0 END) AS approved_count,
       SUM(amount) AS trans_total_amount
       SUM(IF(state = 'approved', amount, 0)) AS approved_total_amount
FROM Transactions
GROUP BY month, country

