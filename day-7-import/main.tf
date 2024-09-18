resource "aws_instance" "dev" {
  ami = "ami-0ebfd941bbafe70c6"
  instance_type = "t2.micro"
  key_name = "jansi_ec2"

  tags = {
    name = "EKs"
  }
}