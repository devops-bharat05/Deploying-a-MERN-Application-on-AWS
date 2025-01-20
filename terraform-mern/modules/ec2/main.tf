resource "aws_instance" "public_instance" {
  ami           = "ami-00c257e12d6828491" # Replace with a valid AMI
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name
  security_groups = [var.public_security_group_id]

  tags = {
    Name = "mern-public-instance"
  }
}

resource "aws_instance" "private_instance" {
  ami           = "ami-00c257e12d6828491" # Replace with a valid AMI
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  key_name      = var.key_name
  security_groups = [var.private_security_group_id]

  tags = {
    Name = "mern-private-instance"
  }
}
