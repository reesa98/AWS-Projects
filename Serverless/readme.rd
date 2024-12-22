# Serverless Project Documentation

**Prepared by**: Reesa Susan Sabu  
**Date**: December 22, 2024  
**Email**: reesasusan@gmail.com  

## Introduction
This document outlines the implementation details of a serverless project leveraging AWS services. The project demonstrates a fully functional application featuring file uploads, notifications, and REST APIs, adhering to modern serverless architecture principles.

## Table of Contents
1. [Project Overview](#project-overview)
2. [System Architecture](#system-architecture)
3. [Implementation Steps](#implementation-steps)
4. [Challenges and Resolutions](#challenges-and-resolutions)
5. [Conclusion](#conclusion)

## Project Overview
This project is a serverless application implemented using:
- **AWS Lambda** for backend logic
- **Amazon S3** for storage
- **API Gateway** to expose the Lambda function as a REST API
- **Amazon SNS** for notifications

The primary objective is to enable efficient file uploads and real-time notifications.

## System Architecture
Below is the architecture diagram for the project:
![System Architecture Diagram](./path/to/architecture-diagram.png)

## Implementation Steps

### 1. Environment Setup
1. **Provision EC2 Instance:**
   - Use AWS Management Console or CLI to create an EC2 instance.
   - Install Git.

2. **Clone Repository:**
   - Clone the repository for the project.

3. **Install Node.js:**
   - Install Node.js on your EC2 instance.

4. **Install Dependencies:**
   - Install necessary project dependencies using `npm`.

5. **Security Group Update:**
   - Add a custom TCP rule for port 8080 if the connection times out.

### 2. S3 Bucket Configuration
1. **Create an S3 Bucket:**
   - Ensure "Block All Public Access" is disabled.
   - Configure CORS policy to allow the required HTTP methods and headers.

### 3. Lambda Functions
#### Lambda Function 1 (Node.js)
1. **Create Lambda Function:**
   - Use Node.js 16 runtime.

2. **Code:**
   - Include the necessary Node.js code to handle file uploads and other backend logic.

3. **IAM Role:**
   - Assign "S3 Full Access" permissions to the Lambda function.

4. **Add API Gateway Trigger:**
   - Configure a REST API in API Gateway to expose the Lambda function.

5. **Test the Function:**
   - Test the function by triggering it through the API Gateway.

#### Lambda Function 2 (Python)
1. **Create Lambda Function:**
   - Use Python 3.9 runtime.

2. **Code:**
   - Include Python code to handle SNS notifications.

3. **IAM Role:**
   - Assign "SNS Full Access" permissions to the Lambda function.

4. **Add S3 Trigger:**
   - Configure the Lambda function to trigger on object creation in the S3 bucket.

### 4. SNS Notifications
1. **Create SNS Topic:**
   - Create an SNS topic for notifications.
   - Confirm email subscription.

2. **Test Notifications:**
   - Validate email receipt after Lambda execution.

### 5. Testing and Deployment
1. **End-to-End Testing:**
   - Verify file uploads, API responses, and email notifications.

2. **Clean-Up:**
   - Remove resources to avoid unnecessary charges.

## Challenges and Resolutions
1. **CORS Errors:**
   - Resolved by configuring CORS policy for the S3 bucket.

2. **IAM Permission Issues:**
   - Addressed by assigning correct IAM roles to Lambda functions.

## Conclusion
This project highlights my ability to design and deploy serverless solutions using AWS. The implementation reflects a strong grasp of modern cloud architecture principles and demonstrates the integration of various AWS services for building a scalable serverless application.

---

For more details, please feel free to contact me via email: [reesasusan@gmail.com](mailto:reesasusan@gmail.com).
