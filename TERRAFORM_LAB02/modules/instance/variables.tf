# ==============================================
#
# =========== TERRAFORM FILE START =============
#
# ==============================================
#
# Created By: Hossam Mahmoud
# Date: 2025-03-03
# Filename: variables.tf
# Description: 
# Version: 1.0.0
# Copyright (c) 2025 Hossam. All rights reserved.
#
# ==============================================
#
# ====== TERRAFORM IMPLEMENTATION START ======
#
# ==============================================

variable "subnet_ids" {
  description = "Mapping of subnet names to IDs"
  type        = map(string)
}

variable "security_ids" {
  description = "Mapping of security group names to IDs"
  type        = map(string)
}

variable "instances" {
  description = "List of instances to create"
  type = list(object({
    name          = string
    ami           = string
    instance_type = string
    subnet_id     = string
    security_name = string
  }))
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
