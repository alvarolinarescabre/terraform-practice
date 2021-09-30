module "my-rds" {
    source = "./modules/rds"
}

output "rds_endpoint" {
    value = module.my-rds.endpoint
}
