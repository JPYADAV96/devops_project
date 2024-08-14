#variable

variable "lb_name" {
  description = "Name of the LB"
}

variable "lb_type" {
  description = "Load Balancer Type"
}
variable "is_external" {
  description = ""
  default = false
}
variable "sg_enable_ssh_https" {
  description = "Enable sg_ssh_https"
}

variable "subnet_ids" {
  description = "value of subnet ids"
}
variable "tag_name" {
  description = "Write a tag name"
}
variable "lb_target_group_arn" {
  description = "provide lb_target_group_arn"
}
variable "ec2_instance_id" {
  description = "write a ec2 instance id"
}

variable "lb_listner_port" {
  description = "Give the value of lb_listner_port"
}

variable "lb_listner_protocol" {
  description = "Give the value of lb_listener_protocol"
}

variable "lb_listner_default_action" {
  description = " value of default_action"
}
variable "lb_https_listner_port" {
  description = "Give lb_https_listner_port"
}

variable "lb_https_listner_protocol" {
  description = "Give value of lb_https_listner_protocol"
}
variable "dev_proj_1_acm_arn" {
  description = "Give value of dev_proj_1_acm_arn"
}
variable "lb_target_group_attachment_port" {
  description = "Give value of lb_target_group_attachment_port"
}