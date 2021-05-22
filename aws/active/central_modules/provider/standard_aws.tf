###  **************STANDARD AWS START******************  ###
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.41.0"
    }
  }
}


provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}
###  **************STANDARD AWS END******************  ###
