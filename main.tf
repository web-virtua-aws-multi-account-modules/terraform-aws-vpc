resource "aws_vpc" "create_vpc" {
  cidr_block                           = var.cidr_block
  enable_dns_support                   = var.enable_dns_support
  enable_dns_hostnames                 = var.enable_dns_hostnames
  assign_generated_ipv6_cidr_block     = var.assign_generated_ipv6_cidr_block
  enable_network_address_usage_metrics = var.enable_network_address_usage_metrics

  tags = merge(var.tags, {
    Name      = var.vpc_name
    "tf-type" = "vpc"
    "tf-vpc"  = var.vpc_name
    "tf-ou"   = var.ou_name
  })
}

resource "aws_egress_only_internet_gateway" "create_egress_only_internet_gateway" {
  count  = var.assign_generated_ipv6_cidr_block ? 1 : 0
  vpc_id = aws_vpc.create_vpc.id
}
