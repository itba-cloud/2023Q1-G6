
resource "aws_db_instance" "this" {
  allocated_storage    = local.allocated_storage
  max_allocated_storage = local.max_allocated_storage
  multi_az = true
  db_name              = local.db_name
  engine               = local.engine
  engine_version       = local.engine_version
  instance_class       = local.instance_class
  username             = local.db_user
  password             = local.db_password
  port     = local.db_port
  
  skip_final_snapshot  = false

  tags = {
    name = aws_db_instance.this.db_name
  }
}

resource "aws_db_proxy" "db_proxy" {
  name                   = "${local.db_name}-proxy"
  debug_logging          = false
  engine_family          = local.engine
  idle_client_timeout    = 1800
  require_tls            = true
  # role_arn               = aws_iam_role.example.arn
  # vpc_security_group_ids = [aws_security_group.example.id]
  vpc_subnet_ids         = [var.vpc_id]

  tags = {
    name = aws_db_proxy.db_proxy.name
  }
}
