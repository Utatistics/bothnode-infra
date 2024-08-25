variable "region" {
  type        = string
  description = "The AWS region assocaited with the resource"
}

variable "ami" {
  description = "The AMI ID to use for EC2 instances"
  type        = string
}

variable "key_name" {
  description = "The key pair name to use for EC2 instances"
  type        = string
}

variable "subnet_id" {
  type        = string
  description = "The id for the subnet to which the instance is attached"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "The list of ids for the security group to which the instance is attached"
}