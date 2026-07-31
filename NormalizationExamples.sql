CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

-- =====================================================
-- UNF (Unnormalized Form)
-- Multiple subjects stored in a single column
-- =====================================================

CREATE TABLE Student_UNF (
    StudentID INT,
    StudentName VARCHAR(100),
    Subjects VARCHAR(200)
);

INSERT INTO Student_UNF VALUES
(1, 'Alice', 'DBMS, Java, Python'),
(2, 'Bob', 'C, C++, Data Structures');

SELECT * FROM Student_UNF;


-- =====================================================
-- 1NF (First Normal Form)
-- Each cell contains only one value
-- =====================================================

CREATE TABLE Student_1NF (
    StudentID INT,
    StudentName VARCHAR(100),
    Subject VARCHAR(100)
);

INSERT INTO Student_1NF VALUES
(1, 'Alice', 'DBMS'),
(1, 'Alice', 'Java'),
(1, 'Alice', 'Python'),
(2, 'Bob', 'C'),
(2, 'Bob', 'C++'),
(2, 'Bob', 'Data Structures');

SELECT * FROM Student_1NF;


-- =====================================================
-- 2NF (Second Normal Form)
-- Separate student and subject information
-- =====================================================

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100)
);

CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(100)
);

CREATE TABLE StudentSubjects (
    StudentID INT,
    SubjectID INT,
    PRIMARY KEY (StudentID, SubjectID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);

INSERT INTO Students VALUES
(1, 'Alice'),
(2, 'Bob');

INSERT INTO Subjects VALUES
(101, 'DBMS'),
(102, 'Java'),
(103, 'Python'),
(104, 'C'),
(105, 'C++'),
(106, 'Data Structures');

INSERT INTO StudentSubjects VALUES
(1,101),
(1,102),
(1,103),
(2,104),
(2,105),
(2,106);

SELECT * FROM Students;
SELECT * FROM Subjects;
SELECT * FROM StudentSubjects;


-- =====================================================
-- 3NF (Third Normal Form)
-- Department information moved to a separate table
-- =====================================================

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE StudentInfo (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Software Engineering');

INSERT INTO StudentInfo VALUES
(1, 'Alice', 1),
(2, 'Bob', 2);

SELECT * FROM Departments;
SELECT * FROM StudentInfo;


-- =====================================================
-- BCNF (Boyce-Codd Normal Form)
-- Separate teacher-course relationship
-- =====================================================

CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(100)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
);

CREATE TABLE TeacherCourses (
    TeacherID INT,
    CourseID INT,
    PRIMARY KEY (TeacherID, CourseID),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Teachers VALUES
(1, 'Mr. Rahman'),
(2, 'Ms. Akter');

INSERT INTO Courses VALUES
(201, 'Database Systems'),
(202, 'Object Oriented Programming');

INSERT INTO TeacherCourses VALUES
(1,201),
(1,202),
(2,201);

SELECT * FROM Teachers;
SELECT * FROM Courses;
SELECT * FROM TeacherCourses;
