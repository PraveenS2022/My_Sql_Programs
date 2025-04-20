Create database bike;
create table bikes_detail (bike_name varchar(50),bike_num int, bike_engineNo varchar(10));
select *from bikes_detail;
CREATE DATABASE COLLEGE;
USE COLLEGE;
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    dob DATE,
    gender VARCHAR(10),
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(10)
);
ALTER TABLE Students
ADD nationality VARCHAR(50),
ADD guardian_name VARCHAR(100),
ADD blood_group VARCHAR(5),
ADD is_hosteler BOOLEAN;

ALTER TABLE Students
RENAME COLUMN phone TO contact_number,
RENAME COLUMN dob TO date_of_birth,
RENAME COLUMN city TO hometown,
RENAME COLUMN is_hosteler TO hostel_resident;

ALTER TABLE Students
MODIFY name VARCHAR(150),
MODIFY nationality VARCHAR(30),
MODIFY zip_code VARCHAR(15),
MODIFY guardian_name VARCHAR(150);


CREATE DATABASE BRANCH;
USE BRANCH;
CREATE TABLE Courses (
    course_id INT,
    course_name VARCHAR(100),
    description TEXT,
    credits INT,
    department VARCHAR(50),
    level VARCHAR(20),
    duration_weeks INT,
    start_date DATE,
    end_date DATE,
    instructor_id INT
);
ALTER TABLE Courses
ADD course_type VARCHAR(30),
ADD prerequisite VARCHAR(100),
ADD syllabus_link TEXT,
ADD course_language VARCHAR(50);

ALTER TABLE Courses
RENAME COLUMN description TO course_description,
RENAME COLUMN department TO dept_name,
RENAME COLUMN level TO course_level,
RENAME COLUMN start_date TO begin_date;

ALTER TABLE Courses
MODIFY credits TINYINT,
MODIFY duration_weeks SMALLINT,
MODIFY course_type VARCHAR(20),
MODIFY prerequisite VARCHAR(150);



CREATE DATABASE COMPANY;
USE COMPANY;
CREATE TABLE Instructors (
    instructor_id INT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    dob DATE,
    hire_date DATE,
    salary DECIMAL(10,2),
    department VARCHAR(50),
    designation VARCHAR(50),
    experience_years INT
);
ALTER TABLE Instructors
ADD highest_qualification VARCHAR(100),
ADD marital_status VARCHAR(20),
ADD office_location VARCHAR(100),
ADD specialization VARCHAR(100);

ALTER TABLE Instructors
RENAME COLUMN dob TO birth_date,
RENAME COLUMN hire_date TO joining_date,
RENAME COLUMN salary TO monthly_salary,
RENAME COLUMN designation TO job_title;

ALTER TABLE Instructors
MODIFY experience_years SMALLINT,
MODIFY office_location VARCHAR(150),
MODIFY specialization TEXT,
MODIFY monthly_salary DECIMAL(12,2);


CREATE DATABASE EMPLOYEE;
USE EMPLOYEE;
CREATE TABLE Enrollments (
    enrollment_id INT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    status VARCHAR(20),
    grade VARCHAR(5),
    semester VARCHAR(10),
    year INT,
    fee_paid DECIMAL(10,2),
    attendance_percent DECIMAL(5,2)
);
ALTER TABLE Enrollments
ADD remarks TEXT,
ADD exam_date DATE,
ADD project_score INT,
ADD is_certified BOOLEAN;

ALTER TABLE Enrollments
RENAME COLUMN status TO enrollment_status,
RENAME COLUMN grade TO final_grade,
RENAME COLUMN semester TO sem,
RENAME COLUMN year TO academic_year;

ALTER TABLE Enrollments
MODIFY project_score TINYINT,
MODIFY attendance_percent DECIMAL(6,2),
MODIFY remarks VARCHAR(200),
MODIFY final_grade VARCHAR(10);



CREATE DATABASE GPAY;
USE GPAY;
CREATE TABLE Payments (
    payment_id INT,
    student_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    method VARCHAR(20),
    status VARCHAR(20),
    transaction_id VARCHAR(100),
    bank_name VARCHAR(100),
    account_no VARCHAR(20),
    ifsc_code VARCHAR(20)
);
ALTER TABLE Payments
ADD payment_mode VARCHAR(30),
ADD receipt_no VARCHAR(50),
ADD processed_by VARCHAR(100),
ADD penalty_fee DECIMAL(10,2);

ALTER TABLE Payments
RENAME COLUMN payment_date TO date_of_payment,
RENAME COLUMN method TO payment_method,
RENAME COLUMN account_no TO account_number,
RENAME COLUMN ifsc_code TO ifsc;

ALTER TABLE Payments
MODIFY amount DECIMAL(12,2),
MODIFY transaction_id VARCHAR(150),
MODIFY receipt_no VARCHAR(70),
MODIFY processed_by VARCHAR(150);

SELECT * FROM COLLEGE.Students;
SELECT * FROM BRANCH.Courses;
SELECT * FROM COMPANY.Instructors;
SELECT * FROM EMPLOYEE.Enrollments;
SELECT * FROM GPAY.Payments;

