CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

INSERT INTO Departments VALUES
(101, 'Computer Science'),
(102, 'Software Engineering'),
(103, 'Electrical Engineering'),
(104, 'Business Administration');

INSERT INTO Students VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 103),
(4, 'David', 104),
(5, 'Eva', 101),
(6, 'Frank', NULL);

SELECT * FROM Students;
SELECT * FROM Departments;

-- INNER JOIN
SELECT
    s.StudentID,
    s.Name,
    d.DepartmentName
FROM Students s
INNER JOIN Departments d
ON s.DepartmentID = d.DepartmentID;

-- LEFT JOIN
SELECT
    s.StudentID,
    s.Name,
    d.DepartmentName
FROM Students s
LEFT JOIN Departments d
ON s.DepartmentID = d.DepartmentID;

-- RIGHT JOIN
SELECT
    s.StudentID,
    s.Name,
    d.DepartmentName
FROM Students s
RIGHT JOIN Departments d
ON s.DepartmentID = d.DepartmentID;

-- CROSS JOIN
SELECT
    s.Name,
    d.DepartmentName
FROM Students s
CROSS JOIN Departments d;

-- SELF JOIN
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    ManagerID INT
);

INSERT INTO Employees VALUES
(1, 'John', NULL),
(2, 'Alice', 1),
(3, 'Bob', 1),
(4, 'Charlie', 2),
(5, 'David', 2);

SELECT
    e.EmployeeName AS Employee,
    m.EmployeeName AS Manager
FROM Employees e
LEFT JOIN Employees m
ON e.ManagerID = m.EmployeeID;

-- Students of the Computer Science department
SELECT
    s.Name,
    d.DepartmentName
FROM Students s
INNER JOIN Departments d
ON s.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';

-- Count students in each department
SELECT
    d.DepartmentName,
    COUNT(s.StudentID) AS TotalStudents
FROM Departments d
LEFT JOIN Students s
ON d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentName;
