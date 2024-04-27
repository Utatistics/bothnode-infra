provider "aws" {
  region = "ap-northeast-1"
}

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

# Create the EC2 instance and associate it with the Network Security Group (NSG)
resource "aws_instance" "ec2_bothnode" {
  ami           = "ami-0f7b55661ecbbe44c"
  instance_type = "m5.xlarge"
  key_name      = "ec2key"

  subnet_id     = "subnet-0cc3a5666f182e7e1"
  
  # Use the newly created security group
  vpc_security_group_ids = [aws_security_group.sg_bothnode.id]

  tags = {
    Name = "EC2BothNode"
  }

  root_block_device {
    volume_size = 2000
  }
}

# Output the private IP address of the EC2 instance
output "instance_ip" {
  value = aws_instance.ec2_bothnode.private_ip
}

