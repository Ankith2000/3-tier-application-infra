# 3-tier-application-infra

Overview
This repository provisions a highly available, secure, and scalable 3-tier web application infrastructure on AWS using Terraform. The architecture separates the application into frontend, backend, and database layers, each deployed in isolated subnets with strict security controls.

Architecture
VPC: Custom VPC with public and private subnets across multiple Availability Zones.
Public Subnets: Host the bastion server and frontend load balancer.
Private Subnets: Host application servers (frontend and backend), backend load balancer, and RDS database.
NAT Gateway: Allows outbound internet access for private subnets.
Security Groups: Restrict traffic between tiers and from the internet.
RDS (MySQL): Multi-AZ deployment for high availability.
IAM Roles: Grant EC2 instances least-privilege access to secrets and parameters.
S3 Backend: Stores Terraform state securely for team collaboration.
Features
Multi-AZ deployment for all tiers
Automated bootstrapping of EC2 instances
Secure storage of secrets and configuration
Modular, reusable Terraform code
Directory Structure
Modules/Network: VPC, subnets, route tables, NAT gateway, security groups
Modules/Compute: Launch templates, Auto Scaling Groups, EC2 profiles
Modules/Storage: RDS MySQL with subnet group and security
Modules/Security: Secrets Manager and SSM Parameter Store integration
Usage
Prerequisites
Terraform >= 1.0
AWS CLI configured with appropriate credentials
S3 bucket for remote state (see backend.tf)
Steps
Clone the repository

git clone <repo-url>
cd 3-Tiers\ Application\ Infra/Terraform
Configure variables

Edit terraform.tfvars to match your AWS region, CIDR blocks, and credentials.

Initialize Terraform

terraform init
Plan the deployment

terraform plan
Apply the configuration

terraform apply
Inputs
See terraform.tfvars for configurable variables such as:

VPC and subnet CIDRs
Subnet-to-tier mapping
Database credentials and names
Ports for backend and database
Outputs
VPC ID
Subnet IDs
Security Group IDs
RDS endpoint
Security
All secrets (DB credentials, JWT secrets) are stored in AWS Secrets Manager or SSM Parameter Store.
EC2 instances use IAM roles with least-privilege access.
No public access to backend or database tiers.
