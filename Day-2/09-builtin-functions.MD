# Builtin-Functions

Terraform is an infrastructure as code (IAC) tool that allows you define and provision infrastructure resources in declarative manner. Terraform provides wide ranges built-in functions that you can use within your configuration files (usually writen in HashiCorp Configuraion Language, or HCL) to manipulate and trasform data. These functions helps you to perform various tasks when defining your infrastructure. Here're commonly used built-in functions in Terraform. 

1. `concat(list1, list2, ...)`: combine multiple lists into a single list.

```hcl
variable "list1" {
	type = list
	default = ["a", "b"]
}

variable "list2" {
	type = list
	default = ["c", "d"]
}

output "combined_list" {
	value = concat(var.list1, var.list2)
}
```

2. `element(list, index)`: Returns the elememt at specified index in a list 

```hcl
variable "my_list" {
	type = list
	default = ["apple", "banana", "cherry"]
}

output "selected_element" {
	value = element(var.mylist, 1) # Return "banana" (it's start indexing form 0),
}
```
3. `length(list)`: Return the number of elements in list.

```hcl
variable "my_list" {
	type = list
	default =["apple", "banana", "cherry"]
}

output "total_length" {
	value = lenght(var.mylist) # Returns 3
}
``` 
4. `map(key, value)`: Create a map from list of keys and list of values

```hcl
variable "keys" {
	type = list
	default = ["name", "age"]
}
variable "values" {
	type = list
	default = ["Rasikh11", 17]
}

output "my_map" {
	value = map(var.keys, var.values) # Return {"name" = "Rasikh11", "age"=17}
}
```

5. `lookup(map, key)`: Retrieves the value associated with a specific key in map.

```hcl
variable "my_map" {
	type = map(string)
	default = {"name" = "Rasikh11", "age" = "17"}
}

output "value" {
	value = lookup(var.my_map, "name") # Return Rasikh11
}
```

6. `join(separator, list)`: Joins the elements of a list into a single string using the specified separator.

```hcl
variable "my_list" {
	type = string
	default = ["apple", "banana", "cherry"] 
}

output "joined_output" {
	value = join(",", var.my_list) #  Returns "apple, banana, cherry"
}
```

These are just few examples of the built-in functions available in Terraform. You can find more functions and detailed documentation in the official Terraform documentation, which is regularly updated.
