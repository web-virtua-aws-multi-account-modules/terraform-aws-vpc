# AWS VPC for multiples accounts and regions with Terraform module
* This module simplifies creating and configuring of a VPC across multiple accounts and regions on AWS

* Is possible use this module with one region using the standard profile or multi account and regions using multiple profiles setting in the modules.

## Actions necessary to use this module:

* Create file versions.tf with the exemple code below:
```hcl
terraform {
  required_version = ">= 1.1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.9"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 2.0"
    }
  }
}
```

* Criate file provider.tf with the exemple code below:
```hcl
provider "aws" {
  alias   = "alias_profile_a"
  region  = "us-east-1"
  profile = "my-profile"
}

provider "aws" {
  alias   = "alias_profile_b"
  region  = "us-east-2"
  profile = "my-profile"
}
```


## Features enable of VPC configurations for this module:

- VPC IPV4 and or IPV6
- Egress only internet gateway

## Usage exemples

### VPC network with IPV4 and IPV6

```hcl
module "vpc_main" {
  source                           = "web-virtua-aws-multi-account-modules/vpc/aws"
  vpc_name                         = "tf-vpc-test"
  cidr_block                       = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = true

  providers = {
    aws = aws.alias_profile_b
  }
}
```

### VPC network only IPV4

```hcl
module "vpc_main" {
  source                           = "web-virtua-aws-multi-account-modules/vpc/aws"
  vpc_name                         = "tf-vpc-test"
  cidr_block                       = "10.0.0.0/16"

  providers = {
    aws = aws.alias_profile_b
  }
}
```

## Variables

| Name | Type | Default | Required | Description | Options |
|------|-------------|------|---------|:--------:|:--------|
| vpc_name | `string` | `-` | yes | Name to VPC | `-` |
| cidr_block | `string` | `10.0.0.0/16` | no | VPC Cidr Block | `-` |
| enable_dns_hostnames | `bool` | `true` | no | Enable DNS Hostnames | `*`false <br> `*`true |
| enable_dns_support | `bool` | `true` | no | Enable DNS Support | `*`false <br> `*`true |
| enable_network_address_usage_metrics | `bool` | `false` | no | Enable network address usage metrics | `*`false <br> `*`true |
| assign_generated_ipv6_cidr_block | `bool` | `false` | no | Assign generated ipv6 cidr block | `*`false <br> `*`true |
| ou_name | `string` | `no` | no | Organization unit name | `-` |
| tags | `map(any)` | `{}` | no | Tags to resources | `-` |

## Resources

| Name | Type |
|------|------|
| [aws_vpc.create_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_egress_only_internet_gateway.create_egress_only_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/egress_only_internet_gateway) | resource |

## Outputs

| Name | Description |
|------|-------------|
| `vpc` | All informations of the VPC |
| `vpc_id` | VPC ID |
| `egress_only_internet_gateway` | All informations of the egress only internet gateway |
| `egress_only_internet_gateway_id` | Egress only internet gateway ID |
