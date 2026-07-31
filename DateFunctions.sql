CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    AdmissionDate DATE,
    DateOfBirth DATE
);

INSERT INTO Students VALUES
(1, 'Alice', 'CSE', '2024-01-15', '2003-05-20'),
(2, 'Bob', 'Software Engineering', '2023-09-10', '2002-11-12'),
(3, 'Charlie', 'EEE', '2024-02-01', '2004-03-18'),
(4, 'David', 'BBA', '2022-08-25', '2001-07-30'),
(5, 'Eva', 'CSE', '2023-01-05', '2003-12-10');

SELECT * FROM Students;

-- Display the current date
SELECT CURDATE() AS CurrentDate;

-- Display the current date and time
SELECT NOW() AS CurrentDateTime;

-- Display the current year
SELECT YEAR(CURDATE()) AS CurrentYear;

-- Display the current month
SELECT MONTH(CURDATE()) AS CurrentMonth;

-- Display the current day
SELECT DAY(CURDATE()) AS CurrentDay;

-- Display the admission year of each student
SELECT Name,
YEAR(AdmissionDate) AS AdmissionYear
FROM Students;

-- Display the admission month of each student
SELECT Name,
MONTH(AdmissionDate) AS AdmissionMonth
FROM Students;

-- Display the birth day of each student
SELECT Name,
DAY(DateOfBirth) AS BirthDay
FROM Students;

-- Calculate the age of each student
SELECT Name,
TIMESTAMPDIFF(YEAR, DateOfBirth, CURDATE()) AS Age
FROM Students;

-- Calculate how many days have passed since admission
SELECT Name,
DATEDIFF(CURDATE(), AdmissionDate) AS DaysSinceAdmission
FROM Students;

-- Add 30 days to the admission date
SELECT Name,
DATE_ADD(AdmissionDate, INTERVAL 30 DAY) AS NewAdmissionDate
FROM Students;

-- Subtract 1 year from the admission date
SELECT Name,
DATE_SUB(AdmissionDate, INTERVAL 1 YEAR) AS PreviousYearDate
FROM Students;
