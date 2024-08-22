# Setup Terraform for AWS

To configure AWS credentials and setup Terraform to work with AWS, you'll need to follow these steps:

1. **Install AWS CLI (Command Line Interface ):**

Make sure you have AWS cli installed on your machine. You can download and install it from the [AWS CLI Download Page](https://aws.amazon.com/cli).

2. **Create an AWS IAM User:**
To interact with AWS programmatically, you should create an IAM (Identity and Access Management) user with appropriate permissions. Here's how to create one.

- Login to the AWS Management console with an account that has administrative privileges.
- Navigate to the IAM Service
- Click on "Users" in the left navigation pane and then click "Add user."
- Choose a username, select "programmatic access" as the access type, and click "Next: permission."
- Attach policies to this user based on your requirements. At a minimum, you should attach the "AmazonEC2FullAccess" policy for basic EC2 operations. If you need access to other AWS services, attach the relevant policies accordingly. 
- Review the user's configuration and create the user. Be sure to save Access Key ID and Secret Access Key that are displayed after user creation you'll need these for Terraform. 

3. **Configure AWS CLI Credentials:**

- Use the AWS CLI to configure your credentials. Open a terminal and run:

```
aws configure
```
