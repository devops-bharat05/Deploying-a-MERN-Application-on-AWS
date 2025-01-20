module "vpc" {
  source           = "./modules/vpc"
  cidr_block       = "10.0.0.0/16"
  public_subnet    = "10.0.1.0/24"
  private_subnet   = "10.0.2.0/24"
  availability_zone = "us-west-2a"
}


module "security" {
  source      = "./modules/security"
  vpc_id      = module.vpc.vpc_id
  allowed_ip  = "0.0.0.0/0"  # Replace with your IP
}

module "ec2" {
  source               = "./modules/ec2"
  public_subnet_id     = module.vpc.public_subnet_id
  private_subnet_id    = module.vpc.private_subnet_id
  key_name             = "bharat-home"
  instance_type        = "t2.micro"
  public_security_group_id = module.security.public_sg_id
  private_security_group_id = module.security.private_sg_id
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/ansible/inventory.yml"
  content  = templatefile("${path.module}/ansible/inventory.tpl", {
    public_ip  = module.ec2.public_instance_public_ip,
    private_ip = module.ec2.private_instance_private_ip
  })
}

resource "null_resource" "run_ansible" {
  provisioner "local-exec" {
    command = "ansible-playbook -i ansible/inventory.yml ansible/playbooks/deploy_app.yml"
  }

  depends_on = [module.ec2, module.security]
}

