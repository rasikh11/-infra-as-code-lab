# Variable Demo

```hcl
# Define an input variable for the EC2 Instance type
variable "instance_type" {
	description = "EC2 instance type"
	type = string
	default = "t2.micro"
}
# Define an input variable for the EC2 AMI ID
variable "ami_id" {
	decription = "EC2 AMI ID"
	type = string
	default = "ami-0123456789abcdef0"
}

# Configure the AWS provider
provider "aws" {
	region = "us-east-1"
}

# Create an EC2 instance using the input variable

resource "aws_instance" "example_instance" {
	ami = var.ami_id
	instance_type = var.instance_type
}

# Define an Output variable to expose the public IP Address of the EC2 instance

output "public_ip" {
	description = "Public ip Address of the EC2 instance"
	value = aws_instance.example_instance.public_ip
}
