With company_avg_monthly_salary AS (
    SELECT DATE_FORMAT(pay_date, "%Y-%m") AS year_month1, AVG(amount) AS company_avg   
    FROM salary
    GROUP BY year_month1 
)

SELECT DATE_FORMAT(pay_date, "%Y-%m") AS pay_month, department_id, 
(
    CASE 
        WHEN ROUND(AVG(salary.amount)) > ROUND(company_avg_monthly_salary.company_avg) THEN "higher"
        WHEN ROUND(AVG(salary.amount)) < ROUND(company_avg_monthly_salary.company_avg) THEN "lower"
        ELSE "same"
    END
    
) comparison
FROM employee 
INNER JOIN salary ON employee.employee_id = salary.employee_id
INNER JOIN company_avg_monthly_salary ON DATE_FORMAT(pay_date, "%Y-%m") = company_avg_monthly_salary.year_month1
GROUP BY pay_month, department_id


/*

1. The CTE calculates the average salary per month of the company.
2. The main query 
    i. It joins the CTE with the month and year combination  
    ii. Calculates the average of salary per month per department. 
    iii. It compares the average salary per month of the entire company with the average salary per month per department and uses the CASE statement to print "higher", "lower" or "same"

*/