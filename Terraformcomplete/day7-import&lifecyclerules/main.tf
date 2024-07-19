resource "aws_instance" "name" {
    ami = "ami-013a28d7c2ea10269"
    instance_type = "t2.micro"
    key_name = "keypair2"
    tags = {
      Name = "ec2"
    }
    lifecycle {
      #prevent_destroy = true
      create_before_destroy = true
      ignore_changes = [ tags ]
    }
}