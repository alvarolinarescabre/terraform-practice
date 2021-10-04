variable "ebs_volume_size" {
  description = "EBS Volume Size"
  type        = map(number)
  default     = {
      "dev" = 50,
      "pre" = 100
  }
}