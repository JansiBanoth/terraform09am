terraform {
  backend "dynamodb_table" {
    encrypt = true   
     bucket = "myshivdhruvbucket"
    dynamodb_table = "terraform-state-lock-dynamo"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}