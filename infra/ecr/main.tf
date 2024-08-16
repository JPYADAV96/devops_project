provider "aws" {
  region = var.aws_region
}

resource "aws_ecr_repository" "my_ecr_repo" {
  name                 = var.ecr_repo_name
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "my_ecr_repo_policy" {
  repository = aws_ecr_repository.my_ecr_repo.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Expire images older than 30 days"
        selection = {
          tagStatus    = "any"
          countType    = "imageCountMoreThan"
          countNumber  = 100
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}

output "ecr_repository_url" {
  value       = aws_ecr_repository.my_ecr_repo.repository_url
  description = "URL of the created ECR repository"
}
