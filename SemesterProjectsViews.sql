SHOW TABLES;

-- #1
CREATE VIEW View1 AS
SELECT 
    e.Personal_ID,
    p.FirstName,
    p.LastName,
    AVG(s.Amount) AS AvgMonthlySalary
FROM Employee e
JOIN Person p ON e.Personal_ID = p.Personal_ID
JOIN Salary s ON e.Personal_ID = s.Personal_ID
GROUP BY e.Personal_ID, p.FirstName, p.LastName;

-- #2
CREATE VIEW View2 AS
SELECT
    i.Interviewee_ID,
    p.FirstName,
    p.LastName,
    i.JobID,
    COUNT(*) AS RoundsPassed
FROM Interview i
JOIN Person p ON i.Interviewee_ID = p.Personal_ID
WHERE i.Grade > 60
GROUP BY i.Interviewee_ID, p.FirstName, p.LastName, i.JobID;

-- #3
CREATE VIEW View3 AS
SELECT
    p.ProductType,
    COUNT(*) AS ItemsSold
FROM Sale s
JOIN Product p ON s.ProductID = p.ProductID
GROUP BY p.ProductType;

-- #4
CREATE VIEW View4 AS
SELECT
    pr.ProductID,
    p.ProductType,
    SUM(s.Price * pr.Qty) AS PartCost
FROM Produce pr
JOIN Part pt ON pr.PartType = pt.PartType
JOIN Supply s ON pr.PartType = s.PartType
JOIN Product p ON pr.ProductID = p.ProductID
GROUP BY pr.ProductID, p.ProductType;
