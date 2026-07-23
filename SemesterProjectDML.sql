USE company;

INSERT INTO Person (Personal_ID, LastName, FirstName, Age, Gender, AddLine1, AddLine2, City, State, Zip, Email) VALUES
(1,  'Smith',    'John',    35, 'M', '123 Main St',     NULL, 'Dallas',     'TX', '75201', 'john.smith@company.com'),
(2,  'Johnson',  'Sarah',   28, 'F', '456 Oak Ave',     NULL, 'Dallas',     'TX', '75202', 'sarah.johnson@company.com'),
(3,  'Cole',     'Hellen',  30, 'F', '789 Pine Rd',     NULL, 'Dallas',     'TX', '75203', 'hellen.cole@email.com'),
(4,  'Williams', 'Mike',    45, 'M', '101 Elm St',      NULL, 'Plano',      'TX', '75024', 'mike.williams@company.com'),
(5,  'Brown',    'Lisa',    32, 'F', '202 Cedar Ln',    NULL, 'Frisco',     'TX', '75034', 'lisa.brown@company.com'),
(6,  'Davis',    'James',   50, 'M', '303 Birch Blvd',  NULL, 'McKinney',   'TX', '75070', 'james.davis@company.com'),
(7,  'Miller',   'Emily',   27, 'F', '404 Walnut Dr',   NULL, 'Allen',      'TX', '75002', 'emily.miller@email.com'),
(8,  'Wilson',   'Robert',  40, 'M', '505 Maple Ave',   NULL, 'Garland',    'TX', '75040', 'robert.wilson@company.com'),
(9,  'Moore',    'Karen',   38, 'F', '606 Spruce St',   NULL, 'Irving',     'TX', '75061', 'karen.moore@company.com'),
(10, 'Taylor',   'David',   29, 'M', '707 Ash Ct',      NULL, 'Arlington',  'TX', '76001', 'david.taylor@email.com'),
(11, 'Anderson', 'Jessica', 33, 'F', '808 Poplar Way',  NULL, 'Fort Worth', 'TX', '76101', 'jessica.anderson@company.com'),
(12, 'Thomas',   'Chris',   42, 'M', '909 Hickory Rd',  NULL, 'Mesquite',   'TX', '75149', 'chris.thomas@company.com'),
(13, 'Jackson',  'Amanda',  25, 'F', '111 Sycamore St', NULL, 'Carrollton', 'TX', '75006', 'amanda.jackson@email.com'),
(14, 'White',    'Daniel',  55, 'M', '222 Magnolia Dr', NULL, 'Richardson', 'TX', '75080', 'daniel.white@company.com'),
(15, 'Harris',   'Megan',   31, 'F', '333 Chestnut Ave',NULL, 'Denton',     'TX', '76201', 'megan.harris@company.com');

INSERT INTO PhoneNumber (Personal_ID, PhoneNumber) VALUES
(1,  '214-555-0101'),
(2,  '214-555-0102'),
(3,  '214-555-0103'),
(3,  '214-555-0199'),
(4,  '972-555-0104'),
(5,  '972-555-0105'),
(6,  '972-555-0106'),
(7,  '972-555-0107'),
(8,  '214-555-0108'),
(9,  '214-555-0109'),
(10, '817-555-0110'),
(11, '817-555-0111'),
(12, '972-555-0112'),
(13, '972-555-0113'),
(14, '972-555-0114'),
(15, '940-555-0115');

INSERT INTO Employee (Personal_ID, `Rank`, Title, Supervisor_ID) VALUES
(1,  'Executive', 'CEO',       1),
(2,  'Senior',    'Manager',   1),
(4,  'Senior',    'Director',  1),
(5,  'Mid',       'Engineer',  2),
(6,  'Executive', 'Principal', 1),
(8,  'Mid',       'Analyst',   2),
(9,  'Mid',       'Engineer',  4),
(11, 'Junior',    'Associate', 2),
(12, 'Senior',    'Partner',   6),
(14, 'Executive', 'Director',  1),
(15, 'Junior',    'Associate', 4);

