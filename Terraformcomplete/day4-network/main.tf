#create VPC
resource "aws_vpc" "MY-VPC" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "MY-VPC"
    }
  
}
#create Internetgateway and attach to VPC
resource "aws_internet_gateway" "MY-IG" {
    vpc_id = aws_vpc.MY-VPC.id
    tags = {
      Name = "MY-IG"
    }
  
}
#create subnets public and private
resource "aws_subnet" "publicsubnet" {
    vpc_id = aws_vpc.MY-VPC.id
    cidr_block = "10.0.0.0/24"
    tags = {
        Name ="publicsubnet"
    }
  
}
resource "aws_subnet" "privatesubnet" {
    vpc_id = aws_vpc.MY-VPC.id
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "privatesubnet"
    }
  
}
#create route table and attach IG
resource "aws_route_table" "RT1" {
    vpc_id = aws_vpc.MY-VPC.id
    tags = {
      Name = "RT1"
    }
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.MY-IG.id
    }
  
}
#attach public subnet to public subnet
resource "aws_route_table_association" "ass1" {
    subnet_id = aws_subnet.publicsubnet.id
    route_table_id = aws_route_table.RT1.id
  
}
#create nat gate way in public subnet
resource "aws_nat_gateway" "MY-NAT" {
    allocation_id = aws_eip.name.id
    subnet_id = aws_subnet.publicsubnet.id
    connectivity_type = "public"
    tags = {
        Name = "MY-NAT"
    }
  
}
#define elastic ip
resource "aws_eip" "name" {
    domain = "vpc"
  
}
#create route table and connect to NAT
resource "aws_route_table" "RT2" {
    vpc_id = aws_vpc.MY-VPC.id
    tags  = {
        Name = "RT2"
    }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.MY-NAT.id
  }
}
#attach route tablle 2 to private subnet
resource "aws_route_table_association" "ass2" {
    route_table_id = aws_route_table.RT2.id
    subnet_id = aws_subnet.privatesubnet.id
  
}
resource "aws_security_group" "Sg01" {
    vpc_id = aws_vpc.MY-VPC.id
    name = "allow all traffic"
    description = "security groups for custom vpc"
    
    ingress  {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress  {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_instance" "publicec2" {
    ami = "ami-013a28d7c2ea10269"
    instance_type = "t2.micro"
    key_name = "keypair1"
    associate_public_ip_address = true
    subnet_id = aws_subnet.publicsubnet.id
    vpc_security_group_ids = [aws_security_group.Sg01.id]
    tags = {
        Name = "publicec2"
    }
  
}
resource "aws_instance" "privateec2" {
    ami = "ami-013a28d7c2ea10269"
    instance_type = "t2.micro"
    key_name = "keypair2"
    subnet_id = aws_subnet.privatesubnet.id
    vpc_security_group_ids = [aws_security_group.Sg01.id]
    tags = {
        Name = "privateec2"
    }
  
}


















