# Enterprise Database Design & Development

A relational database designed and implemented for a fictional company that manages employees, customers, job postings, interviews, product sales, marketing sites, and vendor part supply chains. Built for CS 4347 (Database Systems) at UT Dallas.

## Overview

The system models a business that:
- Tracks people who may be employees, customers, and/or potential employees at the same time
- Manages a department and employee hierarchy, including a self-referencing supervisor relationship
- Handles job postings, candidate applications, and multi-round interviews with scoring
- Tracks products, marketing sites, and sales history
- Manages vendors and the parts they supply for manufacturing, including per-vendor pricing

## Key Design Challenges

- **Self-referencing hierarchy**: Employees report to other employees, requiring a recursive foreign key (`Supervisor_ID`) within the `Employee` table.
- **Overlapping roles**: A single person can simultaneously be an employee, a customer, and/or a potential employee, modeled through a shared `Person` supertype with role-specific subtype tables.
- **Many-to-many relationships**: Vendor-to-part supply (with per-vendor pricing) and interviews (interviewer-to-interviewee-to-job) both required junction tables to implement correctly in a relational schema.
- **Normalization**: All tables were normalized to Third Normal Form (3NF) to eliminate redundancy and update anomalies.

## Contents

| File | Description |
|---|---|
| `EER-Diagram.png` | Conceptual Enhanced ER diagram |
| `Relational-Schema.png` | Logical relational schema derived from the EER model |
| `SemesterProjectDDL.sql` | Table creation statements (primary keys, foreign keys, constraints) |
| `SemesterProjectDML.sql` | Sample data inserts |
| `SemesterProjectsViews.sql` | SQL views built on top of the schema |
| `SemesterProjectQueries.sql` | 15 business queries using joins, aggregation, and subqueries |
| `Project-Report.pdf` | Full written report, including design rationale and normalization steps |

## Tech Stack

- MySQL
- EER / relational modeling

## Contributors

This was originally submitted as a group project (with Nicholas Ackley) for CS 4347. The work in this repository — schema design, implementation, and SQL queries/views — reflects **Omar Bharwani's** contributions to the project.
