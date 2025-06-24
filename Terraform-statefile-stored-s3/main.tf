provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-statefile-stored-s3"
    key = "state/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-lock"
    encrypt = true
  }
}