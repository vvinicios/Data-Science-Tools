/* 
Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy:
Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.
Note:
The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.
 */

SELECT
    comp.company_code,
    comp.founder,
    COUNT(DISTINCT lm.lead_manager_code) AS lead_manager,
    COUNT(DISTINCT sm.senior_manager_code) AS senior_manager,
    COUNT(DISTINCT m.manager_code) AS manager,
    COUNT(DISTINCT e.employee_code) AS employee
FROM Company comp
JOIN Lead_Manager lm
    ON comp.company_code = lm.company_code
JOIN Senior_Manager sm
    ON comp.company_code = sm.company_code
JOIN Manager m
    ON comp.company_code = m.company_code
JOIN Employee e
    ON comp.company_code = e.company_code
GROUP BY
    comp.company_code,
    comp.founder
ORDER BY
    comp.company_code