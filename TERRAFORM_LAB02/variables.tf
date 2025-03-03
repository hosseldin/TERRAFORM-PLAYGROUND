# ==============================================
#
# =========== TERRAFORM FILE START =============
#
# ==============================================
#
# Created By: Hossam Mahmoud
# Date: 2025-03-02
# Filename: variables.tf
# Description: Variables for reusability and maintainability
# Version: 1.0.0
# Copyright (c) 2025 Hossam. All rights reserved.
#
# ==============================================
#
# ====== TERRAFORM IMPLEMENTATION START ======
#
# ==============================================

locals {
  default = terraform.workspace
}

# Variable for the VPC
variable "vpc_cidr" {
  type = string
}

# Will create subnets using for_each
variable "subnets" {
  type = map(object({
    name              = string
    cidr_block        = string
    availability_zone = string
    is_public         = bool
  }))
  default = {
    "public-subnet-1" = {
      name              = "hosa-PublicSubnet-01"
      cidr_block        = "10.0.1.0/24"
      availability_zone = "us-east-1a"
      is_public         = true
    }
    "private-subnet-1" = {
      name              = "hosa-PrivateSubnet-01"
      cidr_block        = "10.0.2.0/24"
      availability_zone = "us-east-1a"
      is_public         = false
    }
  }
}


# Won't need variables for igw , route table, route, since they are tied to the vpc

# Variable for the EC2 Instance type
variable "instance_type" {
  default = "t2.micro"
}

# Variable for the AMI
variable "ami_id" {
  default = "ami-04b4f1a9cf54c11d0" # Choose an Ubuntu AMI for your region
}

# # Variable for the key-pair name
# variable "key_name" {
#   description = "SSH key name"
# }

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
