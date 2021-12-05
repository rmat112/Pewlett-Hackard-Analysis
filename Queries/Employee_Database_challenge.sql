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

--Two questions and two additional queries:
--How many roles will need to be filled as the "silver tsunami" begins to make an impact?
SELECT SUM(count)
FROM retitring_titles;

--Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees
SELECT COUNT(emp_no) FROM mentorship_eligibilty;

--To find departments that will see most retirements
--First create a table that shows departments of employees who will be retiring
SELECT u.emp_no, 
	   u.first_name, 
	   u.last_name, 
	   u.title, 
	   de.dept_no, 
	   d.dept_name, 
	   de.to_date
INTO retiring_dept
FROM unique_titles as u
JOIN dept_emp as de
ON u.emp_no = de.emp_no
JOIN departments as d
on de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01';

-- Then find number of retiring employees by department
SELECT dept_name, COUNT(dept_name)
INTO no_by_dept
FROM retiring_dept
GROUP BY dept_name;

-- Finding mentors by department
--First create a table to hold mentor info by department
SELECT DISTINCT ON(me.emp_no) me.emp_no, me.title, de.dept_no, d.dept_name
INTO mentor_info
FROM mentorship_eligibilty as me
JOIN dept_emp as de
ON me.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
WHERE me.to_date = '9999-01-01';

--Then find the number of mentors per department
SELECT dept_name, COUNT(dept_name)
INTO mentor_by_dept
FROM mentor_info
GROUP BY dept_name;
