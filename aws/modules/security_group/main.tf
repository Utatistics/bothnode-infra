resource "aws_security_group" "bothnode_sg" {
  name        = "bothnode_sg"
  description = "Security group for bothnode server"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 30303 # P2P network communication for Ethereum nodes
    to_port     = 30303
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 30301 # Discovery port for Ethereum node discovery
    to_port     = 30301
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8545 # RPC (Remote Procedure Call) Port used for Ethereum JSON-RPC API
    to_port     = 8545
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 30303 
    to_port     = 30303
    protocol    = "tcp" 
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 30301 # Discovery port for Ethereum node discovery
    to_port     = 30301
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }


}

output "bothnode_sg_id" {
    value       = aws_security_group.bothnode_sg.id
}

