resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
  
}
resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "subnet1"
    }
}
data "aws_subnet" "subnet1" {
    filter {
      name = "tag:Name"
      values = ["subnet1"]
    }
  
}
#second time apply from below as we need to create subnet to call
resource "aws_instance" "ec2" {
    ami = "ami-013a28d7c2ea10269"
    instance_type = "t2.micro"
    key_name = "keypair2"
    subnet_id = data.aws_subnet.subnet1.id
    tags = {
      Name = "ec2"
    }
}