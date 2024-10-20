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

  backend "s3" {
    bucket  = "tfstate-084828603840"
    key     = "backend/dev/terraform.tfstate"
    region  = "us-east-2"
    profile = "default"
  }
}


#Declarando o provedor e a região dele, e o profile configurando no aws.CLI
provider "aws" {
  region  = "us-east-2"
  profile = "default"
}

data "aws_caller_identity" "current" {}


#Recurso do bucket
resource "aws_s3_bucket" "remote" {
  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"

  tags = {
    description = "s3 remoto"
    name        = "remote-test-bucket"
    Environment = "Dev"
    Managedby   = "Terraform"
  }
}

#Recurso da visiabilidade
#resource "aws_s3_bucket_acl" "remote" {
#bucket = "tfstate-${data.aws_caller_identity.current.account_id}"
#acl    = "private"
#}

#Definindo o recurso remoto do bucket
resource "aws_s3_bucket_versioning" "remote" {
  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"
  versioning_configuration {
    status = "Enabled"
  }
}

output "remote_state_bucket" {
  value = aws_s3_bucket.remote.bucket
}

output "remote_state_bucket_arn" {
  value = aws_s3_bucket.remote.arn
}