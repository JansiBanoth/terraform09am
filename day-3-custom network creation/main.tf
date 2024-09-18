#--------custom network creation----------
# create vpc
resource "aws_vpc" "cust" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dev"
  }
}
# create internet gateway and attach to vpc
resource "aws_internet_gateway" "cust" {
  vpc_id = aws_vpc.cust.id
  tags = {
    Name = "cust_ig"
  }
}

# create subnets
resource "aws_subnet" "cust" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.cust.id
   availability_zone = "us-east-1a"
  tags = {
    Name = "cust_subnet"
  }
  }

resource "aws_subnet" "cust1" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.cust.id
  availability_zone = "us-east-1b"
  tags = {
    Name = "cust_subnet"
  }
  }

# create route tables and attach to ig edit routes

resource "aws_route_table" "name" {
  vpc_id = aws_vpc.cust.id

  route {
    gateway_id = aws_internet_gateway.cust.id
    cidr_block = "0.0.0.0/0"
  }
}


# subnet associations add subnets into RT
resource "aws_route_table_association" "cust" {
   route_table_id = aws_route_table.name.id
  subnet_id = aws_subnet.cust.id
 
}

# create security groups
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  vpc_id      = aws_vpc.cust.id
  tags = {
    Name = "dev_sg"
  }
 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }


egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }


  }
  

# launch instance
resource "aws_instance" "prod" {
  ami = "ami-066784287e358dad1"
instance_type = "t2.micro"
key_name = "jansi_ec2"
subnet_id = aws_subnet.cust.id
vpc_security_group_ids = [aws_security_group.allow_tls.id]
}