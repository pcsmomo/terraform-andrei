# terraform-andrei

DevOps Bootcamp: Terraform by Andrei Dumitrescu, Andrei Neagoie

## Folder structure

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

</details>
