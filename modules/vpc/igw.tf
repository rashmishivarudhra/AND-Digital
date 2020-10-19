resource "aws_internet_gateway" "this" {
  count  = var.internet_gateway == true ? 1 : 0
  vpc_id = aws_vpc.this.id
  tags = {
    Name = var.internet_gateway_name
  }
}

# resource "aws_route" "this" {
#
#   count                  = var.internet_gateway == true ? 1 : 0
#   route_table_id         = aws_vpc.this.default_route_table_id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.this[0].id
#
# }
