WITH Manager AS(
    SELECT *
    FROM Employees
)

SELECT M.employee_id, M.name, COUNT(E.employee_id) AS reports_count, ROUND(AVG(E.age) ,0) AS average_age
FROM Manager M JOIN Employees E ON M.employee_id = E.reports_to
GROUP BY M.employee_id
ORDER BY M.employee_id

