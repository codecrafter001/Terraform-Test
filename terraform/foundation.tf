data "aws_vpc" "vpc_096f6a913dfa4375f_441a8231" {
  id = "vpc-096f6a913dfa4375f"
}

resource "aws_subnet" "subnet_064d34d3dc729b467_618414fb" {
  vpc_id                  = data.aws_vpc.vpc_096f6a913dfa4375f_441a8231.id
  cidr_block              = "172.31.0.0/20"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_0e3e44c16f23334f9_6d97c50f" {
  vpc_id                  = data.aws_vpc.vpc_096f6a913dfa4375f_441a8231.id
  cidr_block              = "172.31.16.0/20"
  availability_zone       = "ap-south-1c"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_060b820ee16766ef3_e2b0637e" {
  vpc_id                  = data.aws_vpc.vpc_096f6a913dfa4375f_441a8231.id
  cidr_block              = "172.31.32.0/20"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
}

resource "aws_route_table" "rtb_0829fc54bd9bd1d4b_d5429212" {
  vpc_id = data.aws_vpc.vpc_096f6a913dfa4375f_441a8231.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-063a4f60ee091ac6e"
  }
}

data "aws_internet_gateway" "igw_063a4f60ee091ac6e_e1f3d1e7" {
  internet_gateway_id = "igw-063a4f60ee091ac6e"
}