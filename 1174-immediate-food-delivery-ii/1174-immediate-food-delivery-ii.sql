WITH ranked_delivery AS (
    SELECT 
        customer_id,
        order_date,
        customer_pref_delivery_date,
        -- 고객별로 주문 날짜가 빠른 순서대로 순위를 매김
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM Delivery
), 
ORDERSTATE AS (
    SELECT 
        customer_id, 
        order_date,
        customer_pref_delivery_date,
        CASE WHEN order_date = customer_pref_delivery_date THEN 'immediate' ELSE 'scheduled' END AS STATE
    FROM Delivery
)

SELECT 
    ROUND(AVG(CASE WHEN STATE = 'immediate' THEN 1 ELSE 0 END) * 100, 2) AS immediate_percentage
FROM ranked_delivery r
JOIN ORDERSTATE o 
  ON r.customer_id = o.customer_id 
 AND r.order_date = o.order_date
WHERE r.rn = 1;