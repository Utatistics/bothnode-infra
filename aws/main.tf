terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" 
    }
  }
}

provider "aws" {
  region = var.region
}

module "network" {
  source = "./modules/vpc"
  region = var.region
}

module "compute" {
  source = "./modules/compute"
  region = var.region  
}
