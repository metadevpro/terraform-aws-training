resource "aws_s3_bucket" "b" {
  bucket        = var.bucket_name
  acl           = "public-read"
  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  provisioner "local-exec" {
    command = "echo Uploading website to ${aws_s3_bucket.b.website_endpoint}"
  }
  provisioner "local-exec" {
    command = "aws s3 sync ./www/ s3://${aws_s3_bucket.b.id} --delete --acl public-read"
  }
}