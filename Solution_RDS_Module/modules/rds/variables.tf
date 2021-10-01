variable "allocated_storage" {
  description = "Allocated Storage Size"
  type        = number
  default     = 10
}

variable "engine" {
  description = "DB Engine"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "DB Engine Version"
  type        = string
  default     = "5.7"
}

variable "instance_class" {
  description = "Instance Class"
  type        = string
  default     = "db.t3.micro"
}

variable "identifier" {
  description = "DB Instance Name"
  type        = string
  default     = "cice-db"
}

variable "db_name" {
  description = "Name of first database"
  type        = string
  default     = "cice_demo"
}

variable "username" {
  description = "DB Username"
  type        = string
  default     = "root"
}

variable "password" {
  description = "DB Username"
  type        = string
  default     = "cice2021"
}

variable "parameter_group_name" {
  description = "DB Parameter Group Name"
  type        = string
  default     = "default.mysql5.7"
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot?"
  type        = bool
  default     = true
}

variable "apply_immediately" {
  description = "Apply change immediately?"
  type        = bool
  default     = false
}

variable "publicly_accessible" {
  description = "Is DB Public?"
  type        = bool
  default     = true
}

variable "sg_name" {
  description = "Security Group Name"
  type        = string
  default     = "CICE Security Group RDS"
}
variable "sg_description" {
  description = "Security Group Description"
  type        = string
  default     = "CICE Security Group RDS from Module"
}
variable "sg_tag" {
  description = "Security Group Tag"
  type        = string
  default     = "CICE Security Group RDS"
}
variable "from_port" {
  description = "Security Group Rule From Port"
  type        = number
  default     = 3306
}
variable "to_port" {
  description = "Security Group Rule To Port"
  type        = number
  default     = 3306
}
variable "protocol" {
  description = "Security Group Rule Protocol"
  type        = string
  default     = "tcp"
}
variable "cidr_blocks" {
  description = "CIDR Blocks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

