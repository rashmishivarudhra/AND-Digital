# variable "vpc_name" {
#   description = "VPC name"
#   type        = string
#   default     = "AND-vpc"
# }
#
# variable "cidr_block" {
#   description = "VPC CIDR block"
#   type        = string
#   default     = "10.0.0.0/16"
# }
#
# variable "instance_tenancy" {
#   description = "VPC instance tenancy (default or dedicated)"
#   type        = string
#   default     = "default"
# }
#
# variable "enable_dns_support" {
#   description = "Enable DNS support"
#   type        = bool
#   default     = true
# }
#
# variable "enable_dns_hostnames" {
#   description = "Enable DNS Hostnames"
#   type        = bool
#   default     = true
# }
#
#
# variable "private_subnets" {
#   description = "Name of the subnets "
#   type        = list
#   default     = ["private-subnet1", "private-subnet2", "private-subnet3"]
# }
#
# variable "public_subnets" {
#   description = "Name of the subnets "
#   type        = list
#   default     = ["public-subnet1", "public-subnet2", "public-subnet3"]
# }
#
# variable "availability_zone" {
#   description = "Name of the availability_zone private/public"
#   type        = list
#   default     = ["euw2-az1", "euw2-az2", "euw2-az3"]
#
# }
variable "asg_availability_zone" {
  description = "Name of the availability_zone private/public"
  type        = list
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

}



# variable "private_subnet_cidr_range" {
#   description = "subnet cidr ranges"
#   type        = list
#   default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
# }
#
# variable "public_subnet_cidr_range" {
#   description = "subnet cidr ranges"
#   type        = list
#   default     = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
# }
#
# variable "internet_gateway" {
#   description = "Whether to create an internet gateway"
#   type        = bool
#   default     = true
# }
#
# variable "internet_gateway_name" {
#   description = "Internet gateway name"
#   type        = string
#   default     = "AND-IGW"
# }
#
# variable "eip_count" {
#   description = "lastic Ip Count"
#   type        = number
#   default     = 3
# }

# variable "AMI_id" {
#   description = "Instance AMI ID"
#   type        = string
#   default     = "ami-0a669382ea0feb73a"
# }
#
# variable "instance_type" {
#   description = "Launch configuration Instance type"
#   type        = string
#   default     = "t2.micro"
# }
#
# variable "instance_SG" {
#   description = "Name of the Security group for Instance "
#   type        = string
#   default     = "AND-EC2-SG"
# }
#
# variable "asg_min_size" {
#   description = "Number of the minimum instance count "
#   type        = number
#   default     = 2
# }
#
# variable "asg_max_size" {
#   description = "Number of the maximum instance count "
#   type        = number
#   default     = 3
# }
#
# variable "ingress_port" {
#   description = "Ingress port values"
#   type        = list
#   default     = [80, 22]
# }
#
# variable "egress_port" {
#   description = "Egress port values"
#   type        = list
#   default     = [0]
# }

variable "alb_SG" {
  description = "Name of the Security group for ALB "
  type        = string
  default     = "AND-ALB-SG"
}

variable "ec2_name" {
  description = "Name of Instance"
  type        = string
  default     = "AND-EC2"
}
