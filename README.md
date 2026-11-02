# AWS Infrastructure Provisioning and Automation using Terraform

## Project Overview

This project demonstrates Infrastructure as Code (IaC) using **Terraform** to provision AWS infrastructure automatically.

It creates a custom AWS VPC, public subnet, Internet Gateway, route table, security group, and EC2 instance.

## Technologies Used

- Terraform
- AWS Cloud
- AWS EC2
- AWS VPC
- Internet Gateway
- Public Subnet
- Route Tables
- Security Groups
- Ubuntu Linux

## Architecture

```text
                 Internet
                    |
             Internet Gateway
                    |
                Route Table
                    |
               Public Subnet
                10.0.1.0/24
                    |
                Security Group
                    |
                 EC2 Instance
                  t3.micro
```

## AWS Resources Created

| Resource | Configuration |
|---|---|
| VPC | 10.0.0.0/16 |
| Public Subnet | 10.0.1.0/24 |
| Internet Gateway | Attached to VPC |
| Route Table | 0.0.0.0/0 |
| Security Group | HTTP, HTTPS, SSH |
| EC2 Instance | t3.micro |
| AWS Region | ap-south-2 |

## Project Structure

```text
aws-terraform-infrastructure/
│
├── main.tf
├── .terraform.lock.hcl
├── .gitignore
└── README.md
```

## Prerequisites

Before running this project, install:

1. Terraform
2. AWS CLI
3. AWS Account
4. IAM user or role with appropriate permissions

## Setup and Execution

### 1. Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/aws-terraform-infrastructure.git
cd aws-terraform-infrastructure
```

### 2. Configure AWS Credentials

```bash
aws configure
```

Provide your AWS Access Key, Secret Access Key, region, and output format.

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Validate Configuration

```bash
terraform validate
```

### 5. Review Execution Plan

```bash
terraform plan
```

### 6. Deploy AWS Infrastructure

```bash
terraform apply
```

Type `yes` to confirm deployment.

### 7. View Terraform Outputs

```bash
terraform output
```

### 8. Destroy Infrastructure

After completing the project, remove the created AWS resources:

```bash
terraform destroy
```

Type `yes` to confirm.

## Security Considerations

- AWS credentials are not stored in this repository.
- Terraform state files are excluded using `.gitignore`.
- SSH access should be restricted to trusted IP addresses.
- Apply the principle of least privilege when configuring IAM permissions.

## Learning Outcomes

- Understanding Infrastructure as Code (IaC).
- Automating AWS infrastructure provisioning.
- Creating and configuring VPC networking.
- Managing AWS EC2 instances using Terraform.
- Configuring Internet Gateway and Route Tables.
- Implementing AWS Security Groups.
- Understanding Terraform workflow and resource management.

## Author

**Ranjith Kumar**

Aspiring DevOps Engineer

GitHub: https://github.com/ranjith200603

---

⭐ If you find this project useful, feel free to star the repository.
