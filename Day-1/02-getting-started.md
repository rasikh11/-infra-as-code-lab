# Getting Started

to get started with Terraform, it's important to understand some key terminology and concepts. Here are some fundamental terms and explanations.

1. **Provider:** Provider is a plugin for Terraform that defines and manages resources for a specific cloud or infrastructure platform.
Examples of providers include AWS, AZURE, Google Cloud, and many others.
You configure providers in your Terraform code to interact with the desired infrastructure platform.

2. **Resource:**  resource is a specific infrastructure component that you want to create and manage using Terraform. Resources can include virtual machines, databases, storage buckets, network components, and more. Each resource has a type and configuration parameters that you define in your Terraform code.

3. **Module:** A module is a reusable and encapsulated unit of Terraform code. Modules allow you to package infrastructure configurations, making it easier to maintain, share, and reuse them across different parts of your infrastructure. Modules can be your own creations or come from Terraform Registry, which hosts community-contributed modules

4. **Configuration File:** Terraform uses configuration files (often with a .tf extension) to define the desired infrastructure state. These files specify providers, resources, variables, and other settings. The primary configurations file is usually named main.tf, but you can use multiple configuration files as wel

5. **Variable:** Variables in Terraform are placeholders for values that can passed into your configuration. They make your code more flexible and reusable by allowing you to define values outside of your code and pass them in when you apply the Terraform configuration. 
