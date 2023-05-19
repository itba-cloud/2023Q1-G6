
resource "aws_db_instance" "this" {
  allocated_storage     = local.allocated_storage
  max_allocated_storage = local.max_allocated_storage
  multi_az              = true
  db_name               = local.db_name
  engine                = local.engine
  engine_version        = local.engine_version
  instance_class        = local.instance_class
  username              = local.db_user
  password              = local.db_password
  port                  = local.db_port
  db_subnet_group_name  = aws_db_subnet_group.this.name

  skip_final_snapshot = false

  tags = {
    name = local.db_name
  }
}

resource "aws_db_subnet_group" "this" {
  name       = "db_subnet_group"
  subnet_ids = var.vpc_subnet_ids

  tags = {
    name = "db_subnet_group"
  }
}

resource "aws_db_proxy" "db_proxy" {
  name                = "${local.db_name}-proxy"
  debug_logging       = false
  engine_family       = local.engine
  idle_client_timeout = 1800
  require_tls         = true
  role_arn            = aws_iam_role.rds_proxy_role.arn
  # vpc_security_group_ids = [aws_security_group.example.id]
  vpc_subnet_ids = var.vpc_subnet_ids


  auth {

  }

  tags = {
    name = "${local.db_name}-proxy"
  }
}

resource "aws_db_proxy_default_target_group" "db_proxy_default_target_group" {
  db_proxy_name = aws_db_proxy.db_proxy.name

}

resource "aws_db_proxy_target" "proxy_target" {
  db_instance_identifier = aws_db_instance.this.id
  db_proxy_name          = aws_db_proxy.db_proxy.name
  target_group_name      = aws_db_proxy_default_target_group.db_proxy_default_target_group.name
}

resource "aws_db_proxy_endpoint" "proxy_endpoint" {
  db_proxy_name          = aws_db_proxy.db_proxy.name
  db_proxy_endpoint_name = "proxy-endpoint"
  vpc_subnet_ids         = var.vpc_subnet_ids
}

resource "aws_iam_role" "rds_proxy_role" {
  name = "RDSProxyRole"

  assume_role_policy = data.aws_iam_policy_document.example.json
}
data "aws_iam_policy_document" "example" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["rds.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "rds_proxy_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSDataFullAccess"
  role       = aws_iam_role.rds_proxy_role.name
}
