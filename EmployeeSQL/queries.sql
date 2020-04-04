--Jason Johnson SQL challenge

-- Queries
-- Verify the data imports.

SELECT * FROM departments LIMIT 100;
SELECT * FROM employees LIMIT 100;
SELECT * FROM dept_emp LIMIT 100;
SELECT * FROM dept_manager LIMIT 100;
SELECT * FROM salaries LIMIT 100;
SELECT * FROM titles LIMIT 100;
 
-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

--- Perform a view based on an INNER JOIN bewteen employees & salaries

CREATE VIEW employee_salary AS
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

--- Display the employee's data
SELECT * FROM employee_salary

-- 2. List employees who were hired in 1986.

SELECT * 
FROM employees
WHERE hire_date >= '1-01-1986' AND 
  hire_date <= '12-31-1986'
ORDER BY hire_date;

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.

--- Perform a view based on an INNER JOIN bewteen departments & dept_manager

DROP VIEW IF EXISTS dept_manager_info;

CREATE VIEW dept_manager_info
AS SELECT a.dept_no, dept_name, b.emp_no, last_name, first_name, from_date, to_date
FROM departments a, dept_manager b, employees c
WHERE a.dept_no=b.dept_no
AND b.emp_no=c.emp_no;

SELECT * FROM dept_manager_info;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

-- DROP VIEW IF EXISTS employee_department; -- Don't run this on accident.

--- Perform a view based on a JOIN bewteen employees & dept_emp & departments.

CREATE VIEW employee_department
AS SELECT a.emp_no, last_name, first_name, dept_name
FROM employees a, dept_emp b, departments c
WHERE a.emp_no=b.emp_no
AND b.dept_no=c.dept_no
ORDER BY a.emp_no;

--- Display the employee department data
SELECT * FROM employee_department;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
FROM employees
WHERE (first_name = 'Hercules')
 AND (last_name LIKE 'B%');

-- 6. List all employees in the Sales department, including their employee number
-- , last name, first name, and department name.

-- DROP VIEW IF EXISTS sales_department; -- Don't run this on accident.

CREATE VIEW sales_department
AS SELECT a.emp_no, last_name, first_name, dept_name
FROM employees a, dept_emp b, departments c
WHERE a.emp_no = b.emp_no
  AND b.dept_no = c.dept_no
  AND c.dept_name = 'Sales'
ORDER BY a.emp_no

--- Display the sales department data
SELECT * FROM sales_department;

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

-- DROP VIEW IF EXISTS sales_dev_department; -- Don't run this on accident.

CREATE VIEW sales_dev_department
AS SELECT a.emp_no, last_name, first_name, dept_name
FROM employees a, dept_emp b, departments c
WHERE a.emp_no = b.emp_no
  AND b.dept_no = c.dept_no
  AND (c.dept_name = 'Sales' 
    OR c.dept_name = 'Development')
ORDER BY a.emp_no

--- Display the sales department data
SELECT * FROM sales_dev_department;

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY count DESC;
