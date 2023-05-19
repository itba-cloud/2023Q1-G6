# ---------------------------------------------------------------------------
# Amazon RDS outputs
# ---------------------------------------------------------------------------

output "db_instance_endpoint" {

description = "The connection endpoint"

value = aws_db_instance.this.endpoint

}



output "db_instance_id" {

description = "The RDS instance ID"

value = aws_db_instance.this.id

}

output "db_instance_name" {

description = "The database name"

value = aws_db_instance.this.db_name

}

output "db_instance_username" {

description = "The master username for the database"

value = aws_db_instance.this.username

sensitive = true

}

output "db_instance_port" {

description = "The database port"

value = aws_db_instance.this.port

}

output "db_instance_status" {

description = "The database status"

value = aws_db_instance.this.status

}
output "db_instance_allocated_storage" {

description = "The database status"

value = aws_db_instance.this.allocated_storage

}



