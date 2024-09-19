resource "aws_s3_bucket" "dependent" {
    bucket = "bucketterraform5555"
   
}

resource "aws_instance" "dependent" {
    ami = "ami-066784287e358dad1"
    instance_type = "t2.micro"
    key_name = "jansi_ec2"
    depends_on = [ aws_s3_bucket.dependent ]
}

