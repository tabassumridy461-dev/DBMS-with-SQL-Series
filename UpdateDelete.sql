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

UPDATE Students
SET CGPA = 3.90
WHERE StudentID = 2;

SELECT * FROM Students;

UPDATE Students
SET Department = 'Computer Science'
WHERE Department = 'CSE';

SELECT * FROM Students;

UPDATE Students
SET Age = Age + 1
WHERE StudentID = 3;

SELECT * FROM Students;

DELETE FROM Students
WHERE StudentID = 4;

SELECT * FROM Students;

DELETE FROM Students
WHERE CGPA < 3.70;

SELECT * FROM Students;
