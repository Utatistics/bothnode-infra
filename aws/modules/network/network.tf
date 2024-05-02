resource "aws_security_group" "sg_bothnode" {
  name        = "sg_bothnode"
  description = "Security group for bothnode server"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "sg_bothnode_id" {
    value       = aws_security_group.sg_bothnode.id
}

