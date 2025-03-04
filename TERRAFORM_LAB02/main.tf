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
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  vpc_name            = var.vpc_name
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
}

module "public_instance" {
  source        = "./modules/instances"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnet_id # Attach to Public Subnet
  instance_name = "public-ec2-instance"
}

module "private_instance" {
  source        = "./modules/instances"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.private_subnet_id # Attach to Private Subnet
  instance_name = "private-ec2-instance"
}


module "instances" {
  source     = "./modules/instances"
  instances  = var.instances
  subnet_ids = module.subnets.subnet_ids
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
