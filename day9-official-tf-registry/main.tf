module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-cluster"
  instance_count         = 1

  ami                    = "ami-066784287e358dad1"
  instance_type          = "t2.micro"
  key_name               = "jansi_ec2"
  monitoring             = true
#   vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-0f087760bbe683520"

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
}