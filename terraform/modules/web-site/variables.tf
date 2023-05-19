variable "domain_name" {
  type        = string
  description = "Website domain name. Example: example.com"
}

variable "redirect_domain_name" {
  type        = string
  description = "Redirects to the domain set in the variable 'domain_name'. Example: www.example.com"
}
variable "bucket_access_oai" {
  description = "bucket oai"
  type        = list(string)
}
