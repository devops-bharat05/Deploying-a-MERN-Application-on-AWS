output "public_instance_public_ip" {
  value = module.ec2.public_instance_public_ip
}

output "private_instance_id" {
  value = module.ec2.private_instance_id
}

output "security_groups" {
  value = {
    public  = module.security.public_sg_id
    private = module.security.private_sg_id
  }
}
