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

resource "aws_instance" "instance" {
  count = length(var.instances)

  ami                    = var.instances[count.index].ami
  instance_type          = var.instances[count.index].instance_type
  subnet_id              = var.subnet_ids[var.instances[count.index].subnet_name]
  vpc_security_group_ids = [var.security_ids[var.instances[count.index].security_name]]

  tags = {
    Name = var.instances[count.index].name
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
