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

DELIMITER $$

-- Procedure to display all students
CREATE PROCEDURE GetAllStudents()
BEGIN
    SELECT * FROM Students;
END $$

DELIMITER ;

CALL GetAllStudents();

DELIMITER $$

-- Procedure with one input parameter
CREATE PROCEDURE GetStudentByDepartment(IN dept VARCHAR(50))
BEGIN
    SELECT *
    FROM Students
    WHERE Department = dept;
END $$

DELIMITER ;

CALL GetStudentByDepartment('CSE');

DELIMITER $$

-- Procedure with CGPA parameter
CREATE PROCEDURE GetTopStudents(IN minimumCGPA DECIMAL(3,2))
BEGIN
    SELECT *
    FROM Students
    WHERE CGPA >= minimumCGPA;
END $$

DELIMITER ;

CALL GetTopStudents(3.80);

DELIMITER $$

-- Procedure to count total students
CREATE PROCEDURE CountStudents()
BEGIN
    SELECT COUNT(*) AS TotalStudents
    FROM Students;
END $$

DELIMITER ;

CALL CountStudents();

DELIMITER $$

-- Procedure to show students older than a given age
CREATE PROCEDURE GetStudentsByAge(IN studentAge INT)
BEGIN
    SELECT *
    FROM Students
    WHERE Age > studentAge;
END $$

DELIMITER ;

CALL GetStudentsByAge(21);

-- Remove a stored procedure
DROP PROCEDURE IF EXISTS GetStudentsByAge;
