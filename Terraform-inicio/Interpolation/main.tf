terraform {
  #Declarando a versão necessária para executar o .tf
  required_version = "1.9.7"

  #Declarando o provedor e a versão do provedor do .tf
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.72.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
