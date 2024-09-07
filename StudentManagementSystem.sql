CREATE DATABASE HotelManagementSystem;
use hotelmanagementsystem;

-- create table students
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    enrollment_date DATE
);

-- Insert data students
INSERT INTO Students (first_name, last_name, date_of_birth, gender, email, phone_number, enrollment_date)
VALUES 
('John', 'Doe', '2000-01-15', 'Male', 'john.doe@example.com', '555-1234', '2023-08-01'),
('Jane', 'Smith', '2001-03-22', 'Female', 'jane.smith@example.com', '555-5678', '2023-08-01'),
('Mohammad', 'Ali', '1999-07-18', 'Male', 'mohammad.ali@example.com', '555-9876', '2023-08-01'),
('Priya', 'Sharma', '2002-12-30', 'Female', 'priya.sharma@example.com', '555-4321', '2023-08-01'),
('Rahul', 'Verma', '2001-09-10', 'Male', 'rahul.verma@example.com', '555-6789', '2023-08-01'),
('Aisha', 'Khan', '2003-04-15', 'Female', 'aisha.khan@example.com', '555-1111', '2023-08-01'),
('David', 'Johnson', '2000-11-25', 'Male', 'david.johnson@example.com', '555-2222', '2023-08-01'),
('Meera', 'Patel', '2002-05-05', 'Female', 'meera.patel@example.com', '555-3333', '2023-08-01'),
('Vikram', 'Singh', '1998-02-18', 'Male', 'vikram.singh@example.com', '555-4444', '2023-08-01'),
('Sara', 'Wilson', '2001-06-20', 'Female', 'sara.wilson@example.com', '555-5555', '2023-08-01');

-- Create table named 'Courses'
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(10) UNIQUE NOT NULL,
    credits INT NOT NULL,
    instructor_name VARCHAR(100)
);

-- Insert data into courses
INSERT INTO Courses (course_name, course_code, credits, instructor_name)
VALUES 
('Database Management Systems', 'CS101', 4, 'Dr. Smith'),
('Operating Systems', 'CS102', 3, 'Dr. Johnson'),
('Java','CS103',4,'Dr. Swetha');

-- create table named enrollments
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

-- Insert sample enrollments
INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES 
(1, 1, '2023-08-15'),
(2, 2, '2023-08-16');

CREATE TABLE Grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

-- Insert sample grades
INSERT INTO Grades (student_id, course_id, grade)
VALUES 
(1, 1, 'A'),
(2, 2, 'B');

CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    attendance_date DATE,
    status ENUM('Present', 'Absent', 'Late'),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

-- Insert sample attendance
INSERT INTO Attendance (student_id, course_id, attendance_date, status)
VALUES 
(1, 1, '2023-09-01', 'Present'),
(2, 2, '2023-09-01', 'Absent');

/*QUERIES*/

-- 1.Query all students enrolled in a specific course 
SELECT s.first_name, s.last_name, c.course_name
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Database Management Systems';

-- 2.Query students with grades in a specific course
SELECT s.first_name, s.last_name, g.grade, c.course_name
FROM Grades g
JOIN Students s ON g.student_id = s.student_id
JOIN Courses c ON g.course_id = c.course_id
WHERE c.course_name = 'Operating Systems';

-- 3.Query attendance records for a student 
SELECT s.first_name, s.last_name, c.course_name, a.attendance_date, a.status
FROM Attendance a
JOIN Students s ON a.student_id = s.student_id
JOIN Courses c ON a.course_id = c.course_id
WHERE s.student_id = 1;








