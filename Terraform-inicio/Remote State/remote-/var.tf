#Setando as variáveis do terraform
variable "environment" {
  type        = string
  description = ""
  default     = "dev"
}

#Setando a variavel de região
variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-2"
}

#Setando a variavel do profile
variable "aws_profile" {
  type        = string
  description = ""
  default     = "default"
}

#Setando a variavel da ami
variable "instance_ami" {
  type        = string
  description = ""
  default     = "ami-0ea3c35c5c3284d82"
}

#Setando a variavel do tipo da ami
variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro"
}

#Setando a variavel tags
variable "instace_tags" {
  type        = map(string)
  description = ""
  default = {
    Name    = "remote"
    Project = "Teste EC2-remote"
  }
}