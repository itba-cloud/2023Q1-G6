output "lambdas_ids" {
  value = [
    for k, v in aws_lambda_function.this : v.id
  ]
}