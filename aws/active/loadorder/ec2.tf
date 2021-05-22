resource "aws_instance" "this_is_prod" {
  ami =  data.aws_ami.i_got_this_from_data_source.id
  instance_type = "t2.micro"
tags = {
    Name = var.instance_name
  }
}
