variable "bucket_name" {
  type = string
  description = "Bucket name"
}

variable "domain_name" {
  type        = string
  description = "Website domain name. Example: example.com"
}

variable "redirect_domain_name" {
  type        = string
  description = "Redirects to the domain set in the variable 'domain_name'. Example: www.example.com"
}
variable "bucket_access_oai" {
  type        = list(string)
  description = "Bucket oai"
}

variable "index_document" {
  type = string
  description = "Index page"
}

variable "error_document" {
  type = string
  description = "Error page"
}
