variable "instance_SG" {
  description = "Name of the Security group for Instance "
  type        = string
  default     = "AND-EC2-SG"
}

variable "vpc_id" {
  description = "VPC id "
  type        = string
}

variable "alb_SG" {
  description = "Name of the Security group for ALB "
  type        = string
  default     = "AND-ALB-SG"
}

variable "ingress_port" {
  description = "Ingress port values"
  type        = list
  default     = [80, 22]
}

variable "egress_port" {
  description = "Egress port values"
  type        = list
  default     = [0]
}


# variable "web_sg_name" {
#   description = "web-security-group"
#   type        = list
#   default     = [0]
# }
