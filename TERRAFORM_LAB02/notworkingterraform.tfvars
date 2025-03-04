# ==============================================
#
# =========== TERRAFORM FILE START =============
#
# ==============================================
#
# Created By: Hossam Mahmoud
# Date: 2025-03-02
# Filename: terraform.tfvars
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
vpc_name = "hosa-vpc-terraform"
vpc_cidr = "10.0.0.0/16"

subnets = [
  {
    "public-subnet-1" = {
      name              = "hosa-PubSubTerraform-01"
      cidr_block        = "10.0.1.0/24"
      availability_zone = "us-east-1a"
      type              = "public"
    }
    "private-subnet-1" = {
      name              = "hosa-PriSubTerraform-01"
      cidr_block        = "10.0.2.0/24"
      availability_zone = "us-east-1a"
      type              = "private"
    }
  }
]

instances = [
  {
    name          = "app-server-1",
    ami           = "ami-04b4f1a9cf54c11d0",
    instance_type = "t2.micro"
  },
  {
    name          = "app-server-2",
    ami           = "ami-0abcdef1234567890",
    instance_type = "t2.micro"
  }
]


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
