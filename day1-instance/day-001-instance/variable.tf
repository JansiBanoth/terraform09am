variable "ami" {
  description = "inserting values to main.tf"
  type = string
  default = "ami-066784287e358dad1"
}

variable "type" {
  type = string
  default = "t2.micro"
}

variable "key" {
  type = string
  default = "jansi_ec2"
}