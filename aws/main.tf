terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  region = var.region
}

module "compute" {
  source        = "./modules/compute"
  region        = var.region
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  /* passing output values from vpc module */
  subnet_id              = module.vpc.subnet_public_id
  vpc_security_group_ids = [module.vpc.bothnode_default_secuirty_group_id]
}