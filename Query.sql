--Data Analysis:
-- List the employee number, last name, first name, sex, and salary of each employee
SELECT emp_no, last_name, first_name, sex, (
	SELECT salary FROM Salaries WHERE Salaries.emp_no = Employees.emp_no
) As employees_salary
FROM Employees; 

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date FROM Employees 
WHERE EXTRACT (YEAR FROM hire_date) = 1986;

-- List the manager of each department along with their department number, department name, 
--employee number, last name, and first name

SELECT dm.dept_no, dm.emp_no, d.dept_name, e.last_name, e.first_name
FROM Departments_manager AS dm
JOIN Departments AS d ON dm.dept_no = d.dept_no
JOIN Employees AS e ON dm.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name FROM Employees AS e
JOIN Departments_employee AS de ON e.emp_no = de.emp_no
JOIN Departments AS d ON de.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B
SELECT first_name, last_name, sex FROM Employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name 
SELECT e.emp_no, e.last_name, e.first_name FROM Employees AS e
JOIN Departments_employee AS de ON e.emp_no = de.emp_no 
JOIN Departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'; 

--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name 
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name FROM Employees As e
JOIN Departments_employee AS de ON e.emp_no = de.emp_no 
JOIN Departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) AS Frequency_counts FROM Employees
GROUP BY last_name ORDER BY Frequency_counts DESC;