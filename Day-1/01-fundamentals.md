# Infrastructure as code(IAC)
Before the advent of IAC, infrastructure managemant was typically a manual and time-consuming process.system administrators and opeations teams had to,


1. **Manually configure servers:** Servers and other infrastructure components were often set up and configured manually, which could lead to inconsistencies and errors.


2. **Lack of Version Control:** Infrastructure configurations were not typically version-contolled, making it difficult  to track changes or revert to previous states.

3. **Documentation Heavy:**  Origanizations relied heavily on documentation to record the steps and configurations required for different infrastructure steps, this documentation could become outdated quickly.

4. **Limited Automation:** Automation was limited to basic scripting, often lacking the robustness and flexibility offered by modern IAC tools

5. **Slow Provisioning:** Provisioning new resources or environments was a time consuming process that involved multiple manual steps, leading to delays in project delivery. 

IAC addresses these challenges by providing a systematic, automated, and code-driven approach to infrastructure management. Popular IACtools include Terraform, AWS Cloud Formation, Azure Resource Manager templates others

These tools enable origanization to define, deploy and manage their infrastructure efficiently and consistenly, making it easier to adepapt to the dynamic needs of modern applications and services.

# Why Terraform ?
There are multiple reasons why Terraform is used over the other IAC tools, but below are main reasons,

1. **Multi-Cloud Support:** Terraform is known for its multi-cloud support. it allows you to define infrastructure in a cloud-agnostic way, meaning you can use same configguration code to provision resources on varios cloud providers (AWS, AZURE, GCP etc) and even on-premises infrastructure. This flexibility can be beneficial if your origanization uses multiple cloud providers or plans to migrate between them

2. **Large Ecosystem:** Terraform has a vast ecosystem of providers and modules contributed by both HashiCorp (The company behind Terraform) and the community. This means you can find pre-build modules and configurations for a wide range services and infrastructure components, saving your time and effort in writing custom configurations.

3. **Declarative Syntax:** Terraform uses a declarative syntax, allowing you to specify the desired end-state of your infrastructure. This makes it easier to understand and maintain your code compared to imperative scripting languages.
