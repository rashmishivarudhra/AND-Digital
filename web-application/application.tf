provider "aws" {                                #default provider, for implicit declaration
  region              = "eu-west-2"
}

# module "provider" {
#   source = "../modules/Provider/"
# }

module "vpc" {
  source = "../modules/vpc/"
  vpc_name = "AND-VPC"
  internet_gateway_name = "AND-igw"
  nat_gateway = "AND_nat"
  //  availability_zone = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}
module "asg" {
  source = "../modules/asg/"
  instance_profile = module.iam.instance_profile
  sg_ec2_id         = module.security_group.sg_ec2_id
  private_subnet_id = module.vpc.private_subnet_id
  aws_lb_target_group = module.lb.aws_lb_target_group
//  asg_availability_zone = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

module "security_group" {
  source = "../modules/security_group/"
  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "../modules/iam/"
}

module "lb" {
  source = "../modules/alb/"
  vpc_id = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
#private_subnet_id = module.vpc.private_subnet_id
  sg_alb_id = module.security_group.sg_alb_id
}


terraform {
  backend "s3" {
    #depends_on = [aws_s3_bucket.this, aws_dynamodb_table.this]
    bucket     = "and-s3-backend"
    key        = "remotebackend.tfstate"
    region     = "eu-west-2"
    #state locking using dynamodb
    dynamodb_table = "AND-dynamodb-table"

  }
}