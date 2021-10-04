variable "instance_type" {
  description = "Instance EC2 Type"
  type        = string
  default     = "t2.micro"
}

variable "availability_zone" {
  description = "Instance EC2 Availability Zone"
  type        = string
  default     = null
}

variable "user_data" {
  description = "Instance EC2 User Data"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "Instance EC2 VPC Security Group IDs"
  type        = string
  default     = null
}
variable "key_name" {
  description = "Instance EC2 Key Name .PEM"
  type        = string
  default     = null
}
variable "volume_type" {
  description = "Instance EC2 Root Volume Type"
  type        = string
  default     = "gp3"
}

variable "volume_size" {
  description = "Instance EC2 Root Volume Size"
  type        = number
  default     = 8
}

variable "encrypted" {
  description = "Instance EC2 Root Volume Encrypted"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Instance EC2 Tags"
  type        = map(string)
  default     = {}
}

variable "attach_second_disk" {
  description = "Attach Second Disk?"
  type        = bool
  default     = false
}

variable "ebs_volume_type" {
  description = "EBS Volume Type"
  type        = string
  default     = "gp3"
}

variable "ebs_volume_size" {
  description = "EBS Volume Size"
  type        = number
  default     = 50
}

variable "ebs_volume_encrypted" {
  description = "EBS Volume Encrypted"
  type        = bool
  default     = true
}

variable "ebs_volume_tags" {
  description = "EBS Volume Tags"
  type        = map(string)
  default     = {}
}

variable "ebs_device_name" {
  description = "EBS Volume Device Name"
  type        = string
  default     = null
}