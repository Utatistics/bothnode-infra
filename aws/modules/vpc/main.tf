resource "aws_vpc" "bothnode_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name          = "bothnode-vpc"
    ResourceGroup = "bothnode"
  }

}

# calling the network related modules
module "subnet_public" {
  source = "../subnet"

  vpc_id            = aws_vpc.bothnode_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"
}

module "subnet_private" {
  source = "../subnet"

  vpc_id            = aws_vpc.bothnode_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-1c"
}

module "security_group" {
  source = "../security_group"

  vpc_id = aws_vpc.bothnode_vpc.id
}

module "network_acl" {
  source = "../network_acl"

  vpc_id = aws_vpc.bothnode_vpc.id
}

module "route_table" {
  source = "../route_table"

  vpc_id = aws_vpc.bothnode_vpc.id
}

module "dhcp_options" {
  source = "../dhcp_options"

  region = var.region
}

# exporting the outputs generated on VPC creation
output "bothnode_vpc_id" {
  value = aws_vpc.bothnode_vpc.id
}

output "subnet_public_id" {
  value = module.subnet_public.bothnode_subnet_id
}

output "subnet_private_id" {
  value = module.subnet_private.bothnode_subnet_id
}

output "bothnode_default_secuirty_group_id" {
  value = module.security_group.bothnode_sg_id
}

output "bothnode_default_network_acl_id" {
  value = module.network_acl.bothnode_network_acl_id
}

output "bothnode_default_route_talbe_id" {
  value = module.route_table.bothnode_route_table_id
}

output "bothnode_dhcp_options_id" {
  value = module.dhcp_options.bothnode_dhcp_options_id
}
