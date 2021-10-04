output "ec2_public_ip" {
  description = "EC2 Public IP"
  value       = module.cice_instance.ec2_public_ip
}

output "ec2_public_dns" {
  description = "EC2 Public DNS"
  value       = module.cice_instance.ec2_public_dns
}

output "ec2_tags" {
  description = "EC2 Tags"
  value       = module.cice_instance.ec2_tags
}
