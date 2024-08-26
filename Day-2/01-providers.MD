# Providers

A provider in Terraform is a plugin that enables interaction with an API.
This includes cloud providers, SaaS providers, and other API. The providers are specified in the Terraform configuration code. They tell Terraform which services it makes to interact with.

For example, if you want to use Terraform to create a virtual machine on AWS, you would need to use the aws provider. The aws provider provides a set of resources that Terraform can use to create, manage, and destroy virtual machines on AWS.

Here's is an example of how to use the aws provider in a Terraform configuration:

```hcl
provider "aws" {
	region = "us-east-1"
}

resource "aws_instance" "example" {
	ami = "ami-0123456789abcdef0" # Change the AMI
	instance_type = "t2.micro"
}
```
In this example, we are first defining the aws provider. We are specifying the region as us-east-1. Then, we are defining the `aws_instance` resouce. We are specifying the AMI ID and the instance type.

When Terraform runs, it'll first install the aws provider. Then, it'll use the aws provider to create the virtual machine.

Here are some other examples of providers:

- `azurerm` - for Azure
- `google` - for Google Cloud Platform
- `Kubernetes` - For Kubernetes
- `OpenStack` - For OpenStack
- `Vsphere` - for VMware Vsphere 

# Different ways to configure providers in Terraform

There are three main ways to configure providers in Terraform.

#  In the root module
This is the most common way to configure providers. The provider configuration block is placed in the root module of the Terraform configuration. This makes the provider configuration available to all resources in the configuration.

```hcl
provider "aws" {
	region = "us-east-1"
}
resource "aws_instance" "example" {
	ami = "ami-0123456789abcdef0"
	instance_type = "t2.micro"
}
```

# In child module 

You can also configure providers in child module. This's useful if you want to reuse same providers configuration in multiple resources.

```hcl
module "aws_vpc" {
	source = "./aws_vpc"
	provider = aws.us-west-2
}
resource "aws_instance" "example" {
	ami = "ami-0123456789abcdef0"
	instance_type = "t2.micro"
	depends_on = [module.aws_vpc]
}
```

# In the required_providers block

You can also configure providers in the required_providers block. This's useful if you want to use make sure that specific provider version is used.

```hcl
terraform {
	required_providers = {
		aws = {
			source = "hashicorp/aws"
			version = "~> 3.79"
	}
 }
}
resource  "aws_instance" "example" {
	ami = "ami-0123456789abcdef0"
	instance_type "t2.micro"
}
```
- The best way to configure providers depends on your specific needs. If you are only using a single provider, then configure it in the root module is the simplest option.
- If you are using multiple providers, or if you want to reuse same provider configuration in the multiple resources, then configuring it in a child module is good option.
- And if you want to make sure that a specific provider vserion is used, then configuring it in the required_providers block is the best option. 
