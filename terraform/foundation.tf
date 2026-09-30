data "aws_vpc" "vpc_041d35e78174e8bf4_75fd5433" {
  id = "vpc-041d35e78174e8bf4"
}

resource "aws_subnet" "subnet_0cc33aa9e58ca5daa_0fd504a3" {
  vpc_id                  = data.aws_vpc.vpc_041d35e78174e8bf4_75fd5433.id
  cidr_block              = "172.31.16.0/20"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_09159df420049bc3a_266ccf66" {
  vpc_id                  = data.aws_vpc.vpc_041d35e78174e8bf4_75fd5433.id
  cidr_block              = "172.31.64.0/20"
  availability_zone       = "us-east-1f"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_0c3a8f6c4789c2fc0_2d098f5f" {
  vpc_id                  = data.aws_vpc.vpc_041d35e78174e8bf4_75fd5433.id
  cidr_block              = "172.31.32.0/20"
  availability_zone       = "us-east-1d"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_02dadc23105f456c7_e02172d9" {
  vpc_id                  = data.aws_vpc.vpc_041d35e78174e8bf4_75fd5433.id
  cidr_block              = "172.31.80.0/20"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_05903c67b2d9cf30e_d79e046f" {
  vpc_id                  = data.aws_vpc.vpc_041d35e78174e8bf4_75fd5433.id
  cidr_block              = "172.31.48.0/20"
  availability_zone       = "us-east-1e"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_0b6636ac6bf13e7e5_914d31f6" {
  vpc_id                  = data.aws_vpc.vpc_041d35e78174e8bf4_75fd5433.id
  cidr_block              = "172.31.0.0/20"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_route_table" "rtb_003b648347930edfc_24811887" {
  vpc_id = data.aws_vpc.vpc_041d35e78174e8bf4_75fd5433.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-069cc92d846c417f0"
  }
}

data "aws_internet_gateway" "igw_069cc92d846c417f0_f19bc3c9" {
  internet_gateway_id = "igw-069cc92d846c417f0"
}