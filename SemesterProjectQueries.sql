-- Query #1
SELECT DISTINCT
    e.Personal_ID,
    p.FirstName,
    p.LastName
FROM Interview i
JOIN Person p ON i.Interviewer_ID = p.Personal_ID
JOIN Employee e ON i.Interviewer_ID = e.Personal_ID
JOIN Person p2 ON i.Interviewee_ID = p2.Personal_ID
WHERE p2.FirstName = 'Hellen'
  AND p2.LastName = 'Cole'
  AND i.JobID = 11111;
  
-- Query #2
SELECT j.JobID
FROM JobPosition j
JOIN Department d ON j.DeptID = d.DeptID
WHERE d.DeptName = 'Marketing'
  AND j.PostedDate >= '2011-01-01'
  AND j.PostedDate < '2011-02-01';

-- Query #3
SELECT
    e.Personal_ID,
    p.FirstName,
    p.LastName
FROM Employee e
JOIN Person p ON e.Personal_ID = p.Personal_ID
WHERE e.Personal_ID NOT IN (
    SELECT DISTINCT Supervisor_ID
    FROM Employee
    WHERE Supervisor_ID IS NOT NULL
);

-- Query #4
SELECT
    ms.SiteID,
    ms.Location
FROM MarketingSite ms
WHERE ms.SiteID NOT IN (
    SELECT DISTINCT SiteID
    FROM Sale
    WHERE SaleTime >= '2011-03-01'
      AND SaleTime < '2011-04-01'
);

-- Query #5
SELECT
    j.JobID,
    j.Description
FROM JobPosition j
WHERE j.JobID NOT IN (
    SELECT i.JobID
    FROM Interview i
    WHERE i.Grade > 60
    GROUP BY i.JobID, i.Interviewee_ID
    HAVING AVG(i.Grade) > 70
       AND COUNT(*) >= 5
)
AND j.PostedDate < DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- Query #6
SELECT
    e.Personal_ID,
    p.FirstName,
    p.LastName
FROM Employee e
JOIN Person p ON e.Personal_ID = p.Personal_ID
WHERE NOT EXISTS (
    SELECT pr.ProductID
    FROM Product pr
    WHERE pr.ListPrice > 200
    AND pr.ProductID NOT IN (
        SELECT s.ProductID
        FROM Sale s
        WHERE s.Salesman_ID = e.Personal_ID
    )
);

-- Query #7
SELECT
    d.DeptID,
    d.DeptName
FROM Department d
WHERE d.DeptID NOT IN (
    SELECT DISTINCT j.DeptID
    FROM JobPosition j
    WHERE j.PostedDate >= '2011-01-01'
      AND j.PostedDate <= '2011-02-01'
);

-- Query #8
SELECT
    e.Personal_ID,
    p.FirstName,
    p.LastName,
    wf.DeptID
FROM Candidate c
JOIN Employee e ON c.Personal_ID = e.Personal_ID
JOIN Person p ON e.Personal_ID = p.Personal_ID
JOIN Works_For wf ON e.Personal_ID = wf.Personal_ID
WHERE c.JobID = 12345;

-- Query #9
SELECT
    p.ProductType,
    COUNT(*) AS TotalSold
FROM Sale s
JOIN Product p ON s.ProductID = p.ProductID
GROUP BY p.ProductType
ORDER BY TotalSold DESC
LIMIT 1;

-- Query #10
SELECT
    p.ProductType,
    SUM(p.ListPrice) - SUM(v4.PartCost) AS NetProfit
FROM Sale s
JOIN Product p ON s.ProductID = p.ProductID
JOIN View4 v4 ON s.ProductID = v4.ProductID
GROUP BY p.ProductType
ORDER BY NetProfit DESC
LIMIT 1;

-- Query #11
SELECT
    e.Personal_ID,
    p.FirstName,
    p.LastName
FROM Employee e
JOIN Person p ON e.Personal_ID = p.Personal_ID
WHERE NOT EXISTS (
    SELECT d.DeptID
    FROM Department d
    WHERE d.DeptID NOT IN (
        SELECT wf.DeptID
        FROM Works_For wf
        WHERE wf.Personal_ID = e.Personal_ID
    )
);

-- Query #12
SELECT
    p.FirstName,
    p.LastName,
    p.Email
FROM Interview i
JOIN Person p ON i.Interviewee_ID = p.Personal_ID
WHERE i.Grade > 60
GROUP BY i.Interviewee_ID, i.JobID, p.FirstName, p.LastName, p.Email
HAVING AVG(i.Grade) > 70
   AND COUNT(*) >= 5;

-- Query #13
SELECT
    p.FirstName,
    p.LastName,
    p.Email,
    ph.PhoneNumber,
    i.JobID
FROM Interview i
JOIN Person p ON i.Interviewee_ID = p.Personal_ID
JOIN PhoneNumber ph ON i.Interviewee_ID = ph.Personal_ID
WHERE i.Grade > 60
GROUP BY i.Interviewee_ID, i.JobID, p.FirstName, p.LastName, p.Email, ph.PhoneNumber
HAVING AVG(i.Grade) > 70
   AND COUNT(*) >= 5;

-- Query #14
SELECT
    e.Personal_ID,
    p.FirstName,
    p.LastName,
    AVG(s.Amount) AS AvgMonthlySalary
FROM Employee e
JOIN Person p ON e.Personal_ID = p.Personal_ID
JOIN Salary s ON e.Personal_ID = s.Personal_ID
GROUP BY e.Personal_ID, p.FirstName, p.LastName
ORDER BY AvgMonthlySalary DESC
LIMIT 1;

-- Query #15
SELECT
    v.VendorID,
    v.Name
FROM Vendor v
JOIN Supply s ON v.VendorID = s.VendorID
JOIN Part pt ON s.PartType = pt.PartType
WHERE pt.PartType = 'Cup'
  AND pt.Weight < 4
  AND s.Price = (
    SELECT MIN(s2.Price)
    FROM Supply s2
    JOIN Part pt2 ON s2.PartType = pt2.PartType
    WHERE pt2.PartType = 'Cup'
      AND pt2.Weight < 4
  );
