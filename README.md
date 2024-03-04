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

</details>
