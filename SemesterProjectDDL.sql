-- Omar Bharwani, Nicholas Ackley
create database company;
use company;
show tables;

CREATE TABLE Person (
    Personal_ID     INT             NOT NULL,
    LastName        VARCHAR(50)     NOT NULL,
    FirstName       VARCHAR(50)     NOT NULL,
    Age             INT             NOT NULL CHECK (Age < 65),
    Gender          CHAR(1),
    AddLine1        VARCHAR(100),
    AddLine2        VARCHAR(100),
    City            VARCHAR(50),
    State           CHAR(2),
    Zip             CHAR(10),
    CONSTRAINT PK_Person PRIMARY KEY (Personal_ID)
);

CREATE TABLE PhoneNumber (
    Personal_ID     INT             NOT NULL,
    PhoneNumber     VARCHAR(20)     NOT NULL,
    CONSTRAINT PK_PhoneNumber PRIMARY KEY (Personal_ID, PhoneNumber),
    CONSTRAINT FK_PhoneNumber_Person
        FOREIGN KEY (Personal_ID) REFERENCES Person(Personal_ID)
);

CREATE TABLE Employee (
    Personal_ID     INT             NOT NULL,
    `Rank`          VARCHAR(50),
    Title           VARCHAR(50),
    Supervisor_ID   INT,
    CONSTRAINT PK_Employee PRIMARY KEY (Personal_ID),
    CONSTRAINT FK_Employee_Person
        FOREIGN KEY (Personal_ID) REFERENCES Person(Personal_ID),
    CONSTRAINT FK_Employee_Supervisor
        FOREIGN KEY (Supervisor_ID) REFERENCES Employee(Personal_ID)
);

CREATE TABLE Customer (
    Personal_ID         INT         NOT NULL,
    PrefSalesman_ID     INT,
    CONSTRAINT PK_Customer PRIMARY KEY (Personal_ID),
    CONSTRAINT FK_Customer_Person
        FOREIGN KEY (Personal_ID) REFERENCES Person(Personal_ID),
    CONSTRAINT FK_Customer_Salesman
        FOREIGN KEY (PrefSalesman_ID) REFERENCES Employee(Personal_ID)
);

CREATE TABLE PotentialEmployee (
    Personal_ID     INT             NOT NULL,
    CONSTRAINT PK_PotentialEmployee PRIMARY KEY (Personal_ID),
    CONSTRAINT FK_PotentialEmployee_Person
        FOREIGN KEY (Personal_ID) REFERENCES Person(Personal_ID)
);

CREATE TABLE Department (
    DeptID          INT             NOT NULL,
    DeptName        VARCHAR(100)    NOT NULL,
    CONSTRAINT PK_Department PRIMARY KEY (DeptID)
);

