terraform {
  required_version = "1.9.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.72.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_instance" "remote-test" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  tags          = var.instace_tags
}