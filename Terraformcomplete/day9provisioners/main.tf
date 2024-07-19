resource "aws_instance" "name" {
    ami = "ami-013a28d7c2ea10269"
    instance_type = "t2.micro"
    key_name = "keypair2"
    tags = {
      Name = "ec2"
    }
    provisioner "local-exec" {
        command = "touch file50"
      
    }
    provisioner "remote-exec" {
        inline = [ "touch file20" ]
      
    }
    provisioner "file" {
        source = "file20"
        destination = "/home/file20"
      
    }

}
