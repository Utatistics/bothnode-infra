resource "aws_instance" "bothnode_ec2" {
    ami                    = "ami-0f7b55661ecbbe44c"
    instance_type          = "m5.xlarge"
    key_name               = "ec2key"

    subnet_id              = var.subnet_id
    vpc_security_group_ids = var.vpc_security_group_ids
    tags                   = {
        Name               = "EC2BothNode"
    }

    root_block_device {
        volume_size        = 2000
  }
}

output "bothnode_ec2_id" {
    value = aws_instance.bothnode_ec2.id
}