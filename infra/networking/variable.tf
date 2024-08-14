
# Variables
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  description = "Name of the VPC"
}

variable "cidr_public_subnet" {
  description = "List of CIDR blocks for public subnets"
}

variable "cidr_private_subnet" {
  description = "List of CIDR blocks for private subnets"
}

variable "eu_availability_zone" {
  description = "List of availability zones"
}
