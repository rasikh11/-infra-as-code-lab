terraform {
	backend "s3" {	
		bucket = "rasikh11-s3-demo-xyz" # change this
		key = "/home/rasikh11/infra-as-code-terraform/terraform.tfstate"
		region = "us-east-1"
		encrypt = "true"
		dynamodb_table = "terraform-lock"
 }
}
