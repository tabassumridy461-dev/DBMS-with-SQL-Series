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
(7, 'Grace', 'BBA', 20, 3.80);

SELECT * FROM Students;

-- COUNT(): Count all students
SELECT COUNT(*) AS TotalStudents
FROM Students;

-- COUNT(): Count students with CGPA
SELECT COUNT(CGPA) AS StudentsWithCGPA
FROM Students;

-- SUM(): Total age of all students
SELECT SUM(Age) AS TotalAge
FROM Students;

-- AVG(): Average CGPA
SELECT AVG(CGPA) AS AverageCGPA
FROM Students;

-- MAX(): Highest CGPA
SELECT MAX(CGPA) AS HighestCGPA
FROM Students;

-- MIN(): Lowest CGPA
SELECT MIN(CGPA) AS LowestCGPA
FROM Students;

-- Average age
SELECT AVG(Age) AS AverageAge
FROM Students;

-- Total CGPA
SELECT SUM(CGPA) AS TotalCGPA
FROM Students;

-- Count students in the CSE department
SELECT COUNT(*) AS CSEStudents
FROM Students
WHERE Department = 'CSE';

-- Highest age
SELECT MAX(Age) AS OldestStudent
FROM Students;

-- Lowest age
SELECT MIN(Age) AS YoungestStudent
FROM Students;
