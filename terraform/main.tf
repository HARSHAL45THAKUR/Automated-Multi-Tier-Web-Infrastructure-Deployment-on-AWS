provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./vpc.tf"
}

module "ec2" {
  source = "./ec2.tf"
}

module "rds" {
  source = "./rds.tf"
}

module "alb" {
  source = "./alb.tf"
}

module "ecr" {
  source = "./ecr.tf"
}

module "security" {
  source = "./security.tf"
}

module "acm" {
  source = "./acm.tf"
}
