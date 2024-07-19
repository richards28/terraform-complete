resource "aws_instance" "demo" {
    ami = "ami-013a28d7c2ea10269"
    instance_type = "t2.micro"
    key_name = "keypair2"
    tags = {
      Name = "demo"
    }
    depends_on = [ aws_instance.demo22 ]
  
}
resource "aws_instance" "demo22" {
    ami = "ami-013a28d7c2ea10269"
    instance_type = "t2.micro"
    key_name = "keypair1"
    tags = {
      Name = "demo22"
    }
  
}