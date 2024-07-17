#variable demo
''hcl

provider "aws" {
    region = "us-east-1"
}
# Define an input variable for the EC2 instance type
variable "instance_type" {
    description = "ec2 instance "
    type = string
    default = "t2.micro"
}

#define an input variable for the ami_id
variable "ami_id" {
    description = "ami id "
    type = string
    default = "ami-04a81a99f5ec58529"
}

resource "aws_instance" "terraform_implementation" {
    name = "first_terraform_implementation"
    ami_id = var.ami_id
    instance_type = var.instance_type
}

## Define an output variable to expose the public IP address of the EC2 instance
output "public_ip"{
description = "public_ip address of the ec2 instances"
public_ip = aws_instance.terraform_implementation.public_ip
}
