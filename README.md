# 🚀 Secure, Highly Available & Scalable AWS Web Application

**A Cloud Infrastructure & Security Project using AWS and Terraform**

## 📌 Project Overview

This project focuses on designing a secure, highly available, and scalable AWS infrastructure for a web application, following production-style cloud architecture principles.

The goal is to understand how cloud networking, security, monitoring, scalability, and Infrastructure as Code work together to build a reliable infrastructure.

The infrastructure will first be configured and tested through the AWS Management Console. Once validated, the configuration will be translated into Terraform code.

> **Project Status:** Architecture and planning phase. Infrastructure deployment and testing are planned as the project progresses.

## 🏗️ Architecture

![AWS Architecture Diagram](architecture.png)

The proposed architecture uses multiple Availability Zones to improve availability and separates application components into public and private network layers.

### Architecture Components

- **Amazon VPC:** Isolated virtual network for AWS resources.
- **Public and Private Subnets:** Network segmentation and controlled access.
- **Internet Gateway:** Connectivity between public resources and the internet.
- **NAT Gateway:** Outbound internet connectivity for private resources, where required.
- **Application Load Balancer (ALB):** Distributes incoming application traffic.
- **Amazon EC2 Auto Scaling:** Adjusts application capacity based on demand.
- **Amazon RDS:** Managed relational database with private network access.
- **Amazon CloudFront:** Content delivery and caching.
- **AWS WAF:** Web application traffic filtering.
- **Amazon Route 53:** DNS management.
- **AWS Certificate Manager (ACM):** TLS certificate management.
- **Amazon CloudWatch:** Metrics, logs, and alarms.
- **AWS CloudTrail:** AWS API activity auditing.
- **VPC Flow Logs:** Network traffic logging.
- **AWS IAM:** Identity and access management.
- **AWS Systems Manager:** Secure instance management.
- **Terraform:** Infrastructure as Code.
- **GitHub Actions:** Planned automation for Terraform validation and CI/CD workflows.

## 🔐 Security Design

Security is a core part of this project.

The design follows these principles:

- Apply the principle of least privilege using IAM roles and policies.
- Restrict inbound access through security groups.
- Keep database resources in private subnets without public access.
- Allow application instances to receive traffic only from the Application Load Balancer where applicable.
- Use encryption for supported data storage and database resources.
- Store sensitive configuration and database credentials securely.
- Prefer AWS Systems Manager Session Manager over publicly exposed SSH access.
- Enable logging and monitoring to support auditing and troubleshooting.

## 📈 High Availability & Scalability

The proposed design includes:

- Deployment across two Availability Zones.
- An Application Load Balancer for traffic distribution.
- EC2 Auto Scaling to manage application capacity.
- Health checks to identify unhealthy application instances.
- A planned Multi-AZ database configuration, subject to account eligibility and budget.

These features are intended to reduce single points of failure and improve application availability.

## 📊 Monitoring & Logging

The monitoring plan includes:

- **Amazon CloudWatch:** Resource metrics, application logs, and alarms.
- **AWS CloudTrail:** Auditing of AWS API activity.
- **VPC Flow Logs:** Visibility into network traffic.
- **Amazon SNS:** Optional notifications for configured alarms.
- **Access Logs:** Planned logging for supported services such as the ALB and S3.

## ⚙️ Infrastructure as Code & DevOps

Terraform will be used to manage the infrastructure in a repeatable and maintainable way.

Planned practices include:

- Organizing infrastructure into reusable Terraform modules.
- Using variables and outputs to improve maintainability.
- Running `terraform fmt` and `terraform validate`.
- Reviewing `terraform plan` before applying changes.
- Exploring GitHub Actions for automated validation.
- Managing Terraform state securely, with an S3 backend considered where appropriate.

## 🛠️ Implementation Roadmap

1. Review AWS account permissions, service availability, and pricing.
2. Configure the VPC, subnets, route tables, and network connectivity.
3. Configure security groups and IAM permissions.
4. Deploy the application tier and load balancing.
5. Configure Auto Scaling and health checks.
6. Add the database tier after reviewing the cost implications.
7. Configure monitoring, logging, and security controls.
8. Test connectivity, application health, and recovery scenarios.
9. Recreate the validated infrastructure using Terraform.
10. Document the results, architecture decisions, and cleanup procedure.

## 💰 Cost Management

Cost awareness is part of the design process.

Before deploying resources, pricing and account eligibility will be reviewed, especially for:

- NAT Gateway
- Application Load Balancer
- Amazon RDS and Multi-AZ configurations
- AWS WAF
- Route 53 hosted zones
- CloudWatch logs and other metered services

AWS Free Tier eligibility and promotional credits depend on account terms and service usage. Not every component is necessarily free.

Test resources will be reviewed and removed when no longer needed.

## 📚 Learning Objectives

Through this project, I aim to improve my practical understanding of:

- AWS networking and VPC design
- Cloud security and IAM
- High availability and scalability
- Monitoring and auditing
- Infrastructure as Code with Terraform
- DevOps automation
- Cloud cost awareness and resource management

## 📍 Current Status

- [x] Initial architecture design
- [x] Project documentation
- [ ] AWS Console implementation
- [ ] Connectivity and security testing
- [ ] Monitoring and logging configuration
- [ ] Terraform implementation
- [ ] CI/CD validation workflow
- [ ] Final documentation and deployment evidence

## ⚠️ Disclaimer

This repository currently documents the proposed architecture and implementation plan. Services listed above are planned components and should not be interpreted as already deployed or tested.

The final architecture may change based on AWS account permissions, service availability, project requirements, and budget.

---

**Technologies:** AWS · Terraform · GitHub · Cloud Security · Networking · DevOps

**Project Focus:** Secure Cloud Infrastructure Engineering
