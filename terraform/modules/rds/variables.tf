# ---------------------------------------------------------------------------
# Amazon RDS variables
# ---------------------------------------------------------------------------

variable "zones_count" {
  description = "Number of zones."
  type        = number
  default     = 2
}
variable "aws_region" {
  description = "AWS Region in which to deploy the application"
  type        = string
}

variable "vpc_cidr" {
  description = "The value of the vpc the db is to be deployed in" 
  type = string
}
variable "vpc_id" {
  description = "The value of the id of the VPC" 
  type = string
}

# variable "vpc_subnet_cidr" {
#   description = "The value of the vpc subnet the db is to be deployed in" 
#   type = string
# }
variable "vpc_subnet_ids" {
  description = " The value of the id of the VPC subnet" 
  type = list(string)
}
