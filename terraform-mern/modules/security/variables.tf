variable "vpc_id" {
  description = "ID of the VPC"
}

variable "allowed_ip" {
  description = "Allowed IP for SSH access"
  default     = "0.0.0.0/0"
}
