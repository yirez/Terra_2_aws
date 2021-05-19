# Configure the AWS Provider

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

resource "aws_instance" "this_is_a_name" {
  ami = "ami-043097594a7df80ec"
  instance_type = "t2.micro"
tags = {
    Name = "HelloWorld"
  }
}
