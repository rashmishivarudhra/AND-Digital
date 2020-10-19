resource "aws_lb" "this" {
  name               = "AND-aws-lb"
  load_balancer_type = "application"
  subnets            = var.public_subnet_id
  security_groups    = [var.sg_alb_id]
  #depends_on         = [aws_subnet.private, aws_subnet.public]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.lb_ingress_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.asg.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group" "asg" {
  name     = "AND-alb-target-group"
  port     = var.lb_ingress_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}
resource "aws_lb_listener_rule" "alb" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100

  condition {
    path_pattern {
      values = ["*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.asg.arn
  }
}
