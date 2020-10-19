variable "dynamodb_table" {
  description = "DynamoDB table name for terraform lock."
  type        = string
  default     = "AND-dynamodb-table"
}