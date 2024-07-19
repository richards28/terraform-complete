resource "aws_instance" "demo" {
    ami = "ami-013a28d7c2ea10269"
    instance_type = "t2.micro"
    key_name = "keypair2"
    tags = {
      Name = "dynamo"
    }
  
}
resource "aws_dynamodb_table" "dynamodb-terraform-state-locking" {
    name = "dynamodb-terraform-state-locking"
    hash_key = "LockID"
    read_capacity = 20
    write_capacity = 20
    attribute {
      name = "LockID"
      type = "S"
    }
}