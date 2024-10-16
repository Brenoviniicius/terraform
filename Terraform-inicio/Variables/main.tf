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

#Declarando o provedor, sua região e o profile configurando no aws CLI
provider "aws" {
    region = "us-east-2"
    profile = "default"
}

#Declarando o tipo de istância que será usada
resource "aws_instace" "instace-test" {
    #Declarando o ID da VM EC2
    ami = "ami-050cd642fd83388e4"
    #Declarando o tipo
    instance_type = "t2.micro"

    tags = {
        name = "Test"
    }
}