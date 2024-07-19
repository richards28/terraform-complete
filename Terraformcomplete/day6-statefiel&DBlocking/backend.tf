terraform {
  backend "s3" {
    bucket = "stephen.richards"
    key = "dblocking2/terraform.tfstate"
    region = "ap-northeast-1"
    dynamodb_table = "dynamodb-terraform-state-locking"
    encrypt = true
    
  }
}