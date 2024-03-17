resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.azs[count.index % length(var.azs)]

  tags = merge(
    { Name = "${var.env}-private-${var.azs[count.index % length(var.azs)]}" }, // Same here, wrap index around
    var.private_subnet_tags
  )
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnets[count.index]
  availability_zone = var.azs[count.index % length(var.azs)]

  tags = merge(
    { Name = "${var.env}-public-${var.azs[count.index % length(var.azs)]}" },
    var.public_subnet_tags
  )
}
