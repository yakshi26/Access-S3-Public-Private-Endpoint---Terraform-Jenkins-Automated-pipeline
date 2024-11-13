resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name

  website {
    index_document = "index.html"
    # Add other configurations if needed
  }
}

resource "aws_s3_bucket_object" "index_html" {
  bucket = aws_s3_bucket.my_bucket.bucket  # Reference the correct bucket
  key    = "index.html"
  source = "D:/html/portfolio/personal-portfolio-img/index.html"  # Ensure the correct file path for your local machine
  acl    = "public-read"  # Optional: If you want it publicly accessible
}

