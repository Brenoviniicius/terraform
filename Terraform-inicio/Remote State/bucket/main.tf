terraform {
  #Declarando a versão necessária para executar o .tf
  required_version = "1.9.7"

  #Declarando o provedor e a versão do provedor do .tf
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.72.0"
    }
  }
}

#Declarando o provedor e a região dele, e o profile configurando no aws.CLI
provider "aws" {
  region  = "us-east-2"
  profile = "default"
}

data "aws_caller_identity" "current" {} 


#Setando o recurso que será usado
resource "aws_s3_bucket" "remote" {
  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"

  tags = {
    description = "s3 remoto"
    name        = "remote-test-bucket"
    Environment = "Dev"
    Managedby   = "Terraform"
  }
}

resource "aws_s3_bucket_acl" "remote" {
  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "remote" {
  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"
  versioning_configuration {
    status = "Enabled"
  }
}
