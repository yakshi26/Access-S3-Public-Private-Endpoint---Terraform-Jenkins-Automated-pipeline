resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name
  # Remove acl from here
website {
    index_document = "index.html"
    # other configurations if needed
  }
}

resource "aws_s3_bucket_object" "index_html" {
  bucket = aws_s3_bucket.static_website.bucket
  key    = "index.html"
  source = "D:\html\portfolio\personal-portfolio-img\index.html"  # Local file to upload to S3
  acl    = "public-read"
}
