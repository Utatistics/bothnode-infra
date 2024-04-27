provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "ec2_bothnode" {
  ami           = "ami-0f7b55661ecbbe44c"
  instance_type = "m5.xlarge" # 4 vCPU and 16 memory (GiB), choose m5.2xlarge for 32 GiB  
  key_name      = "ec2key"

  subnet_id     = "subnet-0cc3a5666f182e7e1"
  vpc_security_group_ids = ["sg-03ece94a4ff6bea05"]

  tags = {
    Name = "EC2BothNode"
  }

  root_block_device {
    volume_size = 2000
  }
}

output "instance_ip" {
  value = aws_instance.ec2_bothnode.private_ip
}