CREATE TABLE Works_For (
    Personal_ID     INT             NOT NULL,
    DeptID          INT             NOT NULL,
    StartTime       DATETIME        NOT NULL,
    EndTime         DATETIME,
    CONSTRAINT PK_Works_For PRIMARY KEY (Personal_ID, DeptID, StartTime),
    CONSTRAINT FK_WorksFor_Employee
        FOREIGN KEY (Personal_ID) REFERENCES Employee(Personal_ID),
    CONSTRAINT FK_WorksFor_Department
        FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Salary (
    Personal_ID         INT             NOT NULL,
    TransactionNum      INT             NOT NULL,
    PayDate             DATE            NOT NULL,
    Amount              DECIMAL(10, 2)  NOT NULL,
    CONSTRAINT PK_Salary PRIMARY KEY (Personal_ID, TransactionNum),
    CONSTRAINT FK_Salary_Employee
        FOREIGN KEY (Personal_ID) REFERENCES Employee(Personal_ID)
);

CREATE TABLE JobPosition (
    JobID           INT             NOT NULL,
    Description     TEXT,
    PostedDate      DATE            NOT NULL,
    DeptID          INT             NOT NULL,
    CONSTRAINT PK_JobPosition PRIMARY KEY (JobID),
    CONSTRAINT FK_JobPosition_Department
        FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Candidate (
    Personal_ID     INT             NOT NULL,
    JobID           INT             NOT NULL,
    CONSTRAINT PK_Candidate PRIMARY KEY (Personal_ID, JobID),
    CONSTRAINT FK_Candidate_Person
        FOREIGN KEY (Personal_ID) REFERENCES Person(Personal_ID),
    CONSTRAINT FK_Candidate_JobPosition
        FOREIGN KEY (JobID) REFERENCES JobPosition(JobID)
);

CREATE TABLE Interview (
    InterviewID         INT             NOT NULL,
    InterviewTime       DATETIME        NOT NULL,
    Grade               INT             CHECK (Grade BETWEEN 0 AND 100),
    JobID               INT             NOT NULL,
    Interviewee_ID      INT             NOT NULL,
    Interviewer_ID      INT             NOT NULL,
    CONSTRAINT PK_Interview PRIMARY KEY (InterviewID),
    CONSTRAINT FK_Interview_JobPosition
        FOREIGN KEY (JobID) REFERENCES JobPosition(JobID),
    CONSTRAINT FK_Interview_Interviewee
        FOREIGN KEY (Interviewee_ID) REFERENCES Person(Personal_ID),
    CONSTRAINT FK_Interview_Interviewer
        FOREIGN KEY (Interviewer_ID) REFERENCES Employee(Personal_ID)
);

CREATE TABLE Product (
    ProductID       INT             NOT NULL,
    ProductType     VARCHAR(50)     NOT NULL,
    Size            VARCHAR(20),
    ListPrice       DECIMAL(10, 2)  NOT NULL,
    Weight          DECIMAL(8, 2),
    Style           VARCHAR(50),
    CONSTRAINT PK_Product PRIMARY KEY (ProductID)
);

CREATE TABLE MarketingSite (
    SiteID          INT             NOT NULL,
    Name            VARCHAR(100)    NOT NULL,
    Location        VARCHAR(200),
    CONSTRAINT PK_MarketingSite PRIMARY KEY (SiteID)
);

CREATE TABLE Works_On (
    Personal_ID     INT             NOT NULL,
    SiteID          INT             NOT NULL,
    CONSTRAINT PK_Works_On PRIMARY KEY (Personal_ID, SiteID),
    CONSTRAINT FK_WorksOn_Employee
        FOREIGN KEY (Personal_ID) REFERENCES Employee(Personal_ID),
    CONSTRAINT FK_WorksOn_MarketingSite
        FOREIGN KEY (SiteID) REFERENCES MarketingSite(SiteID)
);

CREATE TABLE Sale (
    SaleID          INT             NOT NULL,
    SaleTime        DATETIME        NOT NULL,
    Salesman_ID     INT             NOT NULL,
    Customer_ID     INT             NOT NULL,
    ProductID       INT             NOT NULL,
    SiteID          INT             NOT NULL,
    CONSTRAINT PK_Sale PRIMARY KEY (SaleID),
    CONSTRAINT FK_Sale_Salesman
        FOREIGN KEY (Salesman_ID) REFERENCES Employee(Personal_ID),
    CONSTRAINT FK_Sale_Customer
        FOREIGN KEY (Customer_ID) REFERENCES Customer(Personal_ID),
    CONSTRAINT FK_Sale_Product
        FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    CONSTRAINT FK_Sale_MarketingSite
        FOREIGN KEY (SiteID) REFERENCES MarketingSite(SiteID)
);

CREATE TABLE Part (
    PartType        VARCHAR(50)     NOT NULL,
    CONSTRAINT PK_Part PRIMARY KEY (PartType)
);

CREATE TABLE Vendor (
    VendorID                INT             NOT NULL,
    Name                    VARCHAR(100)    NOT NULL,
    Address                 VARCHAR(200),
    AcctNumber              VARCHAR(50),
    CreditRating            VARCHAR(20),
    PurchasingWebServiceURL VARCHAR(500),
    CONSTRAINT PK_Vendor PRIMARY KEY (VendorID)
);

CREATE TABLE Supply (
    VendorID        INT             NOT NULL,
    PartType        VARCHAR(50)     NOT NULL,
    Price           DECIMAL(10, 2)  NOT NULL,
    CONSTRAINT PK_Supply PRIMARY KEY (VendorID, PartType),
    CONSTRAINT FK_Supply_Vendor
        FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
    CONSTRAINT FK_Supply_Part
        FOREIGN KEY (PartType) REFERENCES Part(PartType)
);

CREATE TABLE Produce (
    ProductID       INT             NOT NULL,
    PartType        VARCHAR(50)     NOT NULL,
    Qty             INT             NOT NULL CHECK (Qty > 0),
    CONSTRAINT PK_Produce PRIMARY KEY (ProductID, PartType),
    CONSTRAINT FK_Produce_Product
        FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    CONSTRAINT FK_Produce_Part
        FOREIGN KEY (PartType) REFERENCES Part(PartType)
);

ALTER TABLE Person
ADD COLUMN Email VARCHAR(100);

ALTER TABLE Part
ADD COLUMN Weight DECIMAL(8,2);