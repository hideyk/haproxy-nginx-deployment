resource "aws_internet_gateway" "main_gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "main_route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_gw.id
  }
}

resource "aws_route_table_association" "pri-subnet-association" {
  subnet_id      = aws_subnet.primary.id
  route_table_id = aws_route_table.main_route_table.id
}

resource "aws_route_table_association" "sec-subnet-association" {
  subnet_id      = aws_subnet.secondary.id
  route_table_id = aws_route_table.main_route_table.id
}