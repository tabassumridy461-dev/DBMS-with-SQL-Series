CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    CGPA DECIMAL(3,2)
);

INSERT INTO Students VALUES
(1, 'Alice', 'CSE', 3.85),
(2, 'Bob', 'Software Engineering', 3.72),
(3, 'Charlie', 'EEE', 3.60),
(4, 'David', 'BBA', 3.45),
(5, 'Eva', 'CSE', 3.95);

SELECT * FROM Students;

-- Start a transaction
START TRANSACTION;

UPDATE Students
SET CGPA = 3.90
WHERE StudentID = 2;

UPDATE Students
SET Department = 'Computer Science'
WHERE StudentID = 1;

SELECT * FROM Students;

-- Save the current state
SAVEPOINT SavePoint1;

UPDATE Students
SET CGPA = 3.50
WHERE StudentID = 5;

DELETE FROM Students
WHERE StudentID = 4;

SELECT * FROM Students;

-- Rollback to the savepoint
ROLLBACK TO SavePoint1;

SELECT * FROM Students;

-- Make the changes permanent
COMMIT;

SELECT * FROM Students;

-- Start another transaction
START TRANSACTION;

INSERT INTO Students VALUES
(6, 'Frank', 'EEE', 3.75);

INSERT INTO Students VALUES
(7, 'Grace', 'BBA', 3.80);

SELECT * FROM Students;

-- Undo the entire transaction
ROLLBACK;

SELECT * FROM Students;

-- Start a new transaction
START TRANSACTION;

UPDATE Students
SET CGPA = 4.00
WHERE StudentID = 1;

COMMIT;

SELECT * FROM Students;
