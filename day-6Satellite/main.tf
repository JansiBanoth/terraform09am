resource "aws_instance" "test" {
    ami = "ami-066784287e358dad1"
    instance_type = "t2.micro"
  availability_zone = "us-east-1a"
key_name = "jansi_ec2"

tags = {
    name = "testbackend"
}
}
