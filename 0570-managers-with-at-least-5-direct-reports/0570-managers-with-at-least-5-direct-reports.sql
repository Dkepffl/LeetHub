WITH S AS (
    SELECT managerId, COUNT(id) AS N 
    FROM Employee 
    WHERE managerId IS NOT NULL 
    GROUP BY managerId)

SELECT E.name
FROM Employee E LEFT JOIN  S ON E.id = S.managerId
WHERE N >= 5