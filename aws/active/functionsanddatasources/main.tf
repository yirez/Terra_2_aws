
###
# ** Covers functions and datasources **
# var default assignment (using vars.tf default values)
#
#
#
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

resource "aws_instance" "this_is_prod" {
  ami =  data.aws_ami.i_got_this_from_data_source.id
  instance_type = "t2.micro"
tags = {
    Name = "HelloWorld"
  }
}

# this should return multiple images
# aws ec2 describe-images --region eu-central-1  --owners amazon
# --filters "Name=platform,Values=Linux/UNIX" "Name=root-device-type,Values=ebs"
# "Name=name,Values=amzn2-ami-hvm*"
# "Name=name,Values=ebs" "Name=architecture,Values=x86_64"

data "aws_ami" "i_got_this_from_data_source" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
/* TODO, these don't work. Look for why
  filter {
    name   = "name"
    values = ["ebs"]
  }

 filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "platform"
    values = ["Linux/UNIX"]
  }*/
}
