output "db_instance_endpoint" {
  description = "The connection endpoint"
  value  = try(aws_db_instance.postgresql_ab_diplom.endpoint, null)
}

# output "public_ip" {
#   value = aws_instance.instance_ab_diplom_ubuntu.public_ip
# }
