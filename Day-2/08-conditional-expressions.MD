# Conditional Expressions

Conditional Expressions are used in Terraform to define conditional logic within your configuration. They allow you to make decisions or set of values based on condition. Conditional expressions are typically used to control weather resources are created or configured based on the evaluation of a condition.

The syntax of conditional expression in Terraform is:

```hcl
condition ? true_val : false_val
```
- `condition` is an expression that evaluates to either `true` or `false`.
- `true_val`  is the value that's required if the condition is `true`.
- `false_val` is the value that's required if the condition is `false`

Here are some common use cases and examples of how to use conditional expressions in Terraform:

```hcl
resource "aws_instance" "example" {
	count = var.create_instance ? 1 : 0
	ami = "ami-0123456789abcdef0"
	instance_type = "t2.micro"
}
```

In this example, `count` attribute of the `aws_instance` resource uses a conditional expression. if the `create_instance` value is `true`, it creates ONE EC2_instance. if `create_instance` is false, it creates zero instances, effectively skipping resource creation.

# Conditional Expression Assignment Example

```hcl
variable "environment" {
	description = "Environment type"
	type = "string"
	default = "development"
}

variable "producrion_subnet_cidr" {
	description = "CIDR block for production subnet"
	type = string
	default = "10.0.1.0/24"
}

resource "aws_security_group" "example" {
	name = "example-sg"
	description = "Example Security group"

	ingress {
		port = 22
		to_port = 22
		protocol = "tcp"
		cidr.block = var.environment == "production" ? [var.production_subnet_cidr] : [var.development_subnet_cidr]
 }
}

```

In this example, the `ingress` block uses a conditional expression to assign a value to the `subnet_cidr` local variable based on the value of `environment` variable. If `environment` is set to `"production"` it uses the `production_subnet_cidr` variable;
otherwise, it uses the `development_subnet_cidr` variable.

## Conditional Resource Configuration

```hcl
resource "aws_security_group" "example-sg" {
	name = "example-sg"
	description = "Example Security Group"

	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_block = var.enable_ssh ? ["0.0.0.0/0"] : []
 }
}
```

In this example, the `ingress` block within the "aws_security_group" resource uses a conditinal expression to control weather SSH Access is allowed. If `enable_ssh` is `true` it allows SSH traffic from any source (`"0.0.0.0/0"`); otherwise, it allows no inbound traffic.

Coditional expressions in Terraform provide a powerful way to make decisions and customize your infrastructure deployments based on various conditions and variables. They enhance the flexibility and reusability. 
