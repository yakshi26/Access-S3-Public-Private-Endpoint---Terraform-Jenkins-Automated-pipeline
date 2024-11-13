resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name

  website {
    index_document = "index.html"
    # Add other configurations if needed
  }
}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key    = "index.html"
  source = "./index.html"  # Use relative path
  acl    = "public-read"
}


