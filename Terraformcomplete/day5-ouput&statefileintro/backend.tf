terraform {
  backend "s3" {
    bucket = "stephen.richards"
    key = "demo/terraform.tfstate"
    region = "ap-northeast-1"
  }
}