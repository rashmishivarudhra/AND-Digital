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