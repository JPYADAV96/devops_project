

variable "db_subnet_group_name" {
  description = "Define DB Subnet Group Name"
}

variable "subnet_groups" {
  description = "Provide a subnet group"
}

variable "rds_mysql_sg_id" {
  description = "ID of RDS MSQL SG"
}

variable "mysql_db_identifier" {
  description = "Define MYSQL Identifier"
}

variable "mysql_username" {
  description = "Provide a MYSQL Username"
}

variable "mysql_password" {
  description = "Provide a MYSQL Password"
}

variable "mysql_dbname" {
  description = "Define a Data Base Name"
}