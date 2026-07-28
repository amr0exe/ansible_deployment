# AWS Terraform Web Infrastructure

This repository contains modularized terraform code to deploy highly available web architecture on AWS.

## Architecture
```bash
            +--------------------------------------------------+
            |                  Route 53                        |
            +-----------------------+--------------------------+
                                    | Alias (A Record)
                                    v
            +--------------------------------------------------+
            |           Application Load Balancer (ALB)        |
            +-----------------------+--------------------------+
                                    | Port 80 (Target Group)
                +-------------------+-------------------+
                |                                       |
                v                                       v
    +-----------------------+               +-----------------------+
    |   Public Subnet 1     |               |   Public Subnet 2     |
    |  (AZ 1 / 10.0.1.0/24) |               |  (AZ 2 / 10.0.2.0/24) |
    |                       |               |                       |
    |  +-----------------+  |               |  +-----------------+  |
    |  |   EC2 Instance  |  |               |  |   EC2 Instance  |  |
    |  +-----------------+  |               |  +-----------------+  |
    +-----------------------+               +-----------------------+
```

## Key Components
- Custom VPC: public subnets spanning across 2 availability zones
- EC2: two ubuntu 24.04 instances running across distinct public sunets
- Security & Traffic isolation:
  - EC2 security group strictly accepts HTTP traffic from ALB Security Group ID and SSH from deployer's Public IP
- ALB: balances http/s traffic across both instances via target group
- Route53: 
  - resolves domain/dns records from vercel through terraform code
  - resolves public domain `terraform.amritthapa183.com.np` to ALB using Alias(A) record


## Setup - Testing

- **Pre-requite:**
  - terraform cli
  - ansible
  - aws cli
  - Vercel_API_TOKEN

- **State Bucket:**
```bash
# first create state-bucket for backup/store
cd state
terraform init
terraform apply
```

- **Start dev/prod:**
```bash
cd dev
 export VERCEL_API_TOKEN="" # U have to get token with project_scope, from vercel
terraform init
terraform apply -var-file=dev.tfvars
```

## Screenshots

- terraform-state-backup

<img width="2310" height="546" alt="Image" src="https://github.com/user-attachments/assets/87ffbd96-dacf-4280-9648-4f5e9596484c" />

- route53-hosted-zone

<img width="2318" height="1005" alt="Image" src="https://github.com/user-attachments/assets/51c389f7-861c-44c5-be07-6dede3728857" />

- ec2-intances

<img width="2080" height="1089" alt="Image" src="https://github.com/user-attachments/assets/3cc96d53-c7ab-4b23-a56d-ad80284caf4e" />

- target-group


<img width="2027" height="985" alt="Image" src="https://github.com/user-attachments/assets/4090556b-ee37-42aa-95c8-cd293e569608" />

- application-load-balancer


<img width="2026" height="1076" alt="Image" src="https://github.com/user-attachments/assets/04fffdfb-b7e5-4757-b18a-c002320ac8e5" />
