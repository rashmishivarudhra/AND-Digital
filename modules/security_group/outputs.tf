output "sg_alb_id" {
  value = aws_security_group.alb.id
}

output "sg_ec2_id" {
  value = aws_security_group.instance.id
}