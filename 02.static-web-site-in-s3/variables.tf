# variable "access_key" {
#     description = "AWS access key"
#     type        = string
#     default     = ""
# }

# variable "secret_key" {
#     description = "AWS secret key"
#     type        = string
#     default     = ""
# }

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-south-2" # Zaragoza
  # default = "eu-west-2" # Irlanda
}

variable "bucket_name" {
  description = "S3 bucket name to use"
  type        = string
  default     = "acme-demo-bucket4"
}
