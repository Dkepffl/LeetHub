WITH RankedLogs AS (
    SELECT 
        id,
        num,
        LEAD(num, 1) OVER (ORDER BY id) AS next_num,
        LEAD(num, 2) OVER (ORDER BY id) AS next_next_num,
        LEAD(id, 1) OVER (ORDER BY id) AS next_id,
        LEAD(id, 2) OVER (ORDER BY id) AS next_next_id
    FROM Logs
)

SELECT DISTINCT num AS ConsecutiveNums
FROM RankedLogs
WHERE num = next_num 
  AND num = next_next_num
  # 삭제된 행이 있을 경우
  AND id + 1 = next_id 
  AND id + 2 = next_next_id;