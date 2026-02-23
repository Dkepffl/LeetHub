SELECT E.name, B.bonus
FROM Employee E LEFT JOIN Bonus B On E.empID=B.empId
WHERE bonus < 1000 OR bonus IS NULL