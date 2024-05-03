module "vpc" {
    source = "../vpc"
    region = var.region
}

module "subnet" {
    source = "../subnet"
    vpc_id = module.vpc.bothnode_vpc_id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-northeast-1a"
}

module "sg" {
    source = "../security_group" 
}

resource "aws_instance" "ec2_bothnode" {
    ami                    = "ami-0f7b55661ecbbe44c"
    instance_type          = "m5.xlarge"
    key_name               = "ec2key"

    subnet_id              = module.subnet.bothnode_subnet_id
    vpc_security_group_ids = [module.sg.bothnode_sg_id]
    tags                   = {
        Name               = "EC2BothNode"
    }

    root_block_device {
        volume_size        = 2000
  }
}
