# ==============================================
#
# =========== TERRAFORM FILE START =============
#
# ==============================================
#
# Created By: Hossam Mahmoud
# Date: 2025-02-28
# Filename: main.tf
# Description: Calls the networking and compute modules
# Version: 1.0.0
# Copyright (c) 2025 Hossam. All rights reserved.
#
# ==============================================
#
# ====== TERRAFORM IMPLEMENTATION START ======
#
# ==============================================

provider "aws" {
  region = var.region
}

module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr       = var.vpc_cidr
  vpc_name       = var.vpc_name
  subnet_configs = var.subnet_configs
}


module "instances" {
  source = "./modules/instance"
  instances = [
    {
      name          = "app-server-1"
      ami           = var.ami_id
      instance_type = var.instance_type
      subnet_id     = module.vpc.subnet_ids["public-subnet-1"]
    },
    {
      name          = "app-server-2"
      ami           = var.ami_id
      instance_type = var.instance_type
      subnet_id     = module.vpc.subnet_ids["private-subnet-1"]
    }
  ]
}





module "security_groups" {
  source   = "./modules/security_groups"
  vpc_id   = module.vpc.vpc_id
  vpc_cidr = var.vpc_cidr
}


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
