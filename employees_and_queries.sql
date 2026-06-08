---Creating employees table---
CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    gender VARCHAR(50),
    job_title VARCHAR(100),
    salary NUMERIC(10,2)NOT NULL,
    hire_date DATE,
    department_id INT,
    FOREIGN KEY(department_id)
        REFERENCES departments(department_id)
);
---Display records---
SELECT * FROM employees;

INSERT INTO employees
(first_name, last_name, gender, job_title, salary, hire_date, department_id)
VALUES
('Amit', 'Verma', 'Male', 'Software Engineer', 65000, '2023-03-12', 4),
('Sneha', 'Reddy', 'Female', 'Data Analyst', 55000, '2022-08-20', 2),
('Karan', 'Patel', 'Male', 'Marketing Executive', 45000, '2021-11-05', 3),
('Anjali', 'Gupta', 'Female', 'HR Manager', 70000, '2020-06-15', 1),
('Rahul', 'Singh', 'Male', 'Database Administrator', 80000, '2019-09-10', 4),
('Pooja', 'Nair', 'Female', 'Accountant', 50000, '2022-01-18', 5),
('Vikram', 'Rao', 'Male', 'Project Manager', 90000, '2018-04-25', 6),
('Neha', 'Joshi', 'Female', 'UI/UX Designer', 60000, '2023-07-14', 4),
('Arjun', 'Mehta', 'Male', 'Business Analyst', 65000, '2021-12-01', 2),
('Kavya', 'Iyer', 'Female', 'Content Writer', 42000, '2024-03-08', 3),
('Rohit', 'Das', 'Male', 'Network Engineer', 70000, '2020-10-19', 4),
('Meera', 'Kapoor', 'Female', 'Sales Executive', 48000, '2023-05-30', 7),
('Suresh', 'Yadav', 'Male', 'System Administrator', 75000, '2019-02-11', 4),
('Divya', 'Mishra', 'Female', 'Recruiter', 45000, '2022-09-17', 1),
('Manoj', 'Choudhary', 'Male', 'Finance Manager', 85000, '2018-07-09', 5)
---Display all employees records---
SELECT * FROM employees;
---QUIRES---
---employees earning more than ₹60,000---
SELECT first_name, last_name, salary
FROM employees
WHERE salary>60000;

---employees hired after 2022---
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date>'2022-12-31';

---counting employees in each department---
SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
ORDER BY department_id ASC;

---average salary by department---
SELECT department_id, ROUND(AVG(salary),2) AS average_salary
FROM employees
GROUP BY department_id
ORDER BY department_id ASC;

---display employee name with department name using JOIN---
SELECT e.first_name,e.last_name,d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

---highest paid employee---
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 1;

---lowest paid employee---
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary ASC
LIMIT 1;

---department-wise Mmaximun salary---
SELECT department_id, MAX(salary) AS highest_salary
FROM employees
GROUP BY department_id;

---department-wise highest salary---
SELECT d.department_name,
       MAX(e.salary) AS highest_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;