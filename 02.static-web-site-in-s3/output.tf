output "endpoint" {
  value = aws_s3_bucket_website_configuration.b.website_endpoint
}
output "domain" {
  value = aws_s3_bucket_website_configuration.b.website_domain
}
