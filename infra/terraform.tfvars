bucket_name = "dev-proj-1-remote-state-bucket-1234563"
name        = "environment"
environment = "dev-1"

vpc_cidr             = "10.0.0.0/16"
vpc_name             = "dev-proj-eu-central-vpc-1"
cidr_public_subnet   = ["10.0.1.0/24", "10.0.2.0/24"]
cidr_private_subnet  = ["10.0.3.0/24", "10.0.4.0/24"]
eu_availability_zone = ["eu-west-1a", "eu-west-1b"]

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5Y2T6CtYBsncZ8SI6xN2zECoIn487qpIIi3KP9cMgeYwLJmkfGXus+3TXRyhSI2jKs265jzOvvgRdHqxFJfdpxcAOzjGprN3H9J26vFCVvOybxv0jsbcp3Eh90TMg5jrXlo5gaJXxLkLouFM+0/AxsdSbMjWq5G4C+WghZmRfc1FNCPu2NN29r5QLlr4VXI5N1kBScmWlsC7csQFQLWgaW+DSJAucbWL2Zol+iFZ9l1v+bPFpd2KFsDj5WX9449xb+yXy9ry9/Jc2wPSJ6uLXrGYO3EIGUnanDwBpSY88zebQ757sgrq0MeMJerix7AlqHauql5JZMdzeUvmu/KxlG6e2YQvj+R2uOXbo2jDJVrAW1VrWFEkA5ZxyMamFClTTw1L/9PjOiSnYYUW93XiqGw32OGOhNPkmPPJCFcV7MlEX1lqOlT3LwcYFqkFlIqm+8OA5JtW9GE/PKbVH/9MUr5UXAKipSDuOWuLzesKdpl1xoVFcLui5q//3Ro+jqUM= vikash@vikash-Inspiron-15-3511"
ec2_ami_id     = "ami-0c38b837cd80f13bb"

ec2_user_data_install_apache = ""

domain_name = "rishikanaujia.com"