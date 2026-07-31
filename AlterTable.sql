CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Age INT
);

INSERT INTO Students VALUES
(1, 'Alice', 'CSE', 21),
(2, 'Bob', 'Software Engineering', 22),
(3, 'Charlie', 'EEE', 20);

SELECT * FROM Students;

-- Add a new column
ALTER TABLE Students
ADD CGPA DECIMAL(3,2);

SELECT * FROM Students;

-- Update the new column
UPDATE Students
SET CGPA = 3.85
WHERE StudentID = 1;

UPDATE Students
SET CGPA = 3.72
WHERE StudentID = 2;

UPDATE Students
SET CGPA = 3.60
WHERE StudentID = 3;

SELECT * FROM Students;

-- Rename a column
ALTER TABLE Students
RENAME COLUMN Name TO StudentName;

SELECT * FROM Students;

-- Change the data type of a column
ALTER TABLE Students
MODIFY Department VARCHAR(100);

-- Add a new column with a default value
ALTER TABLE Students
ADD City VARCHAR(50) DEFAULT 'Dhaka';

SELECT * FROM Students;

-- Drop a column
ALTER TABLE Students
DROP COLUMN City;

SELECT * FROM Students;

-- Rename the table
ALTER TABLE Students
RENAME TO UniversityStudents;

SELECT * FROM UniversityStudents;
