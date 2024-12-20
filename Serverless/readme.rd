# Serverless Project using AWS

This repository contains the implementation of a serverless project using various AWS services including EC2, S3, Lambda, API Gateway, and SNS.

---

## Project Architecture

![Project Architecture](./Serverless.drawio.png)

The architecture includes:
1. A user interacting with an EC2 instance.
2. An API Gateway calling Lambda functions.
3. Lambda functions processing and uploading images to S3.
4. SNS for sending email notifications.

---

## Table of Contents
1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
3. [Steps to Set Up the Project](#steps-to-set-up-the-project)
   - [EC2 Instance Setup](#1-launch-ec2-instance)
   - [Node.js and Dependencies](#2-install-nodejs-and-required-packages)
   - [S3 Bucket Setup](#3-create-s3-bucket)
   - [First Lambda Function](#4-create-and-deploy-the-first-lambda-function)
   - [Update EC2 Instance](#5-pull-updates-to-ec2-instance)
   - [SNS Setup](#6-set-up-sns-for-notifications)
   - [Second Lambda Function](#7-create-the-second-lambda-function)
   - [Add Triggers and Permissions](#8-add-triggers-and-permissions)
4. [Testing](#testing)
5. [Cleanup](#cleanup)
6. [Important Notes](#important-notes)


---

## Introduction
This project demonstrates a serverless architecture using AWS services. The application processes image uploads and sends notifications via email.

---

## Prerequisites
- An AWS account.
- Basic understanding of AWS services.
- EC2 instance with security group configured.
- Node.js and npm installed.
- Access to Postman for API testing.

---

## Steps to Set Up the Project

### 1. Launch EC2 Instance
1. Create an EC2 instance.
2. Install Git:
   ```bash
   sudo yum install git
   ```
3. Clone the repository:
   ```bash
   git clone https://github.com/reesa98/severless_repo.git
   ```
4. Change to the project directory:
   ```bash
   cd serverless_repo
   ```
### 2. Install Node.js and Required Packages
1. Install Node.js using NVM:
   ```bash
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
   ```
2. Activate NVM:
   ```bash
   . ~/.nvm/nvm.sh
   ```
3. Install Node.js (use version 16 if GLBIC error):
   ```bash
   nvm install node
   nvm install 16.8.0
   nvm use 16
   ```
4. Verify Node.js installation:
   ```bash
   node -e "console.log('Running Node.js ' + process.version)"
   ```
5. Install Node.js dependencies:
   ```bash
   npm install
   ```
6. Run the application:
   ```bash
   npm run serve
   ```
7. If the app times out, update the security group rules to allow port 8080:
   - Add a rule: `Custom TCP -> Port 8080`


### 3. Create S3 Bucket
1. Create an S3 bucket and disable "Block All Public Access."
2. Enable CORS and update the configuration as follows:
   ```json
   [
       {
           "AllowedHeaders": ["*"],
           "AllowedMethods": ["PUT", "POST", "GET", "HEAD"],
           "AllowedOrigins": ["*"],
           "ExposeHeaders": []
       }
   ]
   ```

### 4. Create and Deploy the First Lambda Function
1. Create a Lambda function using Node.js v16.
2. Copy the code from [S3 Uploader](https://github.com/aws-samples/s3-to-lambda-patterns/blob/master/videos-samples/5-s3-uploader/app.js).
3. Update the bucket name in the code.
4. Deploy the Lambda function.
5. Add S3 Full Access permissions to the Lambda IAM role.
6. Test the Lambda function to ensure it returns a 200 status code.
7. Add an API Gateway trigger (REST API -> Open Access).
8. Test the API Gateway link using Postman.
9. Update the API Gateway URL in your code.

### 5. Pull Updates to EC2 Instance
1. Pull the latest changes:
   ```bash
   git pull
   ```
2. Restart the application:
   ```bash
   npm run serve
   ```

### 6. Set Up SNS for Notifications
1. Create an SNS topic and confirm the email subscription.

### 7. Create the Second Lambda Function
1. Use Python 3.9 to create another Lambda function.
2. Use the following code for SNS notifications:
   ```python
   import boto3

   def lambda_handler(event, context):
       # Send message to SNS
       MY_SNS_TOPIC_ARN = 'arn:aws:sns:us-east-1:388333323558:topicforserverlessproject'
       sns_client = boto3.client('sns')
       sns_client.publish(
           TopicArn=MY_SNS_TOPIC_ARN,
           Subject='Request Submitted',
           Message='Request Submitted'
       )
   ```
3. Update the ARN in the code.
4. Add SNS publish permissions to the Lambda IAM role.
5. Test the Lambda function.

### 8. Add Triggers and Permissions
1. Add an S3 trigger to the second Lambda function.
2. Create an "Allow All Actions" policy for S3.


---

## Testing
- Test each component separately (e.g., Lambda functions, API Gateway, and SNS) before integrating them.
- Use Postman to validate the API Gateway endpoint.

---

## Cleanup
- Delete all AWS resources (EC2, S3, Lambda, API Gateway, SNS) to avoid unnecessary charges.

---

## Important Notes
- Make sure to update all necessary ARNs, bucket names, and configurations in the code.
- Verify security group rules to avoid connection issues.
- Always test individual components before integrating them.


