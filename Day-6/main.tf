provider "aws" {
	region = "us-east-1"
}

module "ec2_insatnce" {
	source = "./modules/ec2_instance"
	ami = var.ami
	instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
}
