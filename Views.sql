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

-- Create a view containing all student information
CREATE VIEW StudentView AS
SELECT
    StudentID,
    Name,
    Department,
    Age,
    CGPA
FROM Students;

-- Display data from the view
SELECT * FROM StudentView;

-- Create a view for CSE students only
CREATE VIEW CSEStudents AS
SELECT
    StudentID,
    Name,
    CGPA
FROM Students
WHERE Department = 'CSE';

-- Display CSE students
SELECT * FROM CSEStudents;

-- Create a view for students with high CGPA
CREATE VIEW TopStudents AS
SELECT
    StudentID,
    Name,
    Department,
    CGPA
FROM Students
WHERE CGPA >= 3.80;

-- Display top students
SELECT * FROM TopStudents;

-- Replace an existing view
CREATE OR REPLACE VIEW StudentSummary AS
SELECT
    Name,
    Department,
    CGPA
FROM Students;

-- Display the new view
SELECT * FROM StudentSummary;

-- Update data through a view
UPDATE StudentSummary
SET CGPA = 3.90
WHERE Name = 'Bob';

-- Check updated data
SELECT * FROM Students;

-- Delete a view
DROP VIEW TopStudents;

-- Show remaining views
SELECT * FROM StudentView;
SELECT * FROM CSEStudents;
SELECT * FROM StudentSummary;
