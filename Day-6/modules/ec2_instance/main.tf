provider "aws" {
	region = "us-east-1"
}

variable "ami" {
	description = "This is an ami for instance"
}

variable "instance_type" {
	description = "This is an instance type For example: t2.micro"
}

resource "aws_instance" "example" {
	ami = var.ami
	instance_type = var.instance_type
}
