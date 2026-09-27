data "aws_vpc" "vpc_08fe12ce7261c0ff8_cccdbe8e" {
  id = "vpc-08fe12ce7261c0ff8"
}

resource "aws_subnet" "subnet_0a25b61c8743c54af_c84cc3d0" {
  vpc_id                  = data.aws_vpc.vpc_08fe12ce7261c0ff8_cccdbe8e.id
  cidr_block              = "172.31.16.0/20"
  availability_zone       = "ap-south-1c"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_0eab8241c808097b4_46a4941e" {
  vpc_id                  = data.aws_vpc.vpc_08fe12ce7261c0ff8_cccdbe8e.id
  cidr_block              = "172.31.32.0/20"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_045e107acc9b9dfff_3e9a745b" {
  vpc_id                  = data.aws_vpc.vpc_08fe12ce7261c0ff8_cccdbe8e.id
  cidr_block              = "172.31.0.0/20"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true
}

resource "aws_route_table" "rtb_0e1ce943b1ad77e78_e2f8527a" {
  vpc_id = data.aws_vpc.vpc_08fe12ce7261c0ff8_cccdbe8e.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0fe5a09676e826894"
  }
}

data "aws_internet_gateway" "igw_0fe5a09676e826894_3f3a8c1f" {
  internet_gateway_id = "igw-0fe5a09676e826894"
}