terraform {
  backend "s3" {
    bucket = "myshivdhruvbucket"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}