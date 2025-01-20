variable "aws_region" {
  default = "us-west-2"
}

variable "key_name" {
  description = "Name of the key pair for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}
