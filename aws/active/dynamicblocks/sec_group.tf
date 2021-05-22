resource "aws_security_group" "sec_group_block" {
  name        = "custom_sec_group"

  ingress {
    from_port        = 8000
    to_port          = 8000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 8001
    to_port          = 8001
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 8002
    to_port          = 8002
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 8003
    to_port          = 8003
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  dynamic "ingress"  {
    for_each=var.sec_group_ports
    iterator=ingress_loop_val
     content{
        from_port        = ingress_loop_val.value
        to_port          = ingress_loop_val.value
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
      }
  } 

  tags = {
    Name = "custom_sec_group"
  }
}
