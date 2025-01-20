resource "aws_security_group" "public_sg" {
  name        = "mern-public-sg"
  vpc_id      = var.vpc_id
  description = "Allow HTTP and SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mern-public-sg"
  }
}

resource "aws_security_group" "private_sg" {
  name        = "mern-private-sg"
  vpc_id      = var.vpc_id
  description = "Allow MongoDB access from public instance"

  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    source_security_group_id = aws_security_group.public_sg.id
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mern-private-sg"
  }
}

resource "aws_iam_role" "ec2_role" {
  name = "mern-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "mern-ec2-role"
  }
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "mern-ec2-instance-profile"
  role = aws_iam_role.ec2_role.name
}
