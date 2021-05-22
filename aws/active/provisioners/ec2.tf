resource "aws_instance" "this_is_prod" {
  ami           = data.aws_ami.i_got_this_from_data_source.id
  instance_type = "t2.micro"
  key_name="terraform"
  tags = {
    Name = "HelloWorld"
  }


  provisioner "local-exec" {
    command = "echo ${aws_instance.this_is_prod.public_ip}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("./terraform.pem")
    }
  }

}
