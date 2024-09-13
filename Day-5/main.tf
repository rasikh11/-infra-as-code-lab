## Define the AWS provider configuration.
provider "aws" {
	region = "us-east-1" # Replace with your desired AWS region
}

variable "cidr" {
	default = "10.0.0.0/16"
}

resource "aws_key_pair" "example" {
	key_name = "terraform-demo-rasikh11" # Change with your desired key name
	public_key = "~/.ssh/id_rsa.pub" # Replace with your path to your public key file
}

resource "aws_vpc" "myvpc" {
	cidr_block = var.cidr
}

resource "aws_subnet" "sub1" {
	vpc_id = aws_vpc.myvpc.id
	cidr_block = "10.0.1.0/24"
	availability_zone = "us-east-1a"
	map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
	vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "RT" {
	vpc_id = aws_vpc.myvpc.id
	
	route {
	 cidr_block = "0.0.0.0/0"
	 gateway_id = aws_internet_gateway.igw.id
 }
}

resource "aws_route_table_association" "rta1" {
	subnet_id = aws_subnet.sub1.id
	route_table_id = aws_route_table.RT.id
}

resource "aws_security_group" "webSg" {
	name = "web"
	vpc_id = aws_vpc.myvpc.id
	
	ingress {
	 description = "http from vpc"
	 from_port = 80
	 to_port = 80
	 protocol = "tcp"
	 cidr_blocks = ["0.0.0.0/0"]
}

	ingress {
	 desciption = "SSH"
	 from_port = 22
	 to_port = 22
	 protocol = "tcp"
	 cidr_blocks = ["0.0.0.0/0"]
}

	egress {
	 from_port = 0
	 to_port = 0 
	 protocol = "-1"
	 cidr_blocks = ["0.0.0.0/0"]
}

	tags {
	Name = "web-sg"
 }
}

resource "aws_instance" "example" {
	ami = ""
	instance_type = ""
	vpc_security_group_ids = [aws_security_group.webSg.id]
	subnet_id = aws_sunbet_sub1.id

	connection {
	 type = "ssh" 
	 user = "ubuntu" # Replace with the appropriate username for your EC2 instance
	 private_key = ("~/.ssh/id_rsa") # Replace with your private key path
	 host = self.public_ip
}

# File provisioner is used to copy a file from local to remote machine

provisioner "file" {
	source  = "/home/rasikh11/app.py" # Replace with the path of your local file
	destination = "/home/ubuntu/app.py" # Replace with path on remote instance
}

provisioner "remote-exec" {
	inline {
	 "echo 'Helo from remote instance'",
	 "sudo apt update -y", # Update package lits (for ubuntu)
	 "sudo apt-get install -y python3-pip", # Example package installation
	 "cd /home/ubuntu/",
	 "sudo pip3 install flask",
	 "sudo python3 app.py &",
	]
 }
}
