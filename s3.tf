resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name
 
}

resource "aws_s3_object" "my_file" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key    = "1311file.html"
  source = "C:/Users/91996/Desktop/new html/digital watch/dg.html"  
}
