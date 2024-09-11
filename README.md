# terraform-andrei

DevOps Bootcamp: Terraform by Andrei Dumitrescu, Andrei Neagoie

## Folder structure

- 03-master_terraform
  - Section 3: Provisioning AWS Infrastructure with Terraform

# Details

<details open>
  <summary>Click to Contract/Expend</summary>

## Section 2: Terraform and AWS Introduction

### 6. Terraform Demo

Terraform demo with AWS by running nginx docker container on linux

```sh
terraform init
terraform plan
terraform apply
```

### 7. IaC Tool Comparison Terraform vs Ansible

IaC : Infrastructure as Code

- terraform
- ansible - part of Red Hat
- chef
- saltstack
- puppet
- cloudformation: not open source - AWS

#### Privisioning Tools

- Terraform
- CloudFormation

#### Configuration Tools

- ansible
- chef
- saltstack
- puppet

#### Declarative (Functional) vs Imperative (Procedural)

```js
// Imperative (Prodecural) - Terraform
resource "aws_instance" "server" {
  count = 5
  ami = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
}
```

```yaml
# Declarative (Functional) - Ansible
- ec2:
    count: 5
    image: ami-0c02fb55956c7d316
    instance_type: t2.micro
```

> In reality, we might have to use multiple tools. \
> e.g, Terraform for deploying all underlying infrastructure such as network topology, databases, load balancers and servers\
> and use Ansible for apps and configurations

### 8. Installing Terraform on Linux and macOS

