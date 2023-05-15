variable "db_connection_string" {
  type = string
}

variable "lambda" {
  type = map(object({
    payload_path   = string
    execution_role = string
  }))
}
