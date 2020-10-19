variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "AND-vpc"
}

variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  description = "VPC instance tenancy (default or dedicated)"
  type        = string
  default     = "default"
}

variable "enable_dns_support" {
  description = "Enable DNS support"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS Hostnames"
  type        = bool
  default     = true
}


variable "private_subnets" {
  description = "Name of the subnets "
  type        = list
  default     = ["private-subnet1", "private-subnet2", "private-subnet3"]
}

variable "public_subnets" {
  description = "Name of the subnets "
  type        = list
  default     = ["public-subnet1", "public-subnet2", "public-subnet3"]
}

variable "availability_zone_id" {
  description = "Name of the availability_zone private/public"
  type        = list
  default     = ["euw2-az1", "euw2-az2", "euw2-az3"]

}

variable "availability_zone" {
  description = "Name of the availability_zone private/public"
  type        = list
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]

}

variable "private_subnet_cidr_range" {
  description = "subnet cidr ranges"
  type        = list
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnet_cidr_range" {
  description = "subnet cidr ranges"
  type        = list
  default     = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
}

variable "internet_gateway" {
  description = "Whether to create an internet gateway"
  type        = bool
  default     = true
}

variable "internet_gateway_name" {
  description = "Internet gateway name"
  type        = string
  default     = "AND-IGW"
}

variable "eip_count" {
  description = "lastic Ip Count"
  type        = number
  default     = 3
}

variable "nat_gateway" {
  description = "Name of Nat Gateway"
  type        = string
  default     = "AND-NAT-gateway"
}
