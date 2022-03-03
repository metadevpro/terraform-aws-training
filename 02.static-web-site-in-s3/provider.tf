# Configure the AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = "eu-west-3" # Paris
  # profile    = "your-aws-user-account"

  # access_key = "$var.access_key"
  # secret_key = "$var.secret_key"
}
