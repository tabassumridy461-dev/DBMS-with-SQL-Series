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
(5, 'Eva', 'CSE', 21, 3.95);

SELECT * FROM Students;

SELECT Name, CGPA
FROM Students;

SELECT *
FROM Students
WHERE Department = 'CSE';

SELECT *
FROM Students
WHERE Age > 21;

SELECT *
FROM Students
WHERE CGPA >= 3.70;

SELECT *
FROM Students
ORDER BY Name ASC;

SELECT *
FROM Students
ORDER BY CGPA DESC;

SELECT *
FROM Students
LIMIT 3;

SELECT DISTINCT Department
FROM Students;
