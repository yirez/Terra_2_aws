
module "ec2_core_instance" {
  source = "../central_modules/ec2"
}

# override module data
module "ec2_core_instance2" {
  source = "../central_modules/ec2"
  instance_type = "t2.nano"
}

# use workspace as a definition argument
module "ec2_core_instance3" {
  source = "../central_modules/ec2"
  instance_type = lookup(var.instance_types,terraform.workspace)
}
variable "instance_types" {
  default = {
    default="t2.nano"
    dev="t2.micro"
    test="t2.medium"
  }
  type=map
}
