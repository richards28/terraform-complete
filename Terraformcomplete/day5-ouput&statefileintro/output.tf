output "ec2publicip" {
    value = aws_instance.demo.public_ip
    description = "print ip of demo instance"
}