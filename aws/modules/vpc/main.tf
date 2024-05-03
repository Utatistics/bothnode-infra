module "security_group_main" {
  source = "../security_group"
}

module "network_acl_main" {
  source = "../network_acl"
  vpc_id = aws_vpc.bothnode_vpc.id
}

module "route_table_main" {
  source = "../route_table"
  vpc_id = aws_vpc.bothnode_vpc.id
}

module "dhcp_options_main" {
  source = "../dhcp_options"
  region = var.region
}

module "subnet_public_1" {
  source = "../subnet"
  vpc_id = aws_vpc.bothnode_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"
}

module "subnet_private_1" {
  source = "../subnet"
  vpc_id = aws_vpc.bothnode_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-1c"
}

resource "aws_vpc" "bothnode_vpc" {
  cidr_block                 = "10.0.0.0/16"
  instance_tenancy           = "default"
  enable_dns_support         = true
  enable_dns_hostnames       = true

  # default_security_group_id  = [module.security_group_main.bothnode_sg_id]
  # default_route_table_id     = module.route_table_main.bothnode_route_table_id
  # default_network_acl_id     = module.network_acl_main.bothnode_network_acl_id

  tags = {
    Name = "bothnode-vpc"
  }
}

output "bothnode_vpc_id" {
  value = aws_vpc.bothnode_vpc.id
}
