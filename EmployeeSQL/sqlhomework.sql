--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
--SELECT * FROM employee;
--SELECT * FROM salaries
-- Perform an INNER JOIN on the two tables
SELECT employee.emp_no, employee.first_name, employee.last_name, employee.sex, salaries.salary
FROM salaries
INNER JOIN employee ON
employee.emp_no=salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date FROM employee WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01'

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, dept.dept_name, dm.emp_no, e.first_name, e.last_name
	FROM dept_manager as dm
	JOIN departments as dept
	ON (dm.dept_no = dept.dept_no)
	JOIN employee as e
	ON (dm.emp_no = e.emp_no);
	
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
--SELECT * FROM departments
SELECT dept.dept_name, e.emp_no, e.first_name, e.last_name
	FROM dept_emp as de
	JOIN departments as dept
	ON (de.dept_no = dept.dept_no)
	JOIN employee as e
	ON (de.emp_no = e.emp_no);
	
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM employee WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept.dept_name, e.emp_no, e.first_name, e.last_name
	FROM dept_emp as de
	JOIN departments as dept
	ON (de.dept_no = dept.dept_no)
	JOIN employee as e
	ON (de.emp_no = e.emp_no)
	WHERE dept.dept_name = 'Sales';
	
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept.dept_name, dm.emp_no, e.first_name, e.last_name
	FROM dept_manager as dm
	JOIN departments as dept
	ON (dm.dept_no = dept.dept_no)
	JOIN employee as e
	ON (dm.emp_no = e.emp_no)
	WHERE dept.dept_name in ('Sales', 'Development');
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name)
FROM employee
group by last_name
order by count(last_name) desc;

-- SELECT e.emp_no, e.first_name, e.last_name, dept.dept_name
-- 	FROM employee as e
-- 	INNER JOIN dept_emp as de
-- 	ON (e.emp_no = de.emp_no)
-- 	JOIN departments as dept
-- 	ON (de.dept_no = dept.dept_no)
-- 	WHERE dept.dept_name = 'Sales';
	
	
	

