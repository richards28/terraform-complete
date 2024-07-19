resource "aws_instance" "name" {
    ami = "ami-013a28d7c2ea10269"
    instance_type = "t2.micro"
    key_name = "keypair2"
    for_each = toset(var.box)
    tags = {
      Name = each.value
    }
}