variable "name" {
  description = "Security Group Name"
  type        = string
  default     = null
}

variable "description" {
  description = "Security Group Description"
  type        = string
  default     = null
}

variable "tags" {
  description = "Security Group Tags"
  type        = map(string)
  default     = {}
}

variable "rules" {
  description = "Rule for Security Group"
  type = map(any)
  default = null
}