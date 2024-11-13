resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name
  # Remove acl from here
website {
    index_document = "index.html"
    # other configurations if needed
  }
}
