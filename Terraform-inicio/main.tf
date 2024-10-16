terraform {
  #Declarando a versão necessária para executar o .tf
  required_version = "1.9.7"
  
  #Declarando o provedor e a versão do provedor do .tf
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.72.0"
    }
  }
}

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