INSERT INTO Customer (Personal_ID, PrefSalesman_ID) VALUES
(3,  5),
(7,  8),
(10, 11),
(13, 5);

INSERT INTO PotentialEmployee (Personal_ID) VALUES
(3),
(7),
(10),
(13);

INSERT INTO Department (DeptID, DeptName) VALUES
(1, 'Marketing'),
(2, 'Engineering'),
(3, 'Sales'),
(4, 'Human Resources'),
(5, 'Finance');

INSERT INTO Works_For (Personal_ID, DeptID, StartTime, EndTime) VALUES
(1,  1, '2015-01-01 09:00:00', NULL),
(1,  2, '2010-01-01 09:00:00', '2014-12-31 17:00:00'),
(1,  3, '2008-01-01 09:00:00', '2009-12-31 17:00:00'),
(1,  4, '2006-01-01 09:00:00', '2007-12-31 17:00:00'),
(1,  5, '2004-01-01 09:00:00', '2005-12-31 17:00:00'),
(2,  1, '2018-06-01 09:00:00', NULL),
(4,  2, '2016-03-15 09:00:00', NULL),
(5,  2, '2019-07-01 09:00:00', NULL),
(6,  3, '2014-09-01 09:00:00', NULL),
(8,  3, '2020-01-15 09:00:00', NULL),
(9,  2, '2021-04-01 09:00:00', NULL),
(11, 1, '2022-08-01 09:00:00', NULL),
(12, 3, '2017-11-01 09:00:00', NULL),
(14, 4, '2013-05-01 09:00:00', NULL),
(15, 2, '2023-01-10 09:00:00', NULL);

INSERT INTO Salary (Personal_ID, TransactionNum, PayDate, Amount) VALUES
(1,  1, '2024-01-31', 12000.00),
(1,  2, '2024-02-29', 12000.00),
(1,  3, '2024-03-31', 12000.00),
(2,  1, '2024-01-31', 7500.00),
(2,  2, '2024-02-29', 7500.00),
(2,  3, '2024-03-31', 7500.00),
(4,  1, '2024-01-31', 9000.00),
(4,  2, '2024-02-29', 9000.00),
(4,  3, '2024-03-31', 9000.00),
(5,  1, '2024-01-31', 6000.00),
(5,  2, '2024-02-29', 6000.00),
(5,  3, '2024-03-31', 6000.00),
(6,  1, '2024-01-31', 11000.00),
(6,  2, '2024-02-29', 11000.00),
(6,  3, '2024-03-31', 11000.00),
(8,  1, '2024-01-31', 5500.00),
(8,  2, '2024-02-29', 5500.00),
(9,  1, '2024-01-31', 5800.00),
(9,  2, '2024-02-29', 5800.00),
(11, 1, '2024-01-31', 4500.00),
(11, 2, '2024-02-29', 4500.00),
(12, 1, '2024-01-31', 8500.00),
(12, 2, '2024-02-29', 8500.00),
(14, 1, '2024-01-31', 10000.00),
(14, 2, '2024-02-29', 10000.00),
(15, 1, '2024-01-31', 4200.00),
(15, 2, '2024-02-29', 4200.00);

INSERT INTO JobPosition (JobID, Description, PostedDate, DeptID) VALUES
(11111, 'Marketing Coordinator',    '2011-01-15', 1),
(12345, 'Software Engineer',        '2011-01-20', 2),
(22222, 'Sales Representative',     '2011-02-01', 3),
(33333, 'HR Specialist',            '2011-03-01', 4),
(44444, 'Financial Analyst',        '2024-01-01', 5),
(55555, 'Senior Marketing Manager', '2024-02-01', 1);

INSERT INTO Candidate (Personal_ID, JobID) VALUES
(3,  11111),
(7,  11111),
(5,  12345),
(8,  12345),
(10, 33333),
(13, 22222),
(9,  44444),
(11, 55555);

