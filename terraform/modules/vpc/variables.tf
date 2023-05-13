# Input variable definitions

variable "cidr_block" {
  description = "CIDR block of the VPC."
  type        = string
  default     = "10.0.0.0/16"
}
# ?????
# variable "subnet_cidr_block" {
#   description = "CIDR block of the VPC subnet."
#   type        = string
#   default     = "10.0.0.0/24"
# }


variable "zones_count" {
  description = "Number of zones."
  type        = number
  default     = 2
}
