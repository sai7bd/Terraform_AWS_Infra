resource "aws_eip" "this" {
  vpc = true

  tags = {
    Name = "${var.env}-nat"
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "${var.env}-nat"
  }

  depends_on = [aws_internet_gateway.this]
}

resource "aws_eip" "nat2" {
  vpc = true

  tags = {
    Name = "${var.env}-nat"
  }
}
resource "aws_nat_gateway" "nat2" {
  allocation_id = aws_eip.nat2.id
  subnet_id     = aws_subnet.public[1].id

  tags = {
    Name = "${var.env}-nat"
  }

  depends_on = [aws_internet_gateway.this]
}

