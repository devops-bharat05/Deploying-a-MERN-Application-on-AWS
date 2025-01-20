variable "public_subnet_id" {}
variable "private_subnet_id" {}
variable "key_name" {}
variable "instance_type" {}
variable "public_security_group_id" {
  description = "ID of the security group for public instances"
}

variable "private_security_group_id" {
  description = "ID of the security group for private instances"
}
