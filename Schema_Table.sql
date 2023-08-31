CREATE TABLE Department (
    dept_no varchar(20)   NOT NULL PRIMARY KEY,
    dept_name varchar(50)   NOT NULL 
    );

CREATE TABLE Titles (
    title_id varchar(10)   NOT NULL PRIMARY KEY,
    title varchar(30)   NOT NULL
);


CREATE TABLE Employees (
    emp_no int   NOT NULL PRIMARY KEY,
    emp_title_id varchar(10)   NOT NULL, 
    FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id),
    birth_date date   NOT NULL,
    first_name varchar(30)   NOT NULL,
    last_name varchar(30)   NOT NULL,
    sex varchar(5)   NOT NULL,
    hire_date date   NOT NULL
     );


CREATE TABLE Dept_Emp (
    emp_no int   NOT NULL,
    dept_no varchar(20)   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Department(dept_no)
);

CREATE TABLE Dept_Manager (
    dept_no varchar(20)    NOT NULL,
    emp_no int   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Department(dept_no)
);


CREATE TABLE Salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);


