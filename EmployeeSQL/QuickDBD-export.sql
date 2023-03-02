﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE DEPARTMENTS (
    dept_no varchar(4)   NOT NULL,
    dept_name varchar(25)   NOT NULL,
    CONSTRAINT pk_DEPARTMENTS PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE DEPT_EMP (
    emp_no INT   NOT NULL,
    dept_no varchar(4)   NOT NULL,
    CONSTRAINT pk_DEPT_EMP PRIMARY KEY (
        emp_no,dept_no
     )
);

CREATE TABLE DEPT_MANAGER (
    dept_no varchar(4)   NOT NULL,
    emp_no INT   NOT NULL,
    CONSTRAINT pk_DEPT_MANAGER PRIMARY KEY (
        dept_no,emp_no
     )
);

CREATE TABLE EMPLOYEES (
    emp_no INT   NOT NULL,
    emp_title VARCHAR(5)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    sex VARCHAR(1)   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_EMPLOYEES PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE SALARIES (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL
);

CREATE TABLE TITLES (
    title_id VARCHAR(5)   NOT NULL,
    title VARCHAR(25)   NOT NULL
);

ALTER TABLE DEPT_EMP ADD CONSTRAINT fk_DEPT_EMP_emp_no FOREIGN KEY(emp_no)
REFERENCES EMPLOYEES (emp_no);

ALTER TABLE DEPT_EMP ADD CONSTRAINT fk_DEPT_EMP_dept_no FOREIGN KEY(dept_no)
REFERENCES DEPARTMENTS (dept_no);

ALTER TABLE DEPT_MANAGER ADD CONSTRAINT fk_DEPT_MANAGER_dept_no FOREIGN KEY(dept_no)
REFERENCES DEPARTMENTS (dept_no);

ALTER TABLE DEPT_MANAGER ADD CONSTRAINT fk_DEPT_MANAGER_emp_no FOREIGN KEY(emp_no)
REFERENCES EMPLOYEES (emp_no);

ALTER TABLE EMPLOYEES ADD CONSTRAINT fk_EMPLOYEES_emp_title FOREIGN KEY(emp_title)
REFERENCES TITLES (title_id);

ALTER TABLE SALARIES ADD CONSTRAINT fk_SALARIES_emp_no FOREIGN KEY(emp_no)
REFERENCES EMPLOYEES (emp_no);

