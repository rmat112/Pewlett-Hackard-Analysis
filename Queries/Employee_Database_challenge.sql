--create a Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

--create a Unique Titles table that contains the employee number, first and last name, and most recent title
-- Use Distinct with Orderby to remove duplicate rows	
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--create a Retiring Titles table that contains the number of titles filled by employees who are retiring
SELECT COUNT(title), title
INTO retitring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

--create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	   e.first_name, 
	   e.last_name, 
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   t.title
INTO mentorship_eligibilty
FROM employees as e
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN titles as t
ON e.emp_no = t.emp_no
WHERE de.to_date = '9999-01-01'
AND birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp_no;

--Two additional queries:
--How many roles will need to be filled as the "silver tsunami" begins to make an impact?
SELECT SUM(count)
FROM retitring_titles;

--Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees
SELECT COUNT(emp_no) FROM mentorship_eligibilty;
