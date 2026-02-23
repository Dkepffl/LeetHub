SELECT S.user_id, ROUND(SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END)/COUNT(S.user_id),2) AS confirmation_rate
FROM Signups S LEFT OUTER JOIN Confirmations C ON S.user_id = C.user_id
GROUP BY S.user_id

