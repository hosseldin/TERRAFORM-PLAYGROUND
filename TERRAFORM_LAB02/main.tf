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

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "subnets" {
  source  = "./modules/subnets"
  vpc_id  = module.vpc.vpc_id
  subnets = var.subnets
}

module "security_groups" {
  source   = "./modules/security_groups"
  vpc_id   = module.vpc.vpc_id
  vpc_cidr = var.vpc_cidr
}

module "instances" {
  source        = "./modules/instances"
  ami           = var.ami
  instance_type = var.instance_type
  subnet_ids    = values(module.subnets.subnet_ids)
  instances     = var.instances
  sg_id         = module.security_groups.sg_id
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
