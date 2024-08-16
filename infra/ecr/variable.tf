variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "eu-central-1"
}

variable "ecr_repo_name" {
  description = "The name of the ECR repository"
  type        = string
  default     = "my-ecr-repo"
}
