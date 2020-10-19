variable "asg_availability_zone" {
  description = "Name of the availability_zone private/public"
  type        = list
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

}

variable "AMI_id" {
  description = "Instance AMI ID"
  type        = string
  default     = "ami-0a669382ea0feb73a"
}

variable "instance_type" {
  description = "Launch configuration Instance type"
  type        = string
  default     = "t2.micro"
}

variable "asg_min_size" {
  description = "Number of the minimum instance count "
  type        = number
  default     = 2
}

variable "asg_max_size" {
  description = "Number of the maximum instance count "
  type        = number
  default     = 3
}

variable "ec2_name" {
  description = "Name of Instance"
  type        = string
  default     = "AND-EC2"
}

variable "instance_profile" {
  description = "IAM instance rpofile"
  type        = string

}

variable "sg_ec2_id" {
  description = "Instance security group id"
  type        = string

}

variable "private_subnet_id" {
  description = "Private subnet ids"
  type        = list

}

variable "aws_lb_target_group" {
  description = "Load balancer target group"
  type        = string
}
