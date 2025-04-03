variable "aws_region" {
    type = string
    default = "eu-west-2"  
}

variable "rhel-ami" {
  description = "RHEL 9 AMI"
}

variable "instance_type" {
  description = "EC2 Instance type"
  type = string
  default = "t2.micro"
}

variable "key_name" {
  description = "SSH Key pair name"
  type = string
}