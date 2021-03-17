# Configure the AWS Provider
provider "aws" {
  region = var.region
  # profile    = "your-aws-user-account"

  # access_key = "$var.access_key"
  # secret_key = "$var.secret_key"    
}