INSERT INTO Interview (InterviewID, InterviewTime, Grade, JobID, Interviewee_ID, Interviewer_ID) VALUES
(1,  '2011-02-01 10:00:00', 75, 11111, 3, 2),
(2,  '2011-02-08 10:00:00', 80, 11111, 3, 4),
(3,  '2011-02-15 10:00:00', 72, 11111, 3, 2),
(4,  '2011-02-22 10:00:00', 78, 11111, 3, 4),
(5,  '2011-03-01 10:00:00', 85, 11111, 3, 2),
(6,  '2011-02-01 14:00:00', 55, 11111, 7, 4),
(7,  '2011-02-08 14:00:00', 60, 11111, 7, 2),
(8,  '2011-02-05 10:00:00', 90, 12345, 5, 4),
(9,  '2011-02-12 10:00:00', 85, 12345, 5, 6),
(10, '2011-02-19 10:00:00', 88, 12345, 5, 4),
(11, '2011-02-26 10:00:00', 82, 12345, 5, 6),
(12, '2011-03-05 10:00:00', 84, 12345, 5, 4),
(13, '2011-04-01 10:00:00', 65, 33333, 10, 14),
(14, '2011-04-08 10:00:00', 58, 33333, 10, 14),
(15, '2024-01-15 10:00:00', 70, 44444, 9, 2),
(16, '2024-02-15 10:00:00', 65, 55555, 11, 4);

INSERT INTO MarketingSite (SiteID, Name, Location) VALUES
(1, 'Downtown Dallas', 'Dallas, TX'),
(2, 'Plano North',     'Plano, TX'),
(3, 'Frisco Central',  'Frisco, TX'),
(4, 'Fort Worth West', 'Fort Worth, TX');

INSERT INTO Works_On (Personal_ID, SiteID) VALUES
(2,  1),
(5,  1),
(8,  2),
(9,  3),
(11, 1),
(12, 2),
(15, 4);

INSERT INTO Product (ProductID, ProductType, Size, ListPrice, Weight, Style) VALUES
(1, 'Laptop',     'Medium', 999.99, 3.5, 'Modern'),
(2, 'Tablet',     'Small',  499.99, 1.2, 'Slim'),
(3, 'Monitor',    'Large',  299.99, 5.8, 'Classic'),
(4, 'Keyboard',   'Medium',  79.99, 0.8, 'Ergonomic'),
(5, 'Mouse',      'Small',   49.99, 0.3, 'Wireless'),
(6, 'Headphones', 'Medium', 249.99, 0.4, 'Over-ear'),
(7, 'Speaker',    'Large',  349.99, 2.1, 'Portable');

INSERT INTO Sale (SaleID, SaleTime, Salesman_ID, Customer_ID, ProductID, SiteID) VALUES
(1,  '2011-01-15 10:00:00', 2,  3,  1, 1),
(2,  '2011-01-20 11:00:00', 5,  7,  2, 1),
(3,  '2011-02-10 14:00:00', 2,  10, 3, 1),
(4,  '2011-02-15 15:00:00', 5,  13, 6, 1),
(5,  '2011-03-05 10:00:00', 8,  3,  4, 2),
(6,  '2011-03-10 11:00:00', 12, 7,  5, 2),
(7,  '2011-03-15 14:00:00', 8,  10, 6, 2),
(8,  '2011-03-20 15:00:00', 12, 13, 7, 2),
(9,  '2011-03-01 10:00:00', 9,  3,  1, 3),
(10, '2011-03-08 11:00:00', 9,  7,  2, 3),
(11, '2011-01-10 10:00:00', 15, 3,  3, 4),
(12, '2011-02-20 11:00:00', 15, 7,  4, 4),
(13, '2024-01-05 10:00:00', 2,  3,  6, 1),
(14, '2024-01-06 11:00:00', 2,  7,  7, 1),
(15, '2024-01-07 12:00:00', 5,  10, 1, 1),
(16, '2024-01-08 13:00:00', 5,  13, 3, 1),
(17, '2024-01-09 14:00:00', 2,  3,  2, 1),
(18, '2024-01-10 15:00:00', 5,  7,  7, 1),
(19, '2024-02-01 10:00:00', 2,  10, 1, 1),
(20, '2024-02-02 11:00:00', 5,  13, 1, 1),
(21, '2024-02-03 12:00:00', 8,  3,  1, 2);

