resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_block

  tags = {
    "name" = local.company
  }
}

data "aws_vpc" "pepepe" {
  id = aws_vpc.my_vpc.id
}

resource "aws_subnet" "subnet1" {
  count = length(var.subnets)

  vpc_id = aws_vpc.my_vpc.id

  cidr_block = var.subnets[count.index].cidr_block
}

resource "aws_security_group" "pepepe" {
  vpc_id = data.aws_vpc.pepepe.id

  dynamic "ingress" {
    for_each = var.egress_rules

    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}
