# 기준일(2019-08-16) 이전에 변경 이력이 있는 제품들의 최신 가격 추출
SELECT product_id, new_price AS price
FROM Products
WHERE (product_id, change_date) IN (
    SELECT product_id, MAX(change_date)
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

UNION

# 기준일 이전에 변경 이력이 아예 없는 제품들은 기본값 10으로 설정
SELECT product_id, 10 AS price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16';