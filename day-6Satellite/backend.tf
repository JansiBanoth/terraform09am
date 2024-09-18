terraform {
  backend "s3" {
    bucket = "myshivdhruvbucket"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-lock-dynamo"
    encrypt = true
  }
}