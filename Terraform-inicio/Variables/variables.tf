#Setando as variáveis do terraform

variable "environment" {
  type        = string
  description = ""
}

#Setando a variavel de região
variable "aws_region" {
  type        = string
  description = ""
}

#Setando a variavel do profile
variable "aws_profile" {
  type        = string
  description = ""
}

#Setando a variavel da ami
variable "instance_ami" {
  type        = string
  description = ""
}

#Setando a variavel do tipo da ami
variable "instance_type" {
  type        = string
  description = ""
}

#Setando a variavel tags
variable "instace_tags" {
  type        = map(string)
  description = ""
  default = {
    Name    = "Ubuntu"
    Project = "Teste EC2"
  }
}