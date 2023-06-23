# ---------------------------------------------------------------------------
# Lambdas
# ---------------------------------------------------------------------------
resource "aws_lambda_function" "this" {
  for_each = var.lambda

  function_name    = each.key
  filename         = each.value.payload_path
  handler          = each.key
  runtime          = "nodejs16.x"
  source_code_hash = filebase64sha256("${each.value.payload_path}")
  role             = each.value.execution_role

  lifecycle {
    create_before_destroy = true
  }

  environment {
    variables = {
      db_connection_string = "${var.db_connection_string}"
    }
  }
}
