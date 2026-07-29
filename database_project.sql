-- highlight the part you want to run
-- create departments
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);
-- put data into dep
INSERT INTO Departments (department_id, department_name)
VALUES
(1, 'QA'),
(2, 'Development'),
(3, 'HR'),
(4, 'Finance');
-- see table
SELECT * FROM Departments;
-- condition check
SELECT *
FROM Departments
WHERE department_name = 'QA';
-- show dep alphabetically
SELECT *
FROM Departments
ORDER BY department_name;
-- show dep by desc id
SELECT *
FROM Departments
ORDER BY department_id DESC;
-- check aliases
SELECT department_name AS Department
FROM Departments;
-- create employee
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);
-- add data in employee
INSERT INTO Employees (employee_id, employee_name, salary, department_id)
VALUES
(1, 'Ali', 60000, 1),
(2, 'Sara', 75000, 2),
(3, 'Ahmed', 50000, 2),
(4, 'Hina', 55000, NULL),
(5, 'Fatima', 65000, 1),
(6, 'Usman', 45000, 4);
-- show emplyees
SELECT *
FROM Employees;
-- joins
-- inner join
SELECT e.employee_name, d.department_name
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id;
-- left join
SELECT e.employee_name, d.department_name
FROM Employees e
LEFT JOIN Departments d
ON e.department_id = d.department_id;
-- right join
SELECT e.employee_name, d.department_name
FROM Employees e
RIGHT JOIN Departments d
ON e.department_id = d.department_id;
-- full outer join
SELECT e.employee_name, d.department_name
FROM Employees e
FULL OUTER JOIN Departments d
ON e.department_id = d.department_id;
-- self join
-- manager
ALTER TABLE Employees
ADD manager_id INT;
-- assign manager
UPDATE Employees
SET manager_id = NULL
WHERE employee_id = 2;   -- Sara (manager)

UPDATE Employees
SET manager_id = 2
WHERE employee_id IN (1,3,5,6);   -- Ali, Ahmed, Fatima, Usman report to Sara

UPDATE Employees
SET manager_id = 5
WHERE employee_id = 4;   -- Hina reports to Fatima
-- show
SELECT
    e.employee_name AS Employee,
    m.employee_name AS Manager
FROM Employees e
LEFT JOIN Employees m
ON e.manager_id = m.employee_id;
-- employees with no department
SELECT e.employee_name
FROM Employees e
LEFT JOIN Departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;
-- department with no employees
SELECT d.department_name
FROM Departments d
LEFT JOIN Employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;
-- employees earning more than 55k
SELECT e.employee_name, e.salary, d.department_name
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id
WHERE e.salary > 55000;
