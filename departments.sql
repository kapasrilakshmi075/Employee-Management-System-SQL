---Creating department table---
CREATE TABLE departments(
department_id SERIAL PRIMARY KEY,
department_Name VARCHAR(100)  NOT NULL
);
---Display all department records---
SELECT * FROM departments;

