
module "ec2_core_instance" {
  source = "../central_modules/ec2"
}

# using 2nd provider
resource "aws_instance" "this_is_prod2" {
  ami           = "ami-063d4ab14480ac177"
  instance_type = "t2.micro"
  provider = aws.aws-eu-west
  tags = {
    Name = "test2"
  }
}


# using 2nd account  
resource "aws_instance" "this_is_prod3" {
  ami           = "ami-063d4ab14480ac177"
  provider = aws.aws-eu-central-acc2
  instance_type = "t2.micro"
  tags = {
    Name = "test2"
  }
}
