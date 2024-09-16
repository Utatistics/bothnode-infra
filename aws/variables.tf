variable "region" {
  type        = string
  description = "The AWS region to deploy resources in"
  default     = "eu-west-2" # "ap-northeast-1"
}

variable "ami" {
  description = "The AMI ID to use for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "m5.xlarge"
}

variable "key_name" {
  description = "The key pair name to use for EC2 instances"
  type        = string
}
