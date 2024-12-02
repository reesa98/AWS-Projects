# DB Migration Using AWS

This project documents the steps involved in migrating a database from an on-premises environment to AWS using AWS Database Migration Service (DMS).

## Project Overview
Database migration is a critical task in modern cloud computing, enabling seamless data transfer from on-premises infrastructure to cloud platforms. This project focuses on performing the migration efficiently using AWS services.

---

## Steps Followed

### 1. **Set Up the Source Database**
- Configure the source database in the on-premises environment.
- Ensure it is accessible for migration purposes.
- Take a backup of the source database as a precautionary measure.

### 2. **Create a Replication Instance in AWS**
- Navigate to the **DMS Console** in AWS.
- Create a new replication instance:
  - Allocate necessary storage (e.g., 20GB).
  - Configure VPC and subnet group settings for accessibility.
- Review and launch the replication instance.

### 3. **Define Source and Target Endpoints**
- Configure the **Source Endpoint**:
  - Database engine: e.g., MySQL.
  - Connection parameters (host, port, username, password).
- Configure the **Target Endpoint**:
  - Database engine: e.g., Amazon RDS (MySQL, PostgreSQL, etc.).
  - Connection details for the target AWS database instance.

### 4. **Create a Migration Task**
- Specify the replication instance and endpoints.
- Define migration type (e.g., **Full Load**, **Change Data Capture**, or both).
- Map the source and target schemas.
- Start the task and monitor the progress.

### 5. **Verify Data Consistency**
- After migration, compare source and target databases to ensure data integrity.
- Run queries and cross-check data across both environments.

---

## Tools and Technologies Used
- **AWS Database Migration Service (DMS)**
- **Amazon RDS**
- Source database: On-premises MySQL database.
- Target database: Amazon RDS for MySQL/PostgreSQL.

---

## Challenges and Learnings
- Ensuring network connectivity between on-premises and AWS environments.
- Managing schema conversions for target databases.
- Optimizing migration performance to minimize downtime.

---

## References
- [AWS DMS Documentation](https://aws.amazon.com/dms/)
- [Best Practices for Database Migration](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_BestPractices.html)

---

## Next Steps
- Automate database migrations using AWS SDKs or CLI.
- Experiment with additional AWS tools like AWS SCT for schema transformations.
