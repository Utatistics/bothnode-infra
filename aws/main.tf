terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

module "network" {
  source = "./modules/network"
}

module "compute" {
  source = "./modules/compute"
}
