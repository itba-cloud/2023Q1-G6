variable "availability_zone" {
  type        = string
  default     = "1"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnets" {
  type = map(string)
  default = {
    "lambdas" = "10.0.0.0/24"
  }
}
