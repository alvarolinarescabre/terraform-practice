output "instance_ip" {
  description = "The public ip for ssh access"
  value       = aws_instance.cice-instance.public_ip
}

output "key_name" {
  description = "Name of SSH key"
  value       = aws_key_pair.generated_key.key_name
}
