resource "aws_launch_configuration" "this" {
  image_id             = var.AMI_id
  iam_instance_profile = var.instance_profile
  instance_type        = var.instance_type
  security_groups      = [var.sg_ec2_id]
//  name               = "AND-webapp-Launch-configuration
//  key_name           = "AND"
  user_data            = data.template_file.user_data.rendered


  lifecycle {
    create_before_destroy = true
  }


}

resource "aws_autoscaling_group" "this" {
  launch_configuration = aws_launch_configuration.this.id
  name                 = "And-webapp-asg-${aws_launch_configuration.this.name}"
  vpc_zone_identifier  = var.private_subnet_id
  max_size                  = var.asg_max_size
  min_size                  = var.asg_min_size
  desired_capacity          = 2
  health_check_type         = "EC2"
  health_check_grace_period = 60
  target_group_arns         = [var.aws_lb_target_group]
  depends_on                = [aws_launch_configuration.this]

  tags = [{

      key                 = "Environment"
      value               = "dev"
      propagate_at_launch = true
    },
    {
      key                 = "Name"
      value               = var.ec2_name
      propagate_at_launch = true
    }
  ]


}

data "template_file" "user_data" {
  template = file("user-data.sh")
}
