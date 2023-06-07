output "endpoint" {
  value = aws_s3_bucket_website_configuration.conf1.website_endpoint
}
output "domain" {
  value = aws_s3_bucket_website_configuration.conf1.website_domain
}
