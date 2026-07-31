CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Age INT,
    CGPA DECIMAL(3,2)
);

INSERT INTO Students VALUES
(1, 'Alice', 'CSE', 21, 3.85),
(2, 'Bob', 'Software Engineering', 22, 3.72),
(3, 'Charlie', 'EEE', 20, 3.60),
(4, 'David', 'BBA', 23, 3.45),
(5, 'Eva', 'CSE', 21, 3.95),
(6, 'Frank', 'EEE', 22, 3.50),
(7, 'Grace', 'BBA', 20, 3.80),
(8, 'Henry', 'CSE', 22, 3.70),
(9, 'Ivy', 'Software Engineering', 21, 3.90);

SELECT * FROM Students;

-- Number of students in each department
SELECT Department, COUNT(*) AS TotalStudents
FROM Students
GROUP BY Department;

-- Average CGPA of each department
SELECT Department, AVG(CGPA) AS AverageCGPA
FROM Students
GROUP BY Department;

-- Highest CGPA in each department
SELECT Department, MAX(CGPA) AS HighestCGPA
FROM Students
GROUP BY Department;

-- Lowest CGPA in each department
SELECT Department, MIN(CGPA) AS LowestCGPA
FROM Students
GROUP BY Department;

-- Total age of each department
SELECT Department, SUM(Age) AS TotalAge
FROM Students
GROUP BY Department;

-- Departments having more than 2 students
SELECT Department, COUNT(*) AS TotalStudents
FROM Students
GROUP BY Department
HAVING COUNT(*) > 2;

-- Departments with average CGPA greater than 3.70
SELECT Department, AVG(CGPA) AS AverageCGPA
FROM Students
GROUP BY Department
HAVING AVG(CGPA) > 3.70;

-- Departments where the highest CGPA is at least 3.90
SELECT Department, MAX(CGPA) AS HighestCGPA
FROM Students
GROUP BY Department
HAVING MAX(CGPA) >= 3.90;

-- Display grouped results in alphabetical order
SELECT Department, COUNT(*) AS TotalStudents
FROM Students
GROUP BY Department
ORDER BY Department;
