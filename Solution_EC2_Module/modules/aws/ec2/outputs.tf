output "ec2_public_ip" {
  description = "EC2 Public IP"
  value       = aws_instance.this.public_ip
}

output "ec2_public_dns" {
  description = "EC2 Public DNS"
  value       = aws_instance.this.public_dns
}

output "ec2_tags" {
  description = "Get Instance Tags"
  value       = aws_instance.this.tags_all
}

output "ec2_instance_id" {
  description = "Get Instance ID"
  value       = data.aws_instance.this.instance_id
}

output "ec2_instance_ami" {
  description = "Get Instance AMI"
  value       = data.aws_instance.this.ami
}

output "last_amazon_linux_ami_name" {
  description = "Get Last Amazon Linux AMI Name"
  value       = data.aws_ami.amazon_linux.name
}
