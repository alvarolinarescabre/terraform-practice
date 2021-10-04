output "private_key_pem" {
  description = "Generated private key pem"
  value       = tls_private_key.this.private_key_pem
  sensitive   = true
}

output "key_name" {
  description = "AWS Key Pair Name"
  value       = aws_key_pair.this.key_name
}