--- Commented out to prevent accidents.
--DROP TABLE IF EXISTS departments;
--DROP TABLE IF EXISTS dept_emp;
--DROP TABLE IF EXISTS dept_manager;
--DROP TABLE IF EXISTS employees;
--DROP TABLE IF EXISTS salaries;
--DROP TABLE IF EXISTS titles;


-- Create the tables.

CREATE TABLE departments (
  dept_no varchar (4) PRIMARY KEY,
  dept_name varchar (20) NOT NULL
);

CREATE TABLE employees (
  emp_no integer PRIMARY KEY,
  birth_date date NOT NULL,
  first_name varchar (20) NOT NULL,
  last_name varchar (20) NOT NULL,
  sex char(1) NOT NULL,
  hire_date date NOT NULL
);

CREATE TABLE dept_emp (
  emp_no integer,
  dept_no varchar (4),
  from_date date NOT NULL,
  to_date date NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no) 
);

CREATE TABLE dept_manager (
  dept_no varchar (4),
  emp_no integer,
  from_date date NOT NULL,
  to_date date NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
  emp_no integer,
  salary money NOT NULL,
  from_date date NOT NULL,
  to_date date NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
  emp_no integer,
  title varchar (20) NOT NULL,
  from_date date NOT NULL,
  to_date date NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