[Install Terraform - Homebrew](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

```sh
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

#### To update

```sh
brew update
brew upgrade hashicorp/tap/terraform
```

### 13. Creating an IAM User

Create an IAM user on my AWS and as well as an access key

- username: terraform

## Section 3: Provisioning AWS Infrastructure with Terraform

### 17. Terraform Code Structure

```sh
mkdir 03-master-terraform
cd 03-master-terraform
mkdir 01-aws
cd 01-aws
touch main.tf
```

### 18. Terraform Providers

[Terraform Documentation: AWS provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

### 19. Terraform Configuration Syntax

1. Native Terraform Language: `.tf`
2. JSON: `.tf.json`

1 + 2 = Hashicorp Configuration Language (HCL)

### 20. Initializing Working Directories

#### install it aws provider locally

```sh
# 03-master_terraform/01-aws
terraform init

# Initializing provider plugins...
# - Finding hashicorp/aws versions matching "~> 3.0"...
# - Installing hashicorp/aws v3.76.1...
# - Installed hashicorp/aws v3.76.1 (signed by HashiCorp)

# Terraform has created a lock file .terraform.lock.hcl to record the provider
# selections it made above. Include this file in your version control repository
# so that Terraform can guarantee to make the same selections by default when
# you run "terraform init" in the future.

# Terraform has been successfully initialized!

# You may now begin working with Terraform. Try running "terraform plan" to see
# any changes that are required for your infrastructure. All Terraform commands
# should now work.

# If you ever set or change modules or backend configuration for Terraform,
# rerun this command to reinitialize your working directory. If you forget, other
# commands will detect it and remind you to do so if necessary.
```

`.terraform.lock.hcl` file and `.terraform` folder will be generated.

```sh
terraform --version
# Terraform v1.6.1
# on darwin_arm64
# + provider registry.terraform.io/hashicorp/aws v3.76.1

# Your version of Terraform is out of date! The latest version
# is 1.7.4. You can update by downloading from https://www.terraform.io/downloads.html
```

```sh
terraform
# Usage: terraform [global options] <subcommand> [args]

# The available commands for execution are listed below.
# The primary workflow commands are given first, followed by
# less common or more advanced commands.

# Main commands:
#   init          Prepare your working directory for other commands
#   validate      Check whether the configuration is valid
#   plan          Show changes required by the current configuration
#   apply         Create or update infrastructure
#   destroy       Destroy previously-created infrastructure

# All other commands:
#   console       Try Terraform expressions at an interactive command prompt
#   fmt           Reformat your configuration in the standard style
#   force-unlock  Release a stuck lock on the current workspace
#   get           Install or upgrade remote Terraform modules
#   graph         Generate a Graphviz graph of the steps in an operation
#   import        Associate existing infrastructure with a Terraform resource
#   login         Obtain and save credentials for a remote host
#   logout        Remove locally-stored credentials for a remote host
#   metadata      Metadata related commands
#   output        Show output values from your root module
#   providers     Show the providers required for this configuration
#   refresh       Update the state to match remote systems
#   show          Show the current state or a saved plan
#   state         Advanced state management
#   taint         Mark a resource instance as not fully functional
#   test          Execute integration tests for Terraform modules
#   untaint       Remove the 'tainted' state from a resource instance
#   version       Show the current Terraform version
#   workspace     Workspace management

# Global options (use these before the subcommand, if any):
#   -chdir=DIR    Switch to a different working directory before executing the
#                 given subcommand.
#   -help         Show this help output, or the help for a specified subcommand.
#   -version      An alias for the "version" subcommand.
```

### 21. Authenticating to AWS

two ways to set credentials

#### in main.tf file

```js
provider "aws" {
  region = "ap-southeast-2"
  access_key = ""
  secret_key = ""
}
```

#### use environment variables

```sh
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_DEFAULT_REGION="ap-southeast-2"
```

### 22. Creating Resources (Part1): AWS VPC

Terraform Basic Syntax

```tf
resource "<provider>_<resource_type>>" "local_name" {
  argument1 = value1
  argument2 = value2
  ...
}
```

### 23. Terraform Plan and Apply

Terraform Workflow

1. Write : wirte in `.tf`
2. Plan : to preview the changes
3. Apply

#### Plan

```sh
# ./01-aws
01-aws % terraform plan

# Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
#   + create

# Terraform will perform the following actions:

#   # aws_vpc.main will be created
#   + resource "aws_vpc" "main" {
#       + arn                                  = (known after apply)
#       + cidr_block                           = "10.0.0.0/16"
#       + default_network_acl_id               = (known after apply)
#       + default_route_table_id               = (known after apply)
#       + default_security_group_id            = (known after apply)
#       + dhcp_options_id                      = (known after apply)
#       + enable_classiclink                   = (known after apply)
#       + enable_classiclink_dns_support       = (known after apply)
#       + enable_dns_hostnames                 = (known after apply)
#       + enable_dns_support                   = true
#       + id                                   = (known after apply)
#       + instance_tenancy                     = "default"
#       + ipv6_association_id                  = (known after apply)
#       + ipv6_cidr_block                      = (known after apply)
#       + ipv6_cidr_block_network_border_group = (known after apply)
#       + main_route_table_id                  = (known after apply)
#       + owner_id                             = (known after apply)
#       + tags                                 = {
#           + "Name" = "Main VPC"
#         }
#       + tags_all                             = {
#           + "Name" = "Main VPC"
#         }
#     }

# Plan: 1 to add, 0 to change, 0 to destroy.
```

#### Apply

```sh
01-aws % terraform apply

# Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
#   + create

# Terraform will perform the following actions:

#   # aws_vpc.main will be created
#   + resource "aws_vpc" "main" {
#       + arn                                  = (known after apply)
#       + cidr_block                           = "10.0.0.0/16"
#       + default_network_acl_id               = (known after apply)
#       + default_route_table_id               = (known after apply)
#       + default_security_group_id            = (known after apply)
#       + dhcp_options_id                      = (known after apply)
#       + enable_classiclink                   = (known after apply)
#       + enable_classiclink_dns_support       = (known after apply)
#       + enable_dns_hostnames                 = (known after apply)
#       + enable_dns_support                   = true
#       + id                                   = (known after apply)
#       + instance_tenancy                     = "default"
#       + ipv6_association_id                  = (known after apply)
#       + ipv6_cidr_block                      = (known after apply)
#       + ipv6_cidr_block_network_border_group = (known after apply)
#       + main_route_table_id                  = (known after apply)
#       + owner_id                             = (known after apply)
#       + tags                                 = {
#           + "Name" = "Main VPC"
#         }
#       + tags_all                             = {
#           + "Name" = "Main VPC"
#         }
#     }

# Plan: 1 to add, 0 to change, 0 to destroy.

# Do you want to perform these actions?
#   Terraform will perform the actions described above.
#   Only 'yes' will be accepted to approve.

#   Enter a value: yes

# aws_vpc.main: Creating...
# aws_vpc.main: Creation complete after 2s [id=vpc-0cc29a264819d771c]

# Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

Delete the VPC manually on the web console and try it again

```sh
# Save the plan to `tfplan` file.
terraform plan -out=tfplan
```

```sh
terraform apply "tfplan"

# aws_vpc.main: Creating...
# aws_vpc.main: Creation complete after 2s [id=vpc-075ba35c921a1accd]

# Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

When VPC is created, `Main route table` and `Main network ACL` will be created as well

</details>
