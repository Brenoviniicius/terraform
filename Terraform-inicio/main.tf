provider "aws" {
  region = "us-east-2"
  profile = "default"
}

resource "aws_s3_bucket" "test-bucket" {
    bucket = "first-bucket-15102024"
    acl = "private"

    tags = {
      name      = "test-bucket"
      Environment = "Dev"
      Managedby = "Terraform"
    }
}

