
###
# ** Covers var asssign tests **
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


resource "aws_instance" "this_is_a_name" {
  ami = var.ami
  # instance_type = var.instance_type
  # OR with maps
  # instance_type = var.instance_types["us-central-1a"]
  # OR with lists
  instance_type = var.instance_list_types[2]

  #user_id = var.user_id
tags = {
    Name = "HelloWorld"
  }
}

resource "aws_elb" "elb" {
  name               = var.elb_name
  availability_zones = var.availability_zone


  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  instances                   = [aws_instance.this_is_a_name.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "terraform-elb"
  }
}
