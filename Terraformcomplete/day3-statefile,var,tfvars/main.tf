resource "aws_instance" "demo" {
    ami = var.ami
    instance_type = var.type
    key_name = var.key
    tags = {
      Name = "ec2"
    }
  
}