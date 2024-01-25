variable "access_key"{
  
}
variable "secret_access_key"{
  
}
variable "aws_region" {
    description = "Region in which AWS Resources to be created"
    type = string
    default ="us-east-1"
  
}
variable "instance_type"{
    description="EC2 Instance type"
    type =string
    default="t3.micro"
}
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}

