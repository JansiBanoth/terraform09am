module "test" {
    source = "../day-2-all.tf-files"
    ami = "ami-066784287e358dad1"
    type = "t2.micro"
}