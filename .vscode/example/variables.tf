variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "vpcs" {
  type = map(object({
    cidr_block = string
  }))
}
