resource "aws_eip" "this" {
  count = var.eip_count

  vpc = true

  tags = {
    Name = var.nat_gateway
  }
}

# data "aws_subnet_ids" "this" {
#   vpc_id = aws_vpc.this.id
# }
#
# data "aws_subnet" "this" {
#   for_each = data.aws_subnet_ids.this.ids
#   id       = each.value
# }
#
# output "subnet_cidr_blocks" {
#   value = [for s in data.aws_subnet.this : s.cidr_block]
# }
#
# resource "aws_nat_gateway" "this" {
#   for_each      = data.aws_subnet_ids.this.ids
#
#     allocation_id = aws_eip.this.*[count.index].id
#     subnet_id = each.value
#
#     tags = {
#       Name = "AND-nat_gateway"
#     }
#
# }

resource "aws_nat_gateway" "this" {
  depends_on = [aws_internet_gateway.this]

  count = length(var.public_subnet_cidr_range)

  allocation_id = aws_eip.this[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  # tags =
  #   {
  #     Name        = "AND-NAT-Gateway"
  #
  #
  # }
}
#
# resource "aws_route" "private_nat" {
#   # for_each = var.nat_gateway_subnet == null ? {} : zipmap(
#   # var.subnets[var.internet_gateway_subnet],
#   # var.subnets[var.nat_gateway_subnet]
#   # )
#     route_table_id = aws_vpc.this.default_route_table_id
#     nat_gateway_id = aws_nat_gateway.this.*.id
#     destination_cidr_block ="0.0.0.0/0"
# }
