
###
# ** Covers count and condition tests **
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

variable is_prod{
  type = bool
}
resource "aws_instance" "this_is_prod" {
  ami =  "ami-043097594a7df80ec"
  instance_type = "t2.micro"
  #count=5
  count= var.is_prod==true?5:0
tags = {
    Name = "HelloWorld"
  }
}
resource "aws_instance" "this_is_test" {
  ami =  "ami-043097594a7df80ec"
  instance_type = "t2.micro"
  #count=5
  count= var.is_prod==true?0:2
tags = {
    Name = "HelloWorld"
  }
}
resource "aws_iam_user" "prod_users" {
  name = "prod_user${count.index}"
  #count =2
  count= var.is_prod==true?5:0
}
resource "aws_iam_user" "test_users" {
  name = "test_user${count.index}"
  #count =2
  count= var.is_prod==true?0:2
}
