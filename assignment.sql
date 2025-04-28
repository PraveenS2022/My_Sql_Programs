
-- 1. CREATE 5 Tables With 10 Columns Each
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(10)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    department_id INT,
    credits INT,
    semester VARCHAR(20),
    year_offered INT,
    course_level VARCHAR(20),
    instructor_id INT,
    schedule VARCHAR(50),
    location VARCHAR(100)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade VARCHAR(2),
    status VARCHAR(20),
    remarks VARCHAR(255),
    semester VARCHAR(20),
    year INT,
    fees_paid BOOLEAN
);

CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    email VARCHAR(100),
    phone VARCHAR(15),
    department_id INT,
    salary DECIMAL(10,2),
    address VARCHAR(255),
    qualification VARCHAR(100)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    building VARCHAR(50),
    budget DECIMAL(15,2),
    head_of_department VARCHAR(100),
    established_year INT,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    num_of_faculty INT,
    website VARCHAR(100)
);

-- 2. ALTER TABLE - ADD 4 Columns
ALTER TABLE students ADD COLUMN nationality VARCHAR(50);
ALTER TABLE students ADD COLUMN blood_group VARCHAR(5);
ALTER TABLE students ADD COLUMN guardian_name VARCHAR(100);
ALTER TABLE students ADD COLUMN guardian_phone VARCHAR(15);

ALTER TABLE courses ADD COLUMN course_description TEXT;
ALTER TABLE courses ADD COLUMN course_prerequisites VARCHAR(255);
ALTER TABLE courses ADD COLUMN course_duration INT;
ALTER TABLE courses ADD COLUMN mode_of_delivery VARCHAR(50);

ALTER TABLE enrollments ADD COLUMN attendance_percentage DECIMAL(5,2);
ALTER TABLE enrollments ADD COLUMN feedback_score DECIMAL(3,2);
ALTER TABLE enrollments ADD COLUMN certificate_issued BOOLEAN;
ALTER TABLE enrollments ADD COLUMN scholarship_awarded BOOLEAN;

ALTER TABLE teachers ADD COLUMN experience_years INT;
ALTER TABLE teachers ADD COLUMN specialization VARCHAR(100);
ALTER TABLE teachers ADD COLUMN office_room VARCHAR(20);
ALTER TABLE teachers ADD COLUMN is_tenured BOOLEAN;

ALTER TABLE departments ADD COLUMN accreditation_status VARCHAR(50);
ALTER TABLE departments ADD COLUMN ranking INT;
ALTER TABLE departments ADD COLUMN research_budget DECIMAL(15,2);
ALTER TABLE departments ADD COLUMN num_of_students INT;

-- 3. ALTER TABLE - DROP 1 Column
ALTER TABLE students DROP COLUMN guardian_phone;
ALTER TABLE courses DROP COLUMN mode_of_delivery;
ALTER TABLE enrollments DROP COLUMN scholarship_awarded;
ALTER TABLE teachers DROP COLUMN is_tenured;
ALTER TABLE departments DROP COLUMN ranking;

-- 4. ALTER TABLE - RENAME 4 Columns
ALTER TABLE students RENAME COLUMN dob TO date_of_birth;
ALTER TABLE students RENAME COLUMN phone TO mobile_number;
ALTER TABLE students RENAME COLUMN zip_code TO postal_code;
ALTER TABLE students RENAME COLUMN nationality TO country;

ALTER TABLE courses RENAME COLUMN credits TO credit_hours;
ALTER TABLE courses RENAME COLUMN location TO classroom_location;
ALTER TABLE courses RENAME COLUMN schedule TO course_schedule;
ALTER TABLE courses RENAME COLUMN course_level TO level_of_course;

ALTER TABLE enrollments RENAME COLUMN grade TO final_grade;
ALTER TABLE enrollments RENAME COLUMN semester TO term;
ALTER TABLE enrollments RENAME COLUMN status TO enrollment_status;
ALTER TABLE enrollments RENAME COLUMN remarks TO enrollment_remarks;

ALTER TABLE teachers RENAME COLUMN salary TO monthly_salary;
ALTER TABLE teachers RENAME COLUMN address TO residential_address;
ALTER TABLE teachers RENAME COLUMN phone TO contact_number;
ALTER TABLE teachers RENAME COLUMN hire_date TO date_of_joining;

ALTER TABLE departments RENAME COLUMN budget TO department_budget;
ALTER TABLE departments RENAME COLUMN head_of_department TO hod_name;
ALTER TABLE departments RENAME COLUMN established_year TO founding_year;
ALTER TABLE departments RENAME COLUMN contact_number TO dept_contact_number;

-- 5. ALTER TABLE - MODIFY 4 Columns (datatype or size changes)
ALTER TABLE students MODIFY COLUMN email VARCHAR(150);
ALTER TABLE students MODIFY COLUMN address VARCHAR(300);
ALTER TABLE students MODIFY COLUMN city VARCHAR(100);
ALTER TABLE students MODIFY COLUMN state VARCHAR(100);

ALTER TABLE courses MODIFY COLUMN course_name VARCHAR(150);
ALTER TABLE courses MODIFY COLUMN year_offered YEAR;
ALTER TABLE courses MODIFY COLUMN department_id BIGINT;
ALTER TABLE courses MODIFY COLUMN instructor_id BIGINT;

ALTER TABLE enrollments MODIFY COLUMN enrollment_date DATETIME;
ALTER TABLE enrollments MODIFY COLUMN year YEAR;
ALTER TABLE enrollments MODIFY COLUMN final_grade VARCHAR(5);
ALTER TABLE enrollments MODIFY COLUMN fees_paid TINYINT(1);

ALTER TABLE teachers MODIFY COLUMN email VARCHAR(150);
ALTER TABLE teachers MODIFY COLUMN qualification VARCHAR(150);
ALTER TABLE teachers MODIFY COLUMN department_id BIGINT;
ALTER TABLE teachers MODIFY COLUMN experience_years SMALLINT;

ALTER TABLE departments MODIFY COLUMN department_name VARCHAR(150);
ALTER TABLE departments MODIFY COLUMN building VARCHAR(100);
ALTER TABLE departments MODIFY COLUMN department_budget DECIMAL(18,2);
ALTER TABLE departments MODIFY COLUMN research_budget DECIMAL(18,2);
