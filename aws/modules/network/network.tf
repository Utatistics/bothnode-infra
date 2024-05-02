# Define the Network Security Group (NSG) with inbound and outbound rules
resource "aws_security_group" "sg_bothnode" {
  name        = "sg_bothnode"
  description = "Security group for bothnode server"

  // Inbound rule allowing SSH access from anywhere (for example)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Outbound rule allowing all traffic to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

