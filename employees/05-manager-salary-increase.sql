SELECT
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,

    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000
            THEN 'Salary was raised by more than $30,000'
        ELSE 'Salary was NOT raised by more than $30,000'
    END AS salary_raise

FROM dept_manager dm
JOIN employees e
    ON e.emp_no = dm.emp_no
JOIN salaries s
    ON s.emp_no = dm.emp_no

GROUP BY
    dm.emp_no,
    e.first_name,
    e.last_name;
