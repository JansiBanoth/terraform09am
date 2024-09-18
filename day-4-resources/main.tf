resource "aws_s3_bucket" "Jansi"{
  bucket = "myshivdhruvbucket"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.Jansi.id
  versioning_configuration {
    status = "Enabled"
  }
}