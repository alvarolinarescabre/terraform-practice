variable "allocated_storage" {
  description = "Allocated Storage Size"
  default     = 10
  type        = number
}

variable "engine" {
  description = "DB Engine"
  default     = "mysql"
  type        = string
}

variable "engine_version" {
  description = "DB Engine Version"
  default     = "5.7"
  type        = string
}

variable "instance_class" {
  description = "Instance Class"
  default     = "db.t3.micro"
  type        = string
}

variable "identifier" {
  description = "DB Instance Name"
  default     = "cice-db"
  type        = string
}

variable "db_name" {
  description = "Name of first database"
  default     = "cice_demo"
  type        = string
}

variable "username" {
  description = "DB Username"
  default     = "root"
  type        = string
}

variable "password" {
  description = "DB Username"
  default     = "cice2021"
  type        = string
}

variable "parameter_group_name" {
  description = "DB Parameter Group Name"
  default     = "default.mysql5.7"
  type        = string
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot?"
  default     = true
  type        = bool
}

variable "apply_immediately" {
  description = "Apply change immediately?"
  default     = false
  type        = bool
}

variable "publicly_accessible" {
  description = "Is DB Public?"
  default     = true
  type        = bool
}

variable "sg_name" {
  description = "Security Group Name"
  default     = "CICE Security Group RDS"
  type        = string
}
variable "sg_description" {
  description = "Security Group Description"
  default     = "CICE Security Group RDS from Module"
  type        = string
}
variable "sg_tag" {
  description = "Security Group Tag"
  default     = "CICE Security Group RDS"
  type        = string
}
variable "from_port" {
  description = "Security Group Rule From Port"
  default     = 3306
  type        = number
}
variable "to_port" {
  description = "Security Group Rule To Port"
  default     = 3306
  type        = number
}
variable "protocol" {
  description = "Security Group Rule Protocol"
  default     = "tcp"
  type        = string
}
variable "cidr_blocks" {
  description = "CIDR Blocks"
  default     = ["0.0.0.0/0"]
  type        = list(string)
}

