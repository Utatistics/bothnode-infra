resource "aws_instance" "bothnode_ec2" {
  ami           = var.ami
  instance_type = "m5.xlarge"
  key_name      = var.key_name

  tags = {
    Name          = "bothnode-ec2"
    ResourceGroup = "bothnode"
  }

  root_block_device {
    volume_size = 2000
  }

  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data = file("${path.module}/pkg_install.sh")

}

output "bothnode_ec2_id" {
  value = aws_instance.bothnode_ec2.id
}