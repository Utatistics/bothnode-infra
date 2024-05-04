resource "aws_internet_gateway" "igw" {
  tags = {
    Name          = "bothnode-igw"
    ResourceGroup = "bothnode"
  }

  vpc_id = var.vpc_id
}

resource "aws_route_table" "bothnode_route_table" {
  tags = {
    Name          = "bothnode-route_table"
    ResourceGroup = "bothnode"
  }

  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}

output "bothnode_route_table_id" {
  value = aws_route_table.bothnode_route_table.id
}
