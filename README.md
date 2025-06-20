# Automated Multi-Tier Web Infrastructure Deployment on AWS 

This project demonstrates a fully automated, production-grade deployment pipeline using **Terraform**, **Docker**, **GitLab CI/CD**, and **AWS services** (ECR, EC2, RDS, ALB, CloudWatch). It follows modern DevOps and cloud architecture practices with scalability, high availability, and monitoring.

---

## Features

- Multi-tier infrastructure using Terraform modules
- Dockerized Flask backend and Nginx frontend
- HTTPS with ACM + ALB
- RDS PostgreSQL for backend data
- EC2 + Auto Scaling Group for high availability
- GitLab CI/CD for zero-touch build, test, deploy
- ECR for Docker image hosting
- CloudWatch Agent for logs and metrics
- CloudWatch alarms for health monitoring

---

## Project Structure

```bash
project/
├── app/
│   ├── backend/           # Flask backend
│   └── frontend/          # Nginx + static frontend
├── terraform/             # All Terraform infra
│   ├── main.tf            # Provider & modules
│   ├── vpc.tf             # VPC + Subnets
│   ├── ec2.tf             # Launch EC2
│   ├── rds.tf             # PostgreSQL DB
│   ├── alb.tf             # Application Load Balancer
│   ├── autoscaling.tf     # ASG for high availability
│   ├── ecr.tf             # ECR repos
│   ├── acm.tf             # SSL certs
│   ├── cloudwatch.tf      # Monitoring + alarms
│   └── security.tf        # SGs for EC2, ALB, RDS
├── scripts/
│   └── deploy.sh          # EC2 bootstrap script
├── .gitlab-ci.yml         # GitLab CI/CD config
└── README.md              # This file
```

---

## Application Overview

### Backend (Flask)
- Simple API returning JSON
- Dockerized using Gunicorn

### Frontend (Nginx)
- Static HTML hosted on Nginx
- Dockerized

---

## Infrastructure Overview

| Component | Description |
|----------|-------------|
| VPC & Subnets | Custom VPC with public & private subnets |
| EC2 | Runs app containers in private subnet |
| RDS | PostgreSQL instance in private subnet |
| ALB | Load balances traffic and handles HTTPS |
| ECR | Stores Docker images pushed from CI/CD |
| CloudWatch | Centralized logging, metrics, alarms |
| ASG | Ensures self-healing and scalability |

---

## GitLab CI/CD Pipeline

**Stages:** `build → push → deploy`

- Build Docker images for frontend/backend
- Push images to AWS ECR
- SSH into EC2 (or use ASG LT) and deploy containers
- Optional: Extend to trigger `terraform apply`

---

## Security

- Security Groups for:
  - EC2 (SSH, App Port)
  - ALB (HTTPS)
  - RDS (Internal DB Access)
- HTTPS enabled via ACM SSL cert

---

## Monitoring

- EC2 logs shipped to CloudWatch Logs
- CloudWatch Agent installed via `deploy.sh`
- CPU utilization alarm (can be extended to RAM, disk, etc.)
- Auto-healing using ALB health checks + ASG

---

## Setup Instructions

1. Clone the project
2. Configure AWS CLI with your credentials
3. Update `terraform/variables.tf` with your settings
4. Run:
```bash
cd terraform
terraform init
terraform apply
```
5. Push your code to GitLab to trigger the pipeline
6. Access your app using the ALB DNS output

---

## Author
**Harshal Thakur**  
Cloud & DevOps Enthusiast | AWS/GCP | CI/CD | Infrastructure as Code

---

## Final Output

Highly available, secure, and fully automated multi-tier web infrastructure deployed on AWS.

---

> Star this repo if you found it useful! Feel free to fork and extend.
