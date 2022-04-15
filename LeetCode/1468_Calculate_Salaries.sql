With max_sal_per_company AS (
    SELECT company_id, MAX(salary) as m_salary
    FROM Salaries
    GROUP BY company_id
) 
SELECT Salaries.company_id, employee_id, employee_name,
ROUND(
    (
        CASE 
        
        WHEN max_sal_per_company.m_salary >= 1000 AND max_sal_per_company.m_salary <= 10000 THEN salary - (0.24 * salary)
        
        WHEN max_sal_per_company.m_salary > 10000 THEN salary - (0.49 * salary)
        
        ELSE salary
        
        END
    )
) AS Salary
FROM Salaries
JOIN max_sal_per_company ON Salaries.company_id  = max_sal_per_company.company_id