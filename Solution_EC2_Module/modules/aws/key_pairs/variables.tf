variable "key_name" {
  description = "EC2 Instance Key Name"
  type        = string
  default     = null
}

variable "filename" {
  description = ".PEM Key filename and path"
  type        = string
  default     = null
}

variable "file_permission" {
  description = ".PEM Key file permission"
  type        = string
  default     = "0400"
}