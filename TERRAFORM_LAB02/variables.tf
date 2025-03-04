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

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}


# Variable for the VPC
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

# Will create subnets using for_each
variable "subnets" {
  description = "List of Subnets"
  type = list(object({
    name              = string
    cidr_block        = string
    availability_zone = string
    type              = string
  }))
}


# Won't need variables for igw , route table, route, since they are tied to the vpc

# Variable for the EC2 Instance type
variable "instances" {
  description = "List of instances to create"
  type = list(object({
    name          = string
    ami           = string
    instance_type = string
    subnet_ids    = list(string)
  }))
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
