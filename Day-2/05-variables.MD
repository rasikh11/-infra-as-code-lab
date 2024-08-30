# Variables

Input and Output variables are essential in Terraform for parameterizing and sharing values within your Terraform configuration and Modules. They allow you to make sure your configuration more reusable, dynamic and flexible.

# Input Variables

Input variables are used to parameterize your Terraform configuration. They allow you to pass values into your modules and configurations from the outside. Input variables can be defined within a module  or at the root level of your configuration. Here's how you define an input variable:

```hcl
variable "example_var" {
	description = "An example input variable"
	type = string
	default = "default_value"
}

In this example:

- `variable` is used to declare input variable named `example_var`
- `description` provide a human-readable description of the variable.
- `type` specifies the data type of the variable (e.g, `string`, `int`, `list`, `map`, etc)
- `default` provide default value for the variable, which optional.

You can use this input variable for your configuration or module like this,

```
resource "example_resource" {
	name = var.example_var
}

You reference the input variable `var.example_var`.

## Output Variables 

Output variables allows you to expose values from your module or configurations, making them available for use in other parts of your Terraform setup. Here's how you define an output variable:

```hcl
output "example_output" {
	description = "An example output variable"
	values = resource.example_resource.example.id
}
```
In this example:

- `output` is used to declare an output variable named `example_output`.
- `description` provide a description of the output variable.
- `value` specifies the value that you want expose as an output variable. This value can be a resource attribute, a computed value, or any other expression.

For example if you have an output variable named `example_output` in a module called `example_module`, you can access this in the root module like this:

```hcl
output "root_output" {
	value = module.example_module.example_output
}
```

This allow to share data and values between different parts of your Terraform configuration and create more modular. 
