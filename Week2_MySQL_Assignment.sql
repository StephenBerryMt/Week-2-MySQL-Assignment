-- 1. I want to know how many employees with each title were born after 1965-01-01.

SELECT e.birth_date, t.title
FROM employees e
INNER JOIN titles t USING (emp_no)
WHERE year(e.birth_date) = 1965
LIMIT 20;

-- 2. I want to know the average salary per title.

SELECT avg(s.salary) AS 'Average Salary', t.title AS 'Title'
FROM salaries s
INNER JOIN titles t USING (emp_no)
GROUP BY t.title;

-- 3. How much money was spent on salary for the marketing department between the years 1990 and 1992?

SELECT sum(s.salary) AS 'Total Salary between 1990 and 1992', d.dept_name AS 'Department'
FROM departments d
INNER JOIN dept_emp de ON de.dept_no = d.dept_no AND de.from_date < '1993-01-01'
INNER JOIN salaries s ON de.emp_no = s.emp_no AND (s.from_date BETWEEN '1990-01-01' AND '1992-12-31') AND (s.from_date BETWEEN de.from_date AND de.to_date)
WHERE dept_name LIKE '%marketing%'
GROUP BY dept_name;
