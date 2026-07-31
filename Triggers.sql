CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    CGPA DECIMAL(3,2)
);

CREATE TABLE StudentLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    StudentName VARCHAR(100),
    ActionType VARCHAR(20),
    ActionTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Students VALUES
(1, 'Alice', 'CSE', 3.85),
(2, 'Bob', 'Software Engineering', 3.72),
(3, 'Charlie', 'EEE', 3.60);

SELECT * FROM Students;

DELIMITER $$

-- Trigger before inserting a student
CREATE TRIGGER BeforeStudentInsert
BEFORE INSERT ON Students
FOR EACH ROW
BEGIN
    IF NEW.CGPA > 4.00 THEN
        SET NEW.CGPA = 4.00;
    END IF;
END $$

DELIMITER ;

INSERT INTO Students VALUES
(4, 'David', 'BBA', 4.50);

SELECT * FROM Students;

DELIMITER $$

-- Trigger after inserting a student
CREATE TRIGGER AfterStudentInsert
AFTER INSERT ON Students
FOR EACH ROW
BEGIN
    INSERT INTO StudentLog(StudentID, StudentName, ActionType)
    VALUES(NEW.StudentID, NEW.Name, 'INSERT');
END $$

DELIMITER ;

INSERT INTO Students VALUES
(5, 'Eva', 'CSE', 3.95);

SELECT * FROM StudentLog;

DELIMITER $$

-- Trigger after updating a student
CREATE TRIGGER AfterStudentUpdate
AFTER UPDATE ON Students
FOR EACH ROW
BEGIN
    INSERT INTO StudentLog(StudentID, StudentName, ActionType)
    VALUES(NEW.StudentID, NEW.Name, 'UPDATE');
END $$

DELIMITER ;

UPDATE Students
SET CGPA = 3.90
WHERE StudentID = 2;

SELECT * FROM StudentLog;

DELIMITER $$

-- Trigger after deleting a student
CREATE TRIGGER AfterStudentDelete
AFTER DELETE ON Students
FOR EACH ROW
BEGIN
    INSERT INTO StudentLog(StudentID, StudentName, ActionType)
    VALUES(OLD.StudentID, OLD.Name, 'DELETE');
END $$

DELIMITER ;

DELETE FROM Students
WHERE StudentID = 3;

SELECT * FROM Students;
SELECT * FROM StudentLog;

-- Remove triggers
DROP TRIGGER IF EXISTS BeforeStudentInsert;
DROP TRIGGER IF EXISTS AfterStudentInsert;
DROP TRIGGER IF EXISTS AfterStudentUpdate;
DROP TRIGGER IF EXISTS AfterStudentDelete;
