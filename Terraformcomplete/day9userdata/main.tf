resource "aws_instance" "name" {
    ami = "ami-0f75d1a8c9141bd00"
    instance_type = "t2.micro"
    key_name = "keypair2"
    user_data = file("script.sh")
    tags = {
      Name = "ec2"
    }
}
