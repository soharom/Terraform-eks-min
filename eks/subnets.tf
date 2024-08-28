data "aws_availability_zones" "available" {
   state = "available"
  
}

resource "aws_subnet" "public_subnet" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.${10+count.index}.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "PublicSubnet-${data.aws_availability_zones.available.names[count.index]}"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}
resource "aws_subnet" "private_subnet" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.20.${20+count.index}.0/24"
  availability_zone= "${data.aws_availability_zones.available.names[count.index]}"
  map_public_ip_on_launch = false
  tags = {
    "Name" = "PrivateSubnet-${data.aws_availability_zones.available.names[count.index]}"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}



