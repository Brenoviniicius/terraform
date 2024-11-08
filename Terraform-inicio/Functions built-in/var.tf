#Setando as variáveis do terraform
variable "env" {
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

  validation {
    condition = length(var.instance_ami) > 4 && substr(var.instance_ami, 0, 4) == "ami-"
    error_message = "value not valid"
  }
}

#Setando a variavel do tipo da ami
variable "instance_type" {
  type = object ({
    dev = string
    prod = string
  })
  description = "Type of instances to create"
  default = {
    dev = "t2.micro"
    prod = "t2.micro"
  }
}

#Setando A quantidade de instancia será criada
variable "instance_number" {
  type = object ({
    dev = number
    prod = number
  })
  description = "Number of instances to create"
  default = {
    dev = 3
    prod = 1
  }
}

#Setando a variavel tags
variable "instance_tags" {
  type        = map(string)
  description = ""
  default = {
    Name    = "remote"
    Project = "Teste EC2-remote"
  }
}