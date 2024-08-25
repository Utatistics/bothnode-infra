variable "region" {
  type        = string
  description = "The AWS region to deploy resources in"
  default     = "ap-northeast-1"
}
variable "ami" {
  description = "The AMI ID to use for EC2 instances"
  type        = string
}

variable "key_name" {
  description = "The key pair name to use for EC2 instances"
  type        = string
}