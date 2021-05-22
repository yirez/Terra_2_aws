
module "ds" {
  source = "../ds"
}


resource "aws_instance" "this_is_prod" {
  ami           = module.ds.ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  } 
}
