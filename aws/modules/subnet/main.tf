resource "aws_subnet" "bothnode_subnet" {
  tags = {
    Name          = "bothnode-subnet"
    ResourceGroup = "bothnode"
  }

  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone

}

output "bothnode_subnet_id" {
  value = aws_subnet.bothnode_subnet.id
}
