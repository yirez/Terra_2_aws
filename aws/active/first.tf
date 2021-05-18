# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
  access_key = "AKI...EM7V7"
  secret_key = "ycB...uWDAI"
}

resource "aws_instance" "this_is_a_name2" {
  ami = "ami-043097594a7df80ec"
  instance_type = "t2.micro"
tags = {
    Name = "HelloWorld2"
  }
}
