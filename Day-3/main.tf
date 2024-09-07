module "ec2_instance" {
	source = file("./modules/ec2_instance")

	ami = "ami-0c55b159cbfafe1f0"
	instance_type = "t2.micro"
	subnet_id = "set-your-subnet_id here"
