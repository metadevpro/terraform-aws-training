# Configure the AWS Provider
provider "aws" {
  region = "eu-west-3" # Paris
  # version = "~> 3.0" # Uncomment this if you'd like to use an old version instead of refactoring the s3 config
  # profile    = "your-aws-user-account"

  # access_key = "$var.access_key"
  # secret_key = "$var.secret_key"
}
