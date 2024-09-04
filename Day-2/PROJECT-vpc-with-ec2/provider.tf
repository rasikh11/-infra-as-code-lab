```hcl
terraform {
	required_provider {
	aws = {
		source = "hashicorp/aws"
		version = "5.10.0"
    }
  }
}

provider "aws" {
	# Configuration Options
	region = "us-east-1"
}
