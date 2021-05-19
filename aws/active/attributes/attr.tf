# Configure the AWS Provider
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



resource "aws_eip" "eip"{
  vpc=true
}

resource "aws_s3_bucket" "s3bucket" {
  bucket = "test-s13-bucket"
}

output "eip"{
  value=aws_eip.eip.public_ip
}
output "s3bucket"{
  value=aws_s3_bucket.s3bucket.bucket_domain_name
}
