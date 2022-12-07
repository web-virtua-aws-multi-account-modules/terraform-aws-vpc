output "vpc" {
  description = "VPC"
  value       = aws_vpc.create_vpc
}

output "vpc_id" {
  description = "VPC"
  value       = aws_vpc.create_vpc.id
}

output "egress_only_internet_gateway" {
  description = "Egress only internet gateway"
  value       = try(aws_egress_only_internet_gateway.create_egress_only_internet_gateway, null)
}

output "egress_only_internet_gateway_id" {
  description = "Egress only internet gateway"
  value       = try(aws_egress_only_internet_gateway.create_egress_only_internet_gateway[0].id, null)
}
