# Multiple Providers

You can use multiple providers in one single terraform project. For example,

1. create a providers.tf file in the root directory of your terraform project.
2. In the providers.tf file, define the AWS and Azure providers. For example:

```hcl
provider "aws" {
	region = "us-east-1"
}
provider "azurerm" {
	subscription_id = "your-azure-subscription-id"
	client_id = "your-azure-client-id"
	client_secret = "your-azure-client-secret"
	tenant_id = "your-azure-tenant-id"
}
```

3. In your other terraform configuration files, you can then use like  aws, and azurerm providers to create resources in AWS and Azure respectively,

```hcl 
resource "aws_instance" "example" {
	ami = "ami-0123456789abcdef0"
	instance_type = "t2.micro"
}

resource "azurerm_virtual_machine" "example" {
	name = "example_vm"
	location = "eastus"
	size = "standard_A1"
}
```
