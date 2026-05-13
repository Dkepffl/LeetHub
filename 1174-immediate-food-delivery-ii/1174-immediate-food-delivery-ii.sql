SELECT ROUND(AVG(CASE WHEN order_date=customer_pref_delivery_date THEN 1 ELSE 0 END)*100, 2) AS immediate_percentage
FROM (SELECT 
        customer_id,
        order_date,
        customer_pref_delivery_date,
        -- 고객별로 주문 날짜가 빠른 순서대로 순위를 매김
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM Delivery) ranked_delivery
WHERE rn = 1
