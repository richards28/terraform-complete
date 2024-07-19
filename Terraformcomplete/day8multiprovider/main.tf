resource "aws_instance" "demo" {
    ami = "ami-013a28d7c2ea10269"
    instance_type = "t2.micro"
    key_name = "keypair2"
    provider = aws.Nvirginia
    tags = {
      Name = "ec2"
    }
  
}