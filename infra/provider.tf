provider "aws" {
  region                   = "eu-central-1"
  /*shared_credentials_files = ["/Users/rahulwagh/.aws/credentials"]*/
}

terraform {
  required_version = ">= 0.12"

}