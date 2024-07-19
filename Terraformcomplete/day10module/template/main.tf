resource "aws_instance" "ec2" {
    ami = var.ai
    instance_type = var.ty
    key_name = var.ky
    tags = {
      Name = "ec2"
    }
}