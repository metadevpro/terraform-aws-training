
resource "aws_s3_bucket" "b" {
  bucket        = var.bucket_name
  force_destroy = true
}

# resource "aws_s3_bucket_acl" "acl1" {
#   bucket = aws_s3_bucket.b.id
#   acl    = "public-read"
# }

resource "aws_s3_bucket_ownership_controls" "own1" {
  bucket = aws_s3_bucket.b.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "acc1" {
  bucket = aws_s3_bucket.b.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "acl1" {
  depends_on = [
    aws_s3_bucket_ownership_controls.own1,
    aws_s3_bucket_public_access_block.acc1,
  ]

  bucket = aws_s3_bucket.b.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "conf1" {
  bucket = aws_s3_bucket.b.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
  provisioner "local-exec" {
    command = "echo Uploading website to ${aws_s3_bucket_website_configuration.conf1.website_endpoint}"
  }
  provisioner "local-exec" {
    command = "aws s3 sync ./www/ s3://${aws_s3_bucket.b.id} --delete --acl public-read"
    # command = "aws s3 sync ./www/ s3://${aws_s3_bucket.b.id} --delete"
  }
}
