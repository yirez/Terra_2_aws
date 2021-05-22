data "aws_ami" "i_got_this_from_data_source" {
  most_recent      = true
  owners           = ["${var.datasource_ami_owner}"]

  filter {
    name   = "name"
    values = ["${var.datasource_ami_name_filter}"]
  }
}
