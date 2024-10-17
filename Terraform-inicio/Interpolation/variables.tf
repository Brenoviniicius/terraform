#Declarando as variaveis
variable "aws_profile" {
  type        = string
  description = ""
  default = "default"
}

variable "aws_region" {
  type        = string
  description = ""
  default = "us-east-2"
}

variable "environment" {
  type        = string
  description = ""
  default = "dev"
}

variable "acl_bucket" {
  type        = string
  description = ""
  default = "private"
}

variable "service" {
  type        = string
  description = ""
  default = "Teste"
}

variable "owner" {
  type        = string
  description = ""
  default = "Breno Vinícius"
}