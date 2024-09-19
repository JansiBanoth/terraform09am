resource "aws_instance" "dependent" {
    ami = "ami-066784287e358dad1"
    instance_type = "t2.micro"
    key_name = "jansi_ec2"
}

resource "aws_s3_bucket" "dependent" {
    bucket = "MyShivDhruvBucketterraform"
  
}