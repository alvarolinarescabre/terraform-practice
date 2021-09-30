output "endpoint" {
  description = "Endpoint from RDS"
  value       = aws_db_instance.default.endpoint
}