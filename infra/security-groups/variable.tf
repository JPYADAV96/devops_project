
variable "ec2_sg_name" {
  description = "Define ec2 SG Name"
}

variable "vpc_id" {
  description = "provide VPC ID"
}

variable "public_subnet_cidr_block" {
  description = "Give the CIDR Range for Public Subnet"
}

variable "ec2_sg_name_for_python_api" {
  description = "Provide ec2 SG name for pyhton API"
}