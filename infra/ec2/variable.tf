variable "ami_id" {
  description = "Provide AMI ID"
}

variable "instance_type" {
  description = "Type of Instance"
}
variable "tag_name" {
  description = "Name of the Tag"
}
variable "public_key" {
  description = "Name of Public key"
}
variable "subnet_id" {
  description = "provide subnet id"
}
variable "sg_enable_ssh_https" {
  description = "Name of the sg for ssh https"
}
variable "enable_public_ip_address" {
  description = "Enable the public keyfor ip address"
}
variable "user_data_install_apache" {
  description = "Give the user data of apache"
}

variable "ec2_sg_name_for_python_api" {
  description = "Define  Ec2 sg name for python API"
}