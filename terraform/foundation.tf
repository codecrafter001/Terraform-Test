data "aws_vpc" "vpc_006ad49e146058669_6312424a" {
  id = "vpc-006ad49e146058669"
}

resource "aws_subnet" "subnet_0de9a1e1553e1806a_cbf1fdb2" {
  vpc_id                  = data.aws_vpc.vpc_006ad49e146058669_6312424a.id
  cidr_block              = "172.31.64.0/20"
  availability_zone       = "us-east-1f"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_007975abb691f5086_a87b6c1f" {
  vpc_id                  = data.aws_vpc.vpc_006ad49e146058669_6312424a.id
  cidr_block              = "172.31.80.0/20"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_06fe4b2e3d8ab30e8_0aa66a6d" {
  vpc_id                  = data.aws_vpc.vpc_006ad49e146058669_6312424a.id
  cidr_block              = "172.31.48.0/20"
  availability_zone       = "us-east-1e"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_028f09f11e9f2356c_9df00f99" {
  vpc_id                  = data.aws_vpc.vpc_006ad49e146058669_6312424a.id
  cidr_block              = "172.31.16.0/20"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_08c8642d18a050083_d60657db" {
  vpc_id                  = data.aws_vpc.vpc_006ad49e146058669_6312424a.id
  cidr_block              = "172.31.32.0/20"
  availability_zone       = "us-east-1d"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_0c331a35bac8b36dc_2bf45688" {
  vpc_id                  = data.aws_vpc.vpc_006ad49e146058669_6312424a.id
  cidr_block              = "172.31.0.0/20"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_route_table" "rtb_022e5cf32607ba4b7_d650e310" {
  vpc_id = data.aws_vpc.vpc_006ad49e146058669_6312424a.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-067b2d3005af25497"
  }
}

data "aws_internet_gateway" "igw_067b2d3005af25497_52573833" {
  internet_gateway_id = "igw-067b2d3005af25497"
}