## Vault Integration

Here're the detailed steps for each of these steps:

## Create an Ec2 instance with ubuntu

To create an AWS ec2 instance with Ubuntu, you can use the AWS Managemeent console or the AWS CLI. Here're the steps involved in creating an Ec2 instance using the AWS Management Console.

- Go the AWS Management Console and naviate to the Ec2 service.
- Click on the Launch Instance button.
- Select the Ubuntu Server xx.xx LTS AMI.
- Select the instance type that you want to use.
- Configure the instance settings.
- Click on the Launch button.



## Install Vault on the Ec2 instance

To install the valt on the ec2 instance use the following steps:

**install gpg** 

`sudo apt update && sudo apt install gpg`

**Download the signing key to a new keying**

```
wget -O- https://apt-releases.hasicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
```

**Verify the key's fingerprint**


**Add the HashiCorp repo**

```
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hasicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
```

```
sudo apt update
```

**Finally, install vault**

```
sudo apt install vault
```

## Start vault 

To start `vault`, you can use the following command

```
vault server -dev -dev-listen-address="0.0.0.0:8200"
```

## Configure Terraform to read  the secret from Vault.

Detailed steps to enable and configure AppRole authentication in HashiCorp vault:

1. **Enable AppRole Authentication:**
 
To enable the AppRole authentication method in vault, you need to use Vault CLI or the Vault HTTP API.

**Using Vault CLI:**

Run the following command to enable the AppRole authentication method:

```bash
vault auth enable approle
```
This command tells vault to enable the AppRole authentication method.

2. **Create an AppRole:**

you need to create policy first,

```
vault policy write terraform - <<EOF
path "*" {
	capabilities = ["list", "read"]
}

path "secrets/data/*" {
	capabilities = ["create", "read", "update", "delete", "list"]
}

path "kv/data/*" {
	capabilities = ["create", "read", "update", "delete", "list"]
}

path "secret/data/*" {
	capabilities = ["create", "read", "update", "delete", "list"]
}

path "auth/token/create" {
	capabilities = ["create", "read", "update", "list"]
}
EOF
```
Now you'll need to create an AppRole with appropriate policies and configure its authentication settings. Here are the steps to create an AppRole:


**A. Create the AppRole**

```bash
vault write auth/approle/role/terraform \
	secret_id_ttl=10m \
	token_num_uses=10 \
	token_ttl=20m \
	token_max_ttl=30m \
	secret_id_num_uses=40 \
	token_policies=terraform
```
3. **Generate Role ID and Secret ID**

After creating the AppRole, you need to generate a Role ID and Secret ID pair. The Role ID is a static identifier, while the secret ID is a dynamic credential.

**A. Generate Role ID**

You can retrieve the Role ID using the Vault CLI:

```bash
vault read auth/approle/role/my-approle/role-id
```
Save the Role ID for use in your Terraform configuration.

**B. Generate Secret ID**

To generate the secret ID you can use the following command:

```bash
vault write -f auth/approle/role/my-approle/secret-id
```
This command generates a secret ID and provides it in the response. Save the secret ID securely,as it will be used for terraform authentication.
