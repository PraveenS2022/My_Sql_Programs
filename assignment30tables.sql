DROP TABLE IF EXISTS EventSchedule, ReviewLog, ProductInventory, Department, Company;

CREATE TABLE Company (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    founded_year INT,
    headquarters VARCHAR(100),
    industry VARCHAR(50),
    employee_count INT,
    ceo_name VARCHAR(100),
    annual_revenue DECIMAL(15,2),
    public_company BOOLEAN,
    iso_certified BOOLEAN
);

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    company_id INT,
    department_name VARCHAR(100),
    manager_name VARCHAR(100),
    employee_count INT,
    budget DECIMAL(12,2),
    established_year INT,
    floor_number INT,
    remote_allowed BOOLEAN,
    active_status BOOLEAN,
    FOREIGN KEY (company_id) REFERENCES Company(company_id)
);

CREATE TABLE ProductInventory (
    inventory_id INT PRIMARY KEY,
    company_id INT,
    department_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT,
    reorder_level INT,
    supplier_name VARCHAR(100),
    is_active BOOLEAN,
    FOREIGN KEY (company_id) REFERENCES Company(company_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE ReviewLog (
    review_id INT PRIMARY KEY,
    company_id INT,
    department_id INT,
    inventory_id INT,
    review_title VARCHAR(100),
    reviewer_name VARCHAR(100),
    review_score FLOAT,
    review_date DATE,
    feedback TEXT,
    resolved BOOLEAN,
    FOREIGN KEY (company_id) REFERENCES Company(company_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (inventory_id) REFERENCES ProductInventory(inventory_id)
);

CREATE TABLE EventSchedule (
    event_id INT PRIMARY KEY,
    company_id INT,
    department_id INT,
    inventory_id INT,
    review_id INT,
    event_name VARCHAR(100),
    event_type VARCHAR(50),
    event_date DATE,
    duration_hours INT,
    is_successful BOOLEAN,
    FOREIGN KEY (company_id) REFERENCES Company(company_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (inventory_id) REFERENCES ProductInventory(inventory_id),
    FOREIGN KEY (review_id) REFERENCES ReviewLog(review_id)
);

-- Insert 30 rows into Company
INSERT INTO Company VALUES
(1, 'TechNova', 2001, 'New York', 'Software', 5000, 'Alice Johnson', 5000000.00, TRUE, TRUE),
(2, 'InnoSoft', 1998, 'San Francisco', 'IT Services', 3000, 'Bob Smith', 3200000.00, TRUE, TRUE),
(3, 'NextGen', 2010, 'Austin', 'AI', 2000, 'Charlie Lee', 2500000.00, TRUE, FALSE),
(4, 'EcoWave', 2005, 'Seattle', 'Green Tech', 800, 'Diana Green', 1400000.00, FALSE, TRUE),
(5, 'MediCore', 2012, 'Chicago', 'Healthcare', 1200, 'Evan White', 1800000.00, FALSE, TRUE),
(6, 'DataCrux', 2000, 'Boston', 'Data Analytics', 2200, 'Fiona Ray', 2100000.00, TRUE, TRUE),
(7, 'AutoMatrix', 1995, 'Detroit', 'Automotive', 6000, 'George Kane', 6200000.00, TRUE, FALSE),
(8, 'AeroVista', 2008, 'Denver', 'Aerospace', 4000, 'Hannah Blue', 4400000.00, TRUE, TRUE),
(9, 'BioSync', 2015, 'Philadelphia', 'Biotech', 1000, 'Ian Gray', 1700000.00, FALSE, TRUE),
(10, 'SkyLink', 2011, 'Miami', 'Telecom', 1500, 'Julia Fox', 1950000.00, TRUE, TRUE),
(11, 'CloudShift', 2014, 'Dallas', 'Cloud Services', 1800, 'Kyle Reese', 2200000.00, TRUE, TRUE),
(12, 'CyberVault', 2009, 'Atlanta', 'Cybersecurity', 1300, 'Laura Trent', 1650000.00, TRUE, FALSE),
(13, 'GreenSpark', 2006, 'Portland', 'Renewables', 900, 'Mason Holt', 1300000.00, FALSE, TRUE),
(14, 'NanoLabs', 2002, 'Houston', 'Nanotech', 1100, 'Nina Blake', 1600000.00, TRUE, TRUE),
(15, 'FinVerse', 1997, 'Charlotte', 'FinTech', 2800, 'Oscar Dean', 3000000.00, TRUE, TRUE),
(16, 'OceanTech', 2013, 'San Diego', 'Marine Research', 700, 'Paula West', 1200000.00, FALSE, TRUE),
(17, 'AgroPro', 2016, 'Boise', 'AgriTech', 950, 'Quinn Neal', 1250000.00, TRUE, FALSE),
(18, 'SolarEdge', 2007, 'Phoenix', 'Solar Energy', 1050, 'Rita Park', 1450000.00, FALSE, TRUE),
(19, 'EduLink', 2018, 'Raleigh', 'EdTech', 600, 'Sam Young', 980000.00, TRUE, TRUE),
(20, 'UrbanFlow', 2003, 'Baltimore', 'Smart Cities', 1500, 'Tina Cruz', 2100000.00, TRUE, TRUE),
(21, 'AquaSys', 2019, 'Tampa', 'Water Systems', 400, 'Ulysses Kent', 870000.00, FALSE, TRUE),
(22, 'NeoWare', 2017, 'Cleveland', 'Wearables', 950, 'Vera Moon', 1090000.00, TRUE, TRUE),
(23, 'EcoPulse', 2004, 'Nashville', 'Environment', 820, 'Will Power', 990000.00, FALSE, TRUE),
(24, 'QuantumBits', 2010, 'San Jose', 'Quantum Tech', 500, 'Xena Hope', 1120000.00, TRUE, TRUE),
(25, 'GameSphere', 2001, 'Las Vegas', 'Gaming', 2500, 'Yuri Voss', 2500000.00, TRUE, TRUE),
(26, 'MedZone', 2006, 'Orlando', 'MedTech', 1300, 'Zara Faith', 1780000.00, TRUE, TRUE),
(27, 'BitCore', 2008, 'Pittsburgh', 'Blockchain', 1500, 'Alan Light', 1980000.00, TRUE, FALSE),
(28, 'VoltEdge', 2012, 'Salt Lake City', 'Electronics', 1700, 'Bella Noir', 1880000.00, TRUE, TRUE),
(29, 'RoboWorks', 2009, 'Indianapolis', 'Robotics', 2000, 'Chris Elm', 2600000.00, TRUE, TRUE),
(30, 'NeoLearn', 2015, 'Cincinnati', 'E-Learning', 1200, 'Derek Ross', 1500000.00, TRUE, TRUE);

INSERT INTO Department
SELECT company_id, company_id, CONCAT('Dept_', company_id), CONCAT('Mgr_', company_id), 20 + company_id, 100000 + company_id * 1000, 2000 + company_id, 2 + company_id % 5, TRUE, TRUE
FROM Company;

INSERT INTO ProductInventory
SELECT company_id, company_id, company_id, CONCAT('Product_', company_id), 'Category_' || (company_id % 5), 200.0 + company_id, 50 + company_id, 10 + company_id, CONCAT('Supplier_', company_id), TRUE
FROM Company;

INSERT INTO ReviewLog
SELECT company_id, company_id, company_id, company_id, CONCAT('Review_', company_id), CONCAT('Reviewer_', company_id), 4.0 + (company_id % 2), '2024-05-01', 'Looks good.', TRUE
FROM Company;

INSERT INTO EventSchedule
SELECT company_id, company_id, company_id, company_id, company_id, CONCAT('Event_', company_id), 'Training', '2025-06-01', 4 + company_id % 3, TRUE
FROM Company;

SELECT * FROM Company;
SELECT * FROM Department;
SELECT * FROM ProductInventory;
SELECT * FROM ReviewLog;
SELECT * FROM EventSchedule;
