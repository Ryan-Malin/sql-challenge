--QUESTION1
--List the following details of each employee: 
--employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON
	employees.emp_no=salaries.emp_no
	

--QUESTION2
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE DATE_PART('year', hire_date) = 1986;

--QUESTION3
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no,
	employees.last_name, employees.first_name
FROM departments
LEFT JOIN dept_manager on
	departments.dept_no=dept_manager.dept_no
	LEFT JOIN employees on
		dept_manager.emp_no=employees.emp_no

--QUESTION4
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no,
	employees.last_name, employees.first_name
FROM departments
LEFT JOIN dept_manager on
	departments.dept_no=dept_manager.dept_no
	LEFT JOIN employees on
		dept_manager.emp_no=employees.emp_no

--QUESTION5
--List first name, last name, and sex for employees whose first name is "Hercules" and 
--last names begin with "B."

SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name='Hercules' AND employees.last_name LIKE 'B%';

--QUESTION6
--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.

SELECT employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp ON
	employees.emp_no=dept_emp.emp_no
	JOIN departments ON
		dept_emp.dept_no=departments.dept_no
		WHERE departments.dept_name='Sales';

--QUESTION7
--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

SELECT employees.first_name, employees.last_name, employees.emp_no, departments.dept_name
FROM employees
JOIN dept_emp ON
	employees.emp_no=dept_emp.emp_no
	JOIN departments ON
		dept_emp.dept_no=departments.dept_no
		WHERE departments.dept_name='Sales' OR departments.dept_name='Development';

--QUESTION8
--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT employees.last_name, 
	COUNT (employees.last_name)
FROM employees
GROUP BY employees.last_name
ORDER BY COUNT DESC