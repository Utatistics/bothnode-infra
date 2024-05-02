
resource "aws_instance" "ec2_bothnode" {
  ami           = "ami-0f7b55661ecbbe44c"
  instance_type = "m5.xlarge"
  key_name      = "ec2key"

  subnet_id = "subnet-0cc3a5666f182e7e1"

  vpc_security_group_ids = [aws_security_group.sg_bothnode.id]

  tags = {
    Name = "EC2BothNode"
  }

  root_block_device {
    volume_size = 2000
  }
}

