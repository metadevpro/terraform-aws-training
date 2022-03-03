resource "aws_s3_bucket" "b" {
  bucket        = var.bucket_name
  force_destroy = true

  provisioner "local-exec" {
    command = "aws s3 sync ./www/ s3://${aws_s3_bucket.b.id} --delete --acl public-read"
  }

}
resource "aws_s3_bucket_acl" "b" {
  bucket = aws_s3_bucket.b.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "b" {
  bucket = aws_s3_bucket.b.id
  
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  provisioner "local-exec" {
    command = "echo Uploading website to ${aws_s3_bucket_website_configuration.b.website_endpoint}"
  }
}