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

# Variable for the VPC
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

# Variable for the Public Subnet
variable "public_subnet_cidr" {
  default     = "10.0.1.0/24"
  type        = string
  description = "CIDR block for the public subnet"
}

# Variable for the Private Subnet
variable "private_subnet_cidr" {
  default     = "10.0.2.0/24"
  type        = string
  description = "CIDR block for the private subnet"
}

# Variable for the Public Availability Zone
variable "public_az" {
  default     = "us-east-1a"
  type        = string
  description = "Availability Zone for public subnet"
}

# Variable for the Private Availability Zone
variable "private_az" {
  default     = "us-east-1a"
  type        = string
  description = "Availability Zone for private subnet"
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
