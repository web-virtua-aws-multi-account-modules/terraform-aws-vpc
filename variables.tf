
variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "cidr_block" {
  description = "Cidr Block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  description = "Enable DNS Hostnames"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Enable DNS Support"
  type        = bool
  default     = true
}

variable "enable_network_address_usage_metrics" {
  description = "Enable network address usage metrics"
  type        = bool
  default     = false
}

variable "assign_generated_ipv6_cidr_block" {
  description = "Assign generated ipv6 cidr block"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to VPC"
  type        = map(any)
  default     = {}
}

variable "ou_name" {
  description = "Organization unit name"
  type        = string
  default     = "no"
}
