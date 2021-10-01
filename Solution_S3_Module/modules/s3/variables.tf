variable "bucket" {
  description = "S3 Bucket Name"
  type        = string
  default     = null
}

variable "acl" {
  description = "S3 ACL"
  type        = string
  default     = "private"
}

variable "tags" {
  description = "S3 Tags"
  type        = map(string)
  default     = {}
}

variable "versioning" {
  description = "S3 Enable Versioning"
  type        = bool
  default     = true
}
