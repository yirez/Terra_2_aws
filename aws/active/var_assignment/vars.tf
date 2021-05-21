variable "instance_type"{
  default="t2.micro"
}
variable "ami"{
  default= "ami-043097594a7df80ec"
}

# will ask for user id if not entered
#variable "user_id" {
#  type = number
#}



variable "elb_name" {
  type  =  string
}

variable "availability_zone" {
  type    = list
 # can also be: type    = list(string)  #for more refined control
}


variable "instance_types" {
  type=map
  default = {
    us-central-1a="t2.nano"
    us-central-1b="t2.micro"
    us-central-1c="t2.small"
  }
}

variable "instance_list_types" {
  type=list(string)
  default = ["t2.nano","t2.micro","t2.small" ]
}
