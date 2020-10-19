resource "aws_subnet" "private" {
  count                = length(var.private_subnets)
  availability_zone_id = var.availability_zone_id[count.index]
//  availability_zone    =  var.availability_zone[count.index]
  cidr_block           = var.private_subnet_cidr_range[count.index]

  tags = {
    Name = var.private_subnets[count.index]
    Tier = "Private"
  }
  vpc_id = aws_vpc.this.id
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)
  availability_zone_id    = var.availability_zone_id[count.index]
//  availability_zone       = var.availability_zone[count.index]
  cidr_block              = var.public_subnet_cidr_range[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnets[count.index]
    Tier = "Public"
  }
  vpc_id = aws_vpc.this.id
}



resource "aws_route_table" "private" {
  count = length(var.private_subnet_cidr_range)

  vpc_id = aws_vpc.this.id

  tags = {
    Name = "PrivateRouteTable"
  }

}

resource "aws_route" "private" {
  count = length(var.private_subnet_cidr_range)

  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this[count.index].id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this[0].id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr_range)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr_range)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}
