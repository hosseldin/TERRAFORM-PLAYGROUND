# ==============================================
#
# =========== TERRAFORM FILE START =============
#
# ==============================================
#
# Created By: Hossam Mahmoud
# Date: 2025-03-04
# Filename: development.tfvars
# Description: 
# Version: 1.0.0
# Copyright (c) 2025 Hossam. All rights reserved.
#
# ==============================================
#
# ====== TERRAFORM IMPLEMENTATION START ======
#
# ==============================================

# Variable for the VPC
region   = "us-east-1"
vpc_name = "hosa-vpc-terraform"
vpc_cidr = "10.0.0.0/16"

subnet_configs = {
  "public-subnet-1" = {
    cidr_block = "10.0.1.0/24"
    az         = "us-east-1a"
    is_public  = true
  }
  "private-subnet-1" = {
    cidr_block = "10.0.2.0/24"
    az         = "us-east-1a"
    is_public  = false
  }
}

security_rules = [
  {
    name        = "allow-ssh"
    description = "Allow SSH access"
    port        = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    name        = "allow-http"
    description = "Allow HTTP access"
    port        = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]


instances = [
  {
    name          = "app-server-1"
    ami           = "ami-04b4f1a9cf54c11d0"
    instance_type = "t2.micro"
    subnet_name   = "public-subnet-1"
    security_name = "web-sg"
  }
]

# instances = [
#   {
#     name          = "app-server-1",
#     ami           = "ami-04b4f1a9cf54c11d0",
#     instance_type = "t2.micro"
#   },
#   {
#     name          = "app-server-2",
#     ami           = "ami-04b4f1a9cf54c11d0",
#     instance_type = "t2.micro"
#   }
# ]

# ==============================================
#
# ======= TERRAFORM IMPLEMENTATION END ========
#
# ==============================================
#
# End of File
# Copyright (c) 2025 Hossam. All rights reserved.
#
# ==============================================
#
# ============= TERRAFORM FILE END =============
#
# ==============================================
