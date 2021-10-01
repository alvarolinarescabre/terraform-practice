module "my-s3" {
  source = "./s3"
}

output "s3_bucket_id" {
  value = module.my-s3.s3_bucket_id
}

output "s3_bucket_arn" {
  value = module.my-s3.s3_bucket_arn
}

output "s3_bucket_bucket_domain_name" {
  value = module.my-s3.s3_bucket_bucket_domain_name
}

output "s3_bucket_region" {
  value = module.my-s3.s3_bucket_region
}
