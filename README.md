# Pewlett-Hackard-Analysis
Pewlett-Hackard (PH) is a large company with several thousand employees and it has been around for a long time. As baby boomers begin to retire, PH is looking toward the future in two ways. Its looking at providing retirement packages to those who meet certain criteria. Second, its starting to think about which positions need to be filled in near future. The HR analyst Bobby is performing the analysis to find out who will be retiring and how many positions will PH need to fill in next few years. The data available is in the form of 6 csv files. Using SQL, we helped them build an employee database that can answer all questions that the HR analyst has.

## Tools
PostgreSQL 14.1 and pgAdmin 4

## Overview of the Analysis
Determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. Prepare a report that summarizes this analysis and helps prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.

## Results
A SQL query yeilding the results below is saved as 
[Employee_Database_challenge](https://github.com/rmat112/Pewlett-Hackard-Analysis/blob/main/Queries/Employee_Database_challenge.sql)
#### 1. The Number of Retiring Employees by Title
* A query is written and executed to create a 'Retirement Titles' table for employees who are born between January 1, 1952 and December 31, 1955.
![retirement_titles](https://github.com/rmat112/Pewlett-Hackard-Analysis/blob/main/Resources/retirement_titles.png)
* The Retirement Titles table is exported as retirement_titles.csv.<br/>
[retirement_titles.csv](https://github.com/rmat112/Pewlett-Hackard-Analysis/blob/main/Data/retirement_titles.csv)

* A query is written and executed to create a Unique Titles table that contains the employee number, first and last name, and most recent title. 
![unique_titles](https://github.com/rmat112/Pewlett-Hackard-Analysis/blob/main/Resources/unique_titles.png)
* The Unique Titles table is exported as unique_titles.csv.<br/>
[unique_titles.csv](https://github.com/rmat112/Pewlett-Hackard-Analysis/blob/main/Data/unique_titles.csv)

* A query is written and executed to create a Retiring Titles table that contains the number of titles filled by employees who are retiring. 
![retiring_titles](https://github.com/rmat112/Pewlett-Hackard-Analysis/blob/main/Resources/retiring_titles.png)
* The Retiring Titles table is exported as retiring_titles.csv.<br/>
[retiring_titles.csv](https://github.com/rmat112/Pewlett-Hackard-Analysis/blob/main/Data/retiring_titles.csv)

#### 2. The Employees Eligible for the Mentorship Program
* A query is written and executed to create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965.
![mentorship](https://github.com/rmat112/Pewlett-Hackard-Analysis/blob/main/Resources/mentorship.png)
* The Mentorship Eligibility table is exported and saved as mentorship_eligibilty.csv.<br/>
[mentorship_eligibility.csv](https://github.com/rmat112/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_eligibility.csv)


## Summary

How many roles will need to be filled as the "silver tsunami" begins to make an impact?
Adding the count of titles that will be retiring from the 'retiring_titles' table we find that 90,398 roles will need to be filled.
![sum_retiring_titles](https://github.com/rmat112/Pewlett-Hackard-Analysis/blob/main/Resources/sum_retiring_titles.png)

Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
No, there are only 1,549 employees who can mentor the next generation employees. This information was extracted from the mentorship table.
![no_of_mentors](https://github.com/rmat112/Pewlett-Hackard-Analysis/blob/main/Resources/no_of_mentors.png)
