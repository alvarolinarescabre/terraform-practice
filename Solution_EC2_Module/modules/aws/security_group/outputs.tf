output "arn" {
  description = "Security Group ARN"
  value       = aws_security_group.this.arn
}

output "id" {
  description = "Security Group ID"
  value       = aws_security_group.this.id
}
