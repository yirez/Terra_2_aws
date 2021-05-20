
###
# ** Covers attr tests **
# Created an eip
# whitelisted that eip's public ip in a new sec group
# created an ec2 instance
# associated the eip.id with the new instance
###
###  **************STANDARD AWS START******************  ###
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.41.0"
    }
  }
}

variable "access_key" {
  description = "The access_key of our user defined in IMA"
  type        = string
  sensitive = true
}
variable "secret_key" {
  description = "The secret_key of our user defined in IMA"
  type        = string
  sensitive = true
}
provider "aws" {
  region = "eu-central-1"
  access_key = var.access_key
  secret_key = var.secret_key
}
###  **************STANDARD AWS END******************  ###


resource "aws_instance" "this_is_a_name" {
  ami = "ami-043097594a7df80ec"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sec_group_block.id]
tags = {
    Name = "HelloWorld"
  }
}

resource "aws_eip" "eip"{
  vpc=true
}

resource "aws_security_group" "sec_group_block" {
  name        = "custom_sec_group"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["${aws_eip.eip.public_ip}/32"]
  }

  tags = {
    Name = "custom_sec_group"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.this_is_a_name.id
  allocation_id = aws_eip.eip.id
}

output "eip"{
  value=aws_eip.eip.public_ip
}
