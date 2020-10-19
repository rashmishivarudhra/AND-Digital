resource "aws_security_group" "instance" {
  name   = var.instance_SG
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.ingress_port[0]
    to_port     = var.ingress_port[0]
    protocol    = "tcp"


    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.ingress_port[1]
    to_port     = var.ingress_port[1]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = var.egress_port[0]
    to_port     = var.egress_port[0]
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # tags = {
  #   Name = var.web_sg_name
  # }
}

resource "aws_security_group" "alb" {
  name   = var.alb_SG
  vpc_id = var.vpc_id

  # Allow inbound HTTP requests
  ingress {
    from_port   = var.ingress_port[0]
    to_port     = var.ingress_port[0]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound requests
  egress {
    from_port   = var.egress_port[0]
    to_port     = var.egress_port[0]
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
