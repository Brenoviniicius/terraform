#Definindo variaveis locais
locals {
  list_filepath = "list.json"

  common_tags = {
    Service     = var.service
    Environment = var.environment
    Managedby   = "Terraform"
    Owner       = var.owner
  }
}