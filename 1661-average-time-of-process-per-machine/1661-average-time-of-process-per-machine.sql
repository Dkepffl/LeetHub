WITH START AS (
    SELECT *
    FROM Activity
    WHERE activity_type = 'start'
), END AS (
    SELECT *
    FROM Activity
    WHERE activity_type = 'end'
)

SELECT S.machine_id, ROUND(AVG(E.timestamp - S.timestamp), 4) AS processing_time
FROM START S JOIN END E ON S.machine_id=E.machine_id AND S.process_id=E.process_id
GROUP BY S.machine_id