
resource "aws_iam_role" "ec2_ssm" {
  name = "ec2_ssm"

  assume_role_policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": {
    "Effect": "Allow",
     "Principal": {"Service": "ssm.amazonaws.com"},
     "Action": "sts:AssumeRole"
   }
 }

EOF
}

resource "aws_iam_instance_profile" "ec2_ssm_instance_profile" {
  name = "ec2_ssm_instance_profile"
  role = aws_iam_role.ec2_ssm.name
}


resource "aws_iam_role_policy_attachment" "ssm_policy_attach" {
  role       = aws_iam_role.ec2_ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_ssm_activation" "ssm_activation" {
  name               = "ec2_ssm_activation"
  description        = "Ec2 SSM activation "
  iam_role           = aws_iam_role.ec2_ssm.id
  registration_limit = "5"
  depends_on         = [aws_iam_role_policy_attachment.ssm_policy_attach]
}

