# ==============================================
#
# =========== TERRAFORM FILE START =============
#
# ==============================================
#
# Created By: Hossam Mahmoud
# Date: 2025-03-03
# Filename: main.tf
# Description: 
# Version: 1.0.0
# Copyright (c) 2025 Hossam. All rights reserved.
#
# ==============================================
#
# ====== TERRAFORM IMPLEMENTATION START ======
#
# ==============================================

resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.port
      to_port     = egress.value.port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
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
