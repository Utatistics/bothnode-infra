resource "aws_vpc_dhcp_options" "bothnode_dhcp_options" {
  domain_name          = "${var.region}.compute.internal"
  domain_name_servers  = ["AmazonProvidedDNS"]
  
  tags = {
    Name = "bothnode-dhcp-options"
  }
}

output "bothnode_dhcp_options_id" {
  value = aws_vpc_dhcp_options.bothnode_dhcp_options.id
}
