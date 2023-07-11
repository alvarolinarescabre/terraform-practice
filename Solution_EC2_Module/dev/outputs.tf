output "webserver_public_ip" {
  description = "Webserver Public IP"
  value = module.webserver.ec2_public_ip
}

output "webserver_key_pairs" {
  description = "Webserver Key Pairs Private Name"
  value = module.key_pairs.key_name
}
