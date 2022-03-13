variable "vm_name" {
  default = ""
}
resource "aws_instance" "mod_virtual_machine" {
  ami = var.mod_virtual_machine_ami
  associate_public_ip_address = var.mod_virtual_machine_associate_public_ip_address
  availability_zone = var.mod_virtual_machine_availability_zone
  disable_api_termination = var.mod_virtual_machine_disable_api_termination
  ebs_optimized = var.mod_virtual_machine_ebs_optimized
  instance_type = var.mod_virtual_machine_instance_type
  subnet_id = var.mod_virtual_machine_subnet_id
  security_groups = var.mod_virtual_machine_security_groups
  tenancy = var.mod_virtual_machine_instance_tenancy

  key_name = var.mod_virtual_machine_key_name

  tags = {
    Name = join("", [var.stack_prefix, var.vm_name, "vm"])
    Environment = var.stack_environment
    Role = join("", [var.stack_prefix, "virtual_machine"])
    Cost_Center = var.stack_cost_center
  }
}