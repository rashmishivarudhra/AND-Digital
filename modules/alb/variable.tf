variable "lb_ingress_port" {
  description = "Ingress port values"
  type        = number
  default     = 80
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "public_subnet_id" {
  description = "List of public subnet id's"
  type        = list
}

variable "sg_alb_id" {
  description = "ALB security group id"
  type        = string
}

