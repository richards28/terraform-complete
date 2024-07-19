resource "aws_instance" "name" {
    ami = "ami-013a28d7c2ea10269"
    instance_type = "t2.micro"
    key_name = "keypair2"
    count = 2
    tags = {
      Name = "ec2-${count.index}"
    }
}


resource "aws_instance" "name2" {
    ami = "ami-013a28d7c2ea10269"
    instance_type = "t2.micro"
    key_name = "keypair2"
    count = length(var.test2)
    tags = {
      Name = var.test2[count.index]
    }
}