INSERT INTO Part (PartType, Weight) VALUES
('Circuit Board', 0.5),
('Battery',       1.2),
('Screen',        2.0),
('Casing',        1.5),
('Cup',           0.8),
('Cable',         0.3),
('Chip',          0.1);

INSERT INTO Vendor (VendorID, Name, Address, AcctNumber, CreditRating, PurchasingWebServiceURL) VALUES
(1, 'TechParts Co',     '100 Supplier Rd, Austin, TX',     'ACC-001', 'A',  'https://techparts.com/api'),
(2, 'GlobalSupply Inc', '200 Vendor Ave, Houston, TX',     'ACC-002', 'B+', 'https://globalsupply.com/api'),
(3, 'QuickParts LLC',   '300 Parts Blvd, San Antonio, TX', 'ACC-003', 'A+', 'https://quickparts.com/api'),
(4, 'BestSource Corp',  '400 Source St, El Paso, TX',      'ACC-004', 'B',  'https://bestsource.com/api');

INSERT INTO Supply (VendorID, PartType, Price) VALUES
(1, 'Circuit Board', 25.00),
(1, 'Battery',       15.00),
(1, 'Cup',            3.50),
(2, 'Screen',        45.00),
(2, 'Casing',        12.00),
(2, 'Cup',            4.20),
(3, 'Circuit Board', 22.00),
(3, 'Chip',           8.00),
(3, 'Cup',            2.99),
(4, 'Battery',       14.00),
(4, 'Cable',          5.00),
(4, 'Cup',            3.75);

INSERT INTO Produce (ProductID, PartType, Qty) VALUES
(1, 'Circuit Board', 2),
(1, 'Battery',       1),
(1, 'Screen',        1),
(1, 'Casing',        1),
(1, 'Chip',          4),
(2, 'Circuit Board', 1),
(2, 'Battery',       1),
(2, 'Screen',        1),
(3, 'Screen',        1),
(3, 'Casing',        1),
(3, 'Cable',         2),
(4, 'Circuit Board', 1),
(4, 'Cable',         1),
(5, 'Circuit Board', 1),
(5, 'Cable',         1),
(6, 'Circuit Board', 1),
(6, 'Cable',         2),
(7, 'Circuit Board', 2),
(7, 'Casing',        1),
(7, 'Cable',         2);


SELECT 'Person' AS TableName, COUNT(*) AS RowCount FROM Person UNION ALL
SELECT 'Employee', COUNT(*) FROM Employee UNION ALL
SELECT 'Customer', COUNT(*) FROM Customer UNION ALL
SELECT 'PotentialEmployee', COUNT(*) FROM PotentialEmployee UNION ALL
SELECT 'Department', COUNT(*) FROM Department UNION ALL
SELECT 'Works_For', COUNT(*) FROM Works_For UNION ALL
SELECT 'Salary', COUNT(*) FROM Salary UNION ALL
SELECT 'JobPosition', COUNT(*) FROM JobPosition UNION ALL
SELECT 'Candidate', COUNT(*) FROM Candidate UNION ALL
SELECT 'Interview', COUNT(*) FROM Interview UNION ALL
SELECT 'MarketingSite', COUNT(*) FROM MarketingSite UNION ALL
SELECT 'Works_On', COUNT(*) FROM Works_On UNION ALL
SELECT 'Product', COUNT(*) FROM Product UNION ALL
SELECT 'Sale', COUNT(*) FROM Sale UNION ALL
SELECT 'Part', COUNT(*) FROM Part UNION ALL
SELECT 'Vendor', COUNT(*) FROM Vendor UNION ALL
SELECT 'Supply', COUNT(*) FROM Supply UNION ALL
SELECT 'Produce', COUNT(*) FROM Produce UNION ALL
SELECT 'PhoneNumber', COUNT(*) FROM PhoneNumber;