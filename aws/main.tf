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
  source = "./modules/compute"

  region                 = var.region
  subnet_id              = module.vpc.subnet_public_id
  vpc_security_group_ids = [module.vpc.bothnode_default_secuirty_group_id]
}