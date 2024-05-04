resource "aws_network_acl" "bothnode_network_acl" {
  vpc_id = var.vpc_id

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}

output "bothnode_network_acl_id" {
  value        = aws_network_acl.bothnode_network_acl.id
}
