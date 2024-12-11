# Database Infrastructure Setup using CloudFormation for Ample Technologies

## Problem Statement
Ample Technologies, an AWS golden partner, plans to set up a scalable database infrastructure on the AWS Cloud. This requires a MySQL database instance in private subnets with the ability to track and roll back changes to the infrastructure.

## Objective
To deploy a MySQL database infrastructure using AWS CloudFormation with the following specifications:

### Database Configuration
- **Storage Space**: 20 GB
- **Database Instance Class**: db.t2.micro
- **Database Name**: Ampledb
- **Database Engine**: MySQL 8.0.23
- **Publicly Accessible**: True
- **Username**: awsuser
- **Password**: Aws123456789
- **Port**: 3306
- **AllowUpgradeVersion**: False
- **Backup Retention Period**: 7 Days

### VPC Configuration
- **CIDR Block**: 192.168.0.0/16
- **Enable DNS Hostnames**: False
- **Enable DNS Support**: False
- **Number of Private Subnets**: 2
- **Private Subnet 1**: 192.168.1.0/24 (AZ: us-east-1a)
- **Private Subnet 2**: 192.168.2.0/24 (AZ: us-east-1b)

### Security Group Configuration
- **Ingress Rules**:
  - CIDR: 0.0.0.0/0
  - From Port: 3306
  - To Port: 3306
  - Protocol: TCP
- **Egress Rules**:
  - CIDR: 0.0.0.0/0
  - From Port: 80
  - To Port: 80
  - Protocol: TCP

## Approach
1. **Design the VPC and Subnets**:
   - Create a VPC with the specified CIDR block.
   - Set up two private subnets in different Availability Zones (us-east-1a, us-east-1b).
2. **Database Setup**:
   - Deploy the MySQL database instance in the private subnets.
   - Configure security groups to allow database access on port 3306.
3. **Security Configuration**:
   - Restrict ingress/egress to meet requirements.
4. **Version Control**:
   - Enable easy rollback using CloudFormation stack updates.

## Challenges and Solutions

### Errors Faced During Implementation
1. **Error**: "Cannot create a publicly accessible DBInstance. The specified VPC has no internet gateway attached."
   - **Solution**: Updated the RDS Instance and it should not publicly accessible.

2. **Error**: "Properties validation failed for resource rdsInstance with message: #/DBSubnetGroupName: expected type: String, found: JSONArray #/DBSecurityGroups: expected type: JSONArray, found: String."
   - **Solution**: Corrected the structure to match the expected data types in the CloudFormation template.

3. **Error**: "RDS does not support creating a DB instance with the following combination: DBInstanceClass=db.t2.micro, Engine=mysql, EngineVersion=8.0.39."
   - **Solution**: Modified the instance class to `db.t3.micro` and engine version to a supported combination, such as `8.0.32`.

4. **Error**: "RDS does not support creating a DB instance with the following combination: DBInstanceClass=db.t3.micro, Engine=mysql, EngineVersion=8.0.32."
   - **Solution**: Adjusted the instance class and verified compatibility with the AWS documentation.

By documenting these challenges and their resolutions, the project ensures a smoother setup process for future iterations.

## Deliverables
- A functional database infrastructure as per specifications.
- Documentation of the implementation process.

## YAML Code
The CloudFormation template for the project is available in Ample_app.yaml`.

## Steps to Deploy
1. Open the AWS Management Console.
2. Navigate to **CloudFormation**.
3. Create a new stack and upload the `Ample_app.yml` file.
4. Follow the on-screen instructions to deploy the infrastructure.
5. Verify that the infrastructure is created as per the requirements.

## Verification
1. Check that the VPC, subnets, and security groups are created.
2. Confirm the MySQL database instance is running in the private subnets.
3. Validate ingress and egress rules in the security group.
4. Ensure the backup retention period and other database configurations are correct.
