# Provider configuration

The required_provider block in Terraform is used to declare and specify the required provider configuration for your terraform module and configurations. It allows you to specify the provider name, Source and Version constraints.

```hcl
terraform {
  required_providers {
	aws {
		source = "hashicorp/aws"
		version = "~> 3.0"
	}
 	azurerm {
		source = "hashicorp/azurerm"
		version = ">= 2.0, < 3.0"
	}
    }
}
``` 
