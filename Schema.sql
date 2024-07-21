CREATE TABLE Departments (
	dept_no VARCHAR(20) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE Titles (
	title_id VARCHAR(20) PRIMARY KEY NOT NULL,
	title VARCHAR(50) NOT NULL
); 

CREATE TABLE Employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(50) NOT NULL,
	birth_date DATE, 
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	sex VARCHAR(10),
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
); 

CREATE TABLE Departments_employee (
	emp_no INT NOT NULL,
	dept_no VARCHAR(20) NOT NULL,
	PRIMARY KEY (emp_no, dept_no), -- composite primary keys
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
); 

CREATE TABLE Departments_manager (
	dept_no VARCHAR(20) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no), --composite primary keys
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
); 

CREATE TABLE Salaries (
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

