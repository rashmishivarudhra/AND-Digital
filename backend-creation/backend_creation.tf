provider "aws"{
  region = "eu-west-2"
}

module "s3" {
  source = "../modules/s3/"
}

module "dynamodb" {
  source = "../modules/dynamo-db"
}
